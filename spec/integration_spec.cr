require "./spec_helper"

describe GSL::Integration do
  describe "qng algorithm" do
    it "integrates simple function" do
      f = ->(x : Float64) { Math.sin(x) }
      result, eps, count = GSL::Integration.qng(f, 0.0, Math::PI/2)
      result.should be_close 1.0, 1e-9
      eps.should be < 1e-9
      count.should be > 1
    end

    it "integrates closured function" do
      a = 1.0
      f = ->(x : Float64) { a*Math.sin(x) }
      a = 8.0
      result, _, _ = GSL::Integration.qng(f, 0.0, Math::PI/2)
      result.should be_close 8.0, 1e-9
    end

    it "integrates with yielding syntax" do
      a = 16.0
      result, _, _ = GSL::Integration.qng(0.0, Math::PI) { |x| a*Math.sin(x) }
      result.should be_close 32.0, 1e-9
    end
  end

  describe "qag algorithm" do
    it "integrates simple function" do
      f = ->(x : Float64) { Math.sin(x) }
      result, eps = GSL::Integration.qag(f, 0.0, Math::PI/2)
      result.should be_close 1.0, 1e-9
      result, eps = GSL::Integration.qag(f, 0.0, 10001*Math::PI)
      result.should be_close 2.0, 1e-9
    end

    it "integrates function with singularity on a bound" do
      f = ->(x : Float64) { 1.0/Math.sqrt(2 - x) }
      result, eps = GSL::Integration.qags(f, 1.0, 2.0)
      result.should be_close 2.0, 1e-9
    end

    it "integrates function with known singularity points" do
      f = ->(x : Float64) { 1.0/Math.sqrt((2 - x).abs) }
      result, eps = GSL::Integration.qagp(f, [1.0, 2.0, 3.0])
      result.should be_close 4.0, 1e-9
    end

    it "integrates function on semi-infinite interval" do
      # f = ->(x : Float64) { Math.exp(-x**2) }
      f = ->(x : Float64) { 1.0 / (x**2 + 1) }
      result, eps = GSL::Integration.qags(f, -Float64::INFINITY, Float64::INFINITY)
      result.should be_close Math::PI, 1e-9

      result, eps = GSL::Integration.qags(f, 0, Float64::INFINITY)
      result.should be_close Math::PI/2, 1e-9

      result, eps = GSL::Integration.qags(f, -Float64::INFINITY, 0)
      result.should be_close Math::PI/2, 1e-9

      expect_raises(ArgumentError) { GSL::Integration.qags(f, -Float64::INFINITY, -Float64::INFINITY) }
      expect_raises(ArgumentError) { GSL::Integration.qags(f, Float64::INFINITY, -Float64::INFINITY) }
      expect_raises(ArgumentError) { GSL::Integration.qags(f, Float64::INFINITY, 0.0) }
      expect_raises(ArgumentError) { GSL::Integration.qags(f, 0.0, -Float64::INFINITY) }
    end
  end

  describe "qawc algorithm" do
    it "find Cauchy principal value for a singularity at finite point" do
      f = ->(x : Float64) { 1.0 } # function is 1.0 / x
      result, eps = GSL::Integration.qawc(f, -1, 1, 0)
      result.should be_close(0.0, 1e-9)
      f = ->(x : Float64) { Math.sqrt((2 - x).abs) } # function is 1.0 / Math.sqrt((2 - x).abs)
      result, eps = GSL::Integration.qawc(f, 1, 4, 2)
      result.should be_close(2*Math.sqrt(2) - 2, 1e-9)
    end
  end

  describe "cquad algorithm" do
    it "integrates simple function" do
      f = ->(x : Float64) { Math.sin(x) }
      result, eps, count = GSL::Integration.cquad(f, 0.0, Math::PI/2)
      result.should be_close 1.0, 1e-9
    end

    it "integrates function with singularities" do
      f = ->(x : Float64) { 1.0/Math.sqrt((2 - x).abs) }
      result, eps, count = GSL::Integration.cquad(f, 1, 3)
      result.should be_close 4.0, 1e-6
    end
  end

  it "has high-level routine to integrate" do
    r = GSL::Integration.integrate(0.0, Math::PI) { |x| Math.sin(x) }
    r.should be_close 2.0, 1e-9
  end
end
