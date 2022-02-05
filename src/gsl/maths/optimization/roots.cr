require "../../base/*"
require "./find_bracket"

module GSL::Roots
  enum TypeBracketing
    Bisection
    FalsePosition
    BrentDekker

    def to_unsafe
      case self
      in .bisection?
        LibGSL.gsl_root_fsolver_bisection
      in .false_position?
        LibGSL.gsl_root_fsolver_falsepos
      in .brent_dekker?
        LibGSL.gsl_root_fsolver_brent
      end
    end

    def to_s
      LibGSL.gsl_root_fsolver_name(to_unsafe)
    end
  end

  enum TypePolishing
    Newton
    Secant
    Steffenson

    def to_unsafe
      case self
      in .newton?
        LibGSL.gsl_root_fdfsolver_newton
      in .secant?
        LibGSL.gsl_root_fdfsolver_secant
      in .steffenson?
        LibGSL.gsl_root_fdfsolver_steffenson
      end
    end

    def to_s
      LibGSL.gsl_root_fdfsolver_name(to_unsafe)
    end
  end

  # High-level interface to root finder. Finds root of function f between x_lower and x_upper,
  # due to nature of used algorithms, signs of function in x_lower and x_upper must differ
  # `algorithm` - root bracketing algorithm to be used
  # returns nil if number of iterations = max_iter is exceeded
  # returns root value if precision = eps achieved
  def self.find_root?(x_lower : Float64, x_upper : Float64, eps : Float64 = 1e-9, *,
                      algorithm : GSL::Roots::TypeBracketing = GSL::Roots::TypeBracketing::BrentDekker,
                      max_iter = 1000, &f : GSL::Function)
    raw = LibGSL.gsl_root_fsolver_alloc(algorithm.to_unsafe)
    function = GSL.wrap_function(f)
    LibGSL.gsl_root_fsolver_set(raw, pointerof(function), x_lower, x_upper)
    max_iter.times do
      LibGSL.gsl_root_fsolver_iterate(raw)
      if LibGSL::Code.new(LibGSL.gsl_root_test_interval(raw.value.x_lower, raw.value.x_upper, eps, 0.0)) == LibGSL::Code::GSL_SUCCESS
        result = raw.value.root
        LibGSL.gsl_root_fsolver_free(raw)
        return result
      end
    end
    LibGSL.gsl_root_fsolver_free(raw)
    return nil
  end

  # High-level interface to root finder. Finds root of function f between x_lower and x_upper,
  # due to nature of used algorithms, signs of function in x_lower and x_upper must differ
  # `algorithm` - root bracketing algorithm to be used
  # raises IterationsLimitExceeded if number of iterations = max_iter is exceeded
  # returns root value if precision = eps achieved
  def self.find_root(x_lower : Float64, x_upper : Float64, eps : Float64 = 1e-9, *,
                     algorithm : GSL::Roots::TypeBracketing = GSL::Roots::TypeBracketing::BrentDekker,
                     max_iter = 1000, &f : GSL::Function)
    find_root?(x_lower, x_upper, eps, algorithm: algorithm, max_iter: max_iter, &f) || raise IterationsLimitExceeded.new("roots bracketing didn't converge")
  end

  # High-level interface to root polishing. Finds root of function f near `initial_guess`,
  # `algorithm` - root bracketing algorithm to be used
  # returns nil if number of iterations = max_iter is exceeded or current root estimation is outside `x_possible` range.
  # returns root value if precision = eps achieved
  def self.polish_root?(initial_guess : Float64, eps : Float64 = 1e-9, *,
                        x_possible : Range(Float64)?,
                        algorithm : GSL::Roots::TypePolishing = GSL::Roots::TypePolishing::Steffenson,
                        max_iter = 1000, &f : GSL::FunctionFDF)
    raw = LibGSL.gsl_root_fdfsolver_alloc(algorithm.to_unsafe)
    function = GSL.wrap_function(f)
    LibGSL.gsl_root_fdfsolver_set(raw, pointerof(function), initial_guess)
    x0 = initial_guess
    max_iter.times do
      LibGSL.gsl_root_fdfsolver_iterate(raw)
      x1 = raw.value.root
      if LibGSL::Code.new(LibGSL.gsl_root_test_delta(x1, x0, eps, 0.0)) == LibGSL::Code::GSL_SUCCESS
        LibGSL.gsl_root_fdfsolver_free(raw)
        return x1
      end
      x0 = x1
    end
    LibGSL.gsl_root_fsolver_free(raw)
    return nil
  end
end
