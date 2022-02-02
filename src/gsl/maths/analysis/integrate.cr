module GSL::Integration
  def self.qng(function : Proc(Float64, Float64), a : Float64, b : Float64, *, epsabs : Float64 = 0.0, epsrel : Float64 = 0.0)
    f = GSL.wrap_function(function)
    if epsabs.zero? && epsrel.zero?
      epsabs = 1e-9
    end
    code = LibGSL::Code.new(LibGSL.gsl_integration_qng(pointerof(f), a, b, epsabs, epsrel, out result, out abserr, out neval))
    return result, abserr, neval
  end
end
