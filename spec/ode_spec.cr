require "./spec_helper"

class TestODE < GSL::ODE::System
  def initialize(@k : Float64)
    super(2)
  end

  def function(t : LibC::Double, y : Slice(LibC::Double), dydt : Slice(LibC::Double))
    dydt[0] = y[1]
    dydt[1] = -@k * y[0]
  end
end

describe GSL::ODE do
  it "integrates system without jacobian with natural step" do
    sys = TestODE.new(1.0)
    ode = GSL::ODE::Driver.new(sys, 1e-2, epsabs: 1e-9)
    y0 = [1, 0]
    y, t = ode.evolve(y0, 0, Math::PI/2)
    y.last[0].should be_close(0.0, 1e-6)
    y.last[1].should be_close(-1, 1e-6)
    t.last.should be_close(Math::PI/2, 1e-6)
    y, t = ode.evolve(y.last, Math::PI/2, Math::PI*2)
    y.last[0].should be_close(1, 1e-6)
    y.last[1].should be_close(0, 1e-6)
    t.last.should be_close(Math::PI*2, 1e-6)
  end

  it "integrates system without jacobian with given time values" do
    sys = TestODE.new(1.0)
    ode = GSL::ODE::Driver.new(sys, 1e-2, epsabs: 1e-9)
    y0 = [1, 0]
    results = ode.evolve(y0, [0, Math::PI/2, Math::PI, 3*Math::PI/2, Math::PI*2])
    pp! results
  end
end
