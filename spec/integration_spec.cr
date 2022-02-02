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
  end
end
