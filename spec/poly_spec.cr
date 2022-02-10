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
      poly4 = GSL::Poly.new([-1.0, 0.0, 0.0, 0.0, 1.0]) # x*x*x*x-1
      poly4.eval(-1.i).should eq 0
      poly1 = GSL::Poly.new([1.0, 2.0]) # 2*x+1
      poly1.eval(1 + 1.i).should eq 3 + 2.i
    end

    it "can solve quadratic equations" do
      poly = GSL::Poly.new([1.0, -2.0, 1.0]) # x*x-2*x+1
      poly.solve.should eq [1.0, 1.0]
      poly.solve_complex.should eq [1.0, 1.0]

      poly = GSL::Poly.new([1.0, 0.0, 1.0]) # x*x+1
      poly.solve.should eq([] of Float64)
      poly.solve_complex.should eq [-1.i, 1.i]
    end

    it "can solve cubic equations" do
      poly = GSL::Poly.new([-30.0, 46.0, -18.0, 2.0])
      poly.solve.should eq [1, 3, 5]

      poly = GSL::Poly.new([1.0, 0.0, 0.0, 1.0])
      poly.solve.should eq [-1.0]
      z1, z2, z3 = poly.solve_complex
      z1.should eq -1
      z2.should be_close 0.5 - 1.i*Math.sqrt(3)/2, 1e-9
      z3.should be_close 0.5 + 1.i*Math.sqrt(3)/2, 1e-9
    end

    it "can solve high order equations" do
      poly = GSL::Poly.new([-120.0, 166.0, -27.0, -23.0, 3.0, 1.0])
      x1, x2, x3, x4, x5 = poly.solve
      x1.should be_close -5, 1e-9
      x2.should be_close -4, 1e-9
      x3.should be_close 1, 1e-9
      x4.should be_close 2, 1e-9
      x5.should be_close 3, 1e-9

      poly = GSL::Poly.new([-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0])
      z = poly.solve_complex
      z.size.should eq 6
      z.each do |x|
        x.abs.should be_close 1.0, 1e-9
        poly.eval(x).should be_close 0.0, 1e-9
      end
    end

    it "can found distinct roots" do
      poly = GSL::Poly.new([1.0, -4.0, 6.0, -4.0, 1.0])
      roots = poly.solve_distinct(1e-3)
      roots.size.should eq 1
      roots[0].should be_close 1.0, 1e-3

      poly2 = GSL::Poly.new([25.0, -10.0, 1.0])
      poly2.solve_distinct.size.should eq 1
      poly2.solve_distinct[0].should be_close 5.0, 1e-3

      poly2 = GSL::Poly.new([24.9999999, -10.0, 1.0])
      poly2.solve_distinct.size.should eq 2
      poly2.solve_distinct(1e-3).size.should eq 1
    end

    it "evaluate derivs at point" do
      poly = GSL::Poly.new([1.0, 2.0, 1.0]) # x^2+2x+1
      poly.eval_derivs(0.1).should eq [1.21, 2.2, 2]
    end
  end

  describe GSL::PolyDD do
    it "can be constructed from set of points" do
      poly = GSL::PolyDD.new([1.0, 2.0, 3.0], [0.0, 1.0, 0.0])
      poly.size.should eq 3
      poly.xa.should eq Slice[1.0, 2.0, 3.0]
      poly.dd.should eq Slice[0.0, 1.0, -1.0]
    end
    it "can be evaluated at given point" do
      poly = GSL::PolyDD.new([1.0, 2.0, 3.0], [0.0, 1.0, 0.0])
      poly.eval(1).should eq 0
      poly.eval(0).should eq -3
    end
    it "can be constructed from hermite interpolation" do
      poly = GSL::PolyDD.new_hermite([2.0, 3.0], [2.0**3, 3.0**3], [3.0*2**2, 3.0*3**2])
      poly.size.should eq 4
      poly.eval(0).should eq 0
      poly.eval(5).should eq 125
    end

    it "#to_taylor returns taylor expansion" do
      poly_dd = GSL::PolyDD.new_hermite([2.0, 3.0], [2.0**3, 3.0**3], [3.0*2**2, 3.0*3**2])
      poly = poly_dd.to_taylor(5)
      poly.eval(0).should eq 125
      poly.eval(-1).should eq 64
    end
  end
end
