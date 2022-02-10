require "./spec_helper"

describe GSL do
  describe GSL::Poly do
    it "can solve quadratic equations" do
      poly = GSL::Poly.new([1.0, 0.0, 0.0, 0.0, -1.0])
      pp! poly.solve, poly.solve_complex
    end
  end
end
