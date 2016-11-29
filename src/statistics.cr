require "math"
require "random"
require "./libgsl.cr"

module Statistics
  abstract class DiscreteDistribution
    abstract def sample : Int
  end

  # A symmetric probability distribution whereby a finite number of values are
  # equally likely to be observed: every one of *n* values has equal probability *1/n*.
  class DiscreteUniform < DiscreteDistribution
    # Create a new discrete uniform object with parameters *min* and *man*
    #
    # ```
    # u = DiscreteUniform.new 0, 2
    # ```
    def initialize(@min : Int64, @max : Int64)
    end

    # Returns a random integer from *min* to *max*
    #
    # ```
    # u = DiscreteUniform.new 0, 2
    # u.sample # => 1
    # ```
    def sample : Int
      DiscreteUniform.sample(@min, @max)
    end

    # Returns a random integer from *min* to *max*
    #
    # ```
    # DiscreteUniform.sample(0, 2) # => 1
    # ```
    def self.sample(min : Int, max : Int)
      if max < min
        raise ArgumentError.new("Maximum cannot be smaller than minimum")
      end
      Random.new.rand(min..max)
    end

    # Returns an array of random integers from *min* to *max*
    #
    # ```
    # DiscreteUniform.sample(4, 0, 2) # => [0, 2, 1, 1, 2]
    # ```
    def self.sample(n : Int, min : Int, max : Int)
      (0...n).map { |i| DiscreteUniform.sample min, max }
    end
  end

  class Exponential
    def self.sample(mu : Float64) : Float64
      return LibGSL.gsl_ran_exponential(GSL::RNG, mu)
    end

    def self.sample(x : Float64, mu : Float64) : Float64
      return LibGSL.gsl_ran_exponential_pdf(x, mu)
    end
  end

  class Normal
    def initialize(@mean : Float64, @std : Float64)
    end

    def pdf(x : Float64) : Float64
      return Normal.pdf(x, @mean, @std)
    end

    def self.pdf(x : Float64, mean : Float64, std : Float64) : Float64
      return LibGSL.gsl_ran_gaussian_pdf(x - mean, std)
    end

    def sample : Float64
      return Normal.nextGaussian(@mean, @std)
    end

    def sample(n : Int32) : Array(Float64)
      return Normal.sample(n, @mean, @std)
    end

    def self.sample(mean : Float64, std : Float64) : Float64
      return Normal.nextGaussian(mean, std)
    end

    def self.sample(n : Int32, mean : Float64, std : Float64) : Array(Float64)
      return Array.new (n) { self.sample(mean, std) }
    end

    def self.nextGaussian(mean : Float64, std : Float64) : Float64
      return LibGSL.gsl_ran_gaussian(GSL::RNG, std) + mean
    end

    def nextGaussian : Float64
      self.nextGaussian(@mean, @std)
    end
  end

  class Poisson < DiscreteDistribution
    def initialize(@mu : Float64)
    end

    def sample : Int
      return Poisson.sample(@mu)
    end

    def self.sample(mu : Float64) : UInt64
      return LibGSL.gsl_ran_poisson(GSL::RNG, mu)
    end

    def self.sample(n : Int, mu : Float64) : Array(UInt64)
      return (0..n).map { |x| self.sample(mu) }
    end

    def self.pdf(k : UInt64, mu : Float64) : Float64
      return LibGSL.gsl_ran_poisson_pdf(k, mu)
    end
  end

  class Multinomial
    def self.sample(probs : Array(Float64)) : Array(UInt64)
      k = probs.size
      x = Array(UInt64).new(k, 10.to_u64)
      n = x.sum
      LibGSL.gsl_ran_multinomial(GSL::RNG, k, n, probs, x)
      return x
    end
  end

  class MultivariateNormal
    def self.sample(mean : Vector, cov : Matrix)
      work = cov.copy
      n = mean.size
      result = Vector.new n

      LibGSL.gsl_linalg_cholesky_decomp(work.pointer)

      (0...n).each do |k|
        result[k] = Normal.sample(0.0, 1.0)
      end

      LibGSL.gsl_blas_dtrmv(LibGSL::CBLAS_UPLO_t::CblasLower, LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, LibGSL::CBLAS_DIAG_t::CblasNonUnit, work.pointer, result.pointer)

      LibGSL.gsl_vector_add(result.pointer, mean.pointer)

      LibGSL.gsl_matrix_free(work.pointer)

      return result
    end
  end

  class Gamma
    def initialize(@shape : Float64, @scale : Float64)
    end

    def pdf(x : Float64) : Float64
      return Gamma.pdf(x, @shape, @scale)
    end

    def self.pdf(x : Float64, shape : Float64, scale : Float64) : Float64
      return LibGSL.gsl_ran_gamma_pdf(x, shape, scale)
    end

    def sample : Float64
      return Gamma.next(@shape, @scale)
    end

    def sample(n : Int32) : Array(Float64)
      return Gamma.sample(n, @shape, @scale)
    end

    def self.sample(shape : Float64, scale : Float64) : Float64
      return Gamma.next(shape, scale)
    end

    def self.sample(n : Int32, shape : Float64, scale : Float64) : Array(Float64)
      return Array.new (n) { Gamma.sample(shape, scale) }
    end

    def self.next(shape : Float64, scale : Float64) : Float64
      rate = 1.0 / scale
      return LibGSL.gsl_ran_gamma(GSL::RNG, shape, rate)
    end

    def next : Float64
      Gamma.next(@shape, @scale)
    end
  end

  def self.mean(data : Array(Float64)) : Float64
    return data.sum / data.size
  end

  def self.cumulative_sum(data : Array(Float64)) : Array(Float64)
    cumsum = data.clone
    (1..cumsum.size - 1).each { |i| cumsum[i] += cumsum[i - 1] }
    return cumsum
  end

  def self.normalise(data : Array(Float64)) : Array(Float64)
    sum = data.sum
    return data.map { |x| x / sum }
  end

  struct LinearRegression
    getter intercept, x

    def initialize(@intercept : Float64, @x : Float64)
    end
  end

  def self.linreg(x : Array(Float64), y : Array(Float64)) : LinearRegression
    intercept = 0.0
    x_est = 0.0
    cov00 = 0.0
    cov01 = 0.0
    cov11 = 0.0
    sumsq = 0.0
    LibGSL.gsl_fit_linear(x, 1, y, 1, x.size, pointerof(intercept),
      pointerof(x_est), pointerof(cov00), pointerof(cov01), pointerof(cov11), pointerof(sumsq))
    return LinearRegression.new intercept, x_est
  end

  # returns an equally space interval starting from *s* and ending in *e* (inclusive)
  #
  # ```
  # linspace(1.0, 10.0, 10) # => [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
  # ```
  def self.linspace(s : Float64, e : Float64, num : Int) : Array(Float64)
    delta = (e - s)/(num - 1.0)
    return Array.new(num) { |i| s + i * delta }
  end
end
