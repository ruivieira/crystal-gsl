require "./spec_helper"

describe GSL do
  describe GSL::Poly do
    it "can evaluate at given point" do
      poly2 = GSL::Poly.new([1.0, 2.0, 3.0]) # 1+2*x+3*x*x
      poly2.eval(0.0).should eq 1.0
      poly2.eval(1.0).should eq 6.0
      poly2.eval(2.0).should eq 1 + 2*2 + 3*2*2
      poly1 = GSL::Poly.new([1.0, -1.0]) # 1-x
      poly1.eval(-2).should eq 3
      poly0 = GSL::Poly.new([10.0]) # 10
      poly0.eval(-2).should eq 10
    end

    it "can evaluate at complex point" do
      poly3 = GSL::Poly.new([-1.0, 0.0, 0.0, 1.0]) # x*x*x-1
      poly3.eval(-1.i)
    end

    it "can solve quadratic equations" do
      poly = GSL::Poly.new([1.0, 0.0, 0.0, 0.0, -1.0])
      pp! poly.solve, poly.solve_complex
    end
  end
end
