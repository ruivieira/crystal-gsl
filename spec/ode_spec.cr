require "./spec_helper"

class TestODE < GSL::ODE::System
  def initialize(@k : Float64)
    super(2)
  end

  def function(t, y, dydt)
    dydt[0] = y[1]
    dydt[1] = -@k * y[0]
  end
end

class TestODEJacobian < GSL::ODE::JacobianSystem
  def initialize(@mu : Float64)
    super(2)
  end

  def function(t, y, dydt)
    dydt[0] = y[1]
    dydt[1] = -y[0] - @mu * y[1]*(y[0]*y[0] - 1)
  end

  def jacobian(t, y, dfdy, dfdt)
    dfdy[0] = 0
    dfdy[1] = 1.0
    dfdy[2] = -2.0*@mu*y[0]*y[1] - 1.0
    dfdy[3] = -@mu*(y[0]*y[0] - 1.0)
    dfdt[0] = 0.0
    dfdt[1] = 0.0
  end
end

describe GSL::ODE do
  describe "integrates system without jacobian" do
    it "with natural step" do
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

    it "with given time values" do
      sys = TestODE.new(1.0)
      ode = GSL::ODE::Driver.new(sys, 1e-2, epsabs: 1e-9)
      y0 = [0, 10]
      results = ode.evolve(y0, [0, Math::PI/2, Math::PI, 3*Math::PI/2, Math::PI*2])
      r = results.map { |y| y.map(&.round).to_a }
      r.should eq [[0.0, 10.0], [10.0, 0.0], [0.0, -10.0], [-10.0, 0.0], [0.0, 10.0]]
    end

    it "with given time step yielding results" do
      sys = TestODE.new(1.0)
      ode = GSL::ODE::Driver.new(sys, 1e-2, epsabs: 1e-9)
      y0 = [0, 10]

      expected = [[0.0, 10.0], [10.0, 0.0], [0.0, -10.0], [-10.0, 0.0], [0.0, 10.0]]
      i = 1
      ode.evolve(y0, 0, Math::PI*2, Math::PI/2) do |y, t|
        expected_y = expected[i]
        expected_t = i*Math::PI/2
        t.should be_close expected_t, 1e-6
        y[0].should be_close expected_y[0], 1e-6
        y[1].should be_close expected_y[1], 1e-6
        i += 1
      end
    end
  end
  pending "integrates system with jacobian" do
    it "with given time values" do
      sys = TestODEJacobian.new(10.0)
      ode = GSL::ODE::Driver.new(sys, 1e-2, epsabs: 1e-9, algorithm: GSL::ODE::Algorithm::MSBDF)
      y0 = [1, 0]
      y = ode.evolve(y0, [0, 9.5, 11.0, 19.0, 20.1])
      y[0][0].should eq 1.0
      y[1][0].should be_close -1.1, 1e-1
      y[2][0].should be_close 2.0, 1e-2
      y[3][0].should be_close 1.1, 1e-1
      y[4][0].should be_close -2.0, 1e-2
    end
  end
end
