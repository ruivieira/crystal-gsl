require "math"
require "random"
require "./libgsl.cr"

module Statistics

  class Normal
    def initialize(@mean : Float64, @std : Float64)
    end

    def pdf(x : Float64) : Float64
      return Normal.pdf(x, @mean, @std)
    end

    def self.pdf(x : Float64, mean : Float64, std : Float64) : Float64
      return LibGSL.gsl_ran_gaussian_pdf(x - mean, std)
    end

    def sample() : Float64
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
      return LibGSL.gsl_ran_gaussian($rng, std) + mean
    end

    def nextGaussian() : Float64
      self.nextGaussian(@mean, @std)
    end
end

class MultivariateNormal

  def self.sample(mean : Vector, cov : Matrix)
    work = cov.copy()
    n = mean.size()
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

  def sample() : Float64
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
    return LibGSL.gsl_ran_gamma($rng, shape, rate)
  end

  def next() : Float64
    Gamma.next(@shape, @scale)
  end
end

def self.mean(data : Array(Float64)) : Float64
  return data.sum / data.size
end

def self.cumulative_sum(data : Array(Float64)) : Array(Float64)
    cumsum = data.clone
    (1..cumsum.size-1).each {|i| cumsum[i] += cumsum[i-1] }
    return cumsum
  end

def self.normalise(data : Array(Float64)) : Array(Float64)
  sum = data.sum
  return data.map {|x| x / sum}
end

end
