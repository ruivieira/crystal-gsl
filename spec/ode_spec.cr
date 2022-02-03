require "./spec_helper"

class TestODE < GSL::ODE::System
  def initialize(@mu : Float64)
    super(2)
  end

  def function(t : LibC::Double, y : Slice(LibC::Double), dydt : Slice(LibC::Double))
    dydt[0] = y[1]
    dydt[1] = -y[0] - @mu*y[1]*(y[0]*y[0] - 1)
  end
end

describe GSL::ODE do
  it "integrates system without jacobian with natural step" do
    p "1"
    sys = TestODE.new(10.0)
    p "2"
    ode = GSL::ODE::Driver.new(sys, 1e-3, epsabs: 1e-6)
    p "3"
    y0 = [1, 0]
    y, t = ode.evolve(y0, 0, 15.0)
    p "4"
    pp! y, t
  end
end
