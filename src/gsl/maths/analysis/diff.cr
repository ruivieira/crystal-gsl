module GSL
  enum Diff::Direction
    Central
    Forward
    Backward
  end

  def self.diff(function : GSL::Function, x : Float64, step : Float64 = 0.01, dir : Diff::Direction = Diff::Direction::Central)
    f = wrap_function(function)
    result = uninitialized Float64
    abserr = uninitialized Float64
    case dir
    in .central?
      code = LibGSL.gsl_deriv_central(pointerof(f), x, step, pointerof(result), pointerof(abserr))
    in .forward?
      code = LibGSL.gsl_deriv_forward(pointerof(f), x, step, pointerof(result), pointerof(abserr))
    in .backward?
      code = LibGSL.gsl_deriv_backward(pointerof(f), x, step, pointerof(result), pointerof(abserr))
    end
    code = LibGSL::Code.new(code)
    return result, abserr
  end

  def self.diff(x : Float64, step : Float64 = 0.01, dir : Diff::Direction = Diff::Direction::Central, &f : GSL::Function)
    diff(f, x, step, dir)
  end
end
