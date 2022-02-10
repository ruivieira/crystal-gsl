require "complex"

module GSL
  class Poly
    getter coeffs : Array(Float64)

    def initialize(acoeffs)
      @coeffs = acoeffs.map(&.to_f)
    end

    def deriv(n : Int32) : Poly
      # TODO
    end

    def eval(x : Float64) : Float64
      LibGSL.gsl_poly_eval(coeffs.to_unsafe, coeffs.size, x)
    end

    def eval(x : Complex) : Complex
      Complex.from_gsl(LibGSL.gsl_poly_complex_eval(coeffs.to_unsafe, coeffs.size, x.to_gsl))
    end

    def solve : Array(Float64)
      case @coeffs.size
      when 0
        raise ArgumentError.new("Polynom coeffitients are empty")
      when 1
        raise ArgumentError.new("Polynom have only 1 coeffitient")
      when 2
        return [-@coeffs[0] / -@coeffs[1]]
      when 3
        n = LibGSL.gsl_poly_solve_quadratic(@coeffs[2], @coeffs[1], @coeffs[0], out x1, out x2)
        return [x1, x2][0...n]
      when 4
        n = LibGSL.gsl_poly_solve_cubic(@coeffs[2]/@coeffs[3], @coeffs[1]/@coeffs[3], @coeffs[0]/@coeffs[3], out xx1, out xx2, out xx3)
        return [xx1, xx2, xx3][0...n]
      else
        return solve_complex.select { |x| x.imag.abs < 1e-9 }.map(&.real).sort
      end
    end

    def solve_distinct(tolerance = 1e-3) : Array(Float64)
      if @coeffs.size < 5
        roots = solve
      else
        roots = solve_complex.select { |x| x.imag.abs < tolerance }.map(&.real).sort
      end
      results = [roots.first]
      roots.each_cons_pair do |x_prev, x|
        results << x if (x - x_prev).abs > tolerance
      end
      results
    end

    def solve_complex : Array(Complex)
      case @coeffs.size
      when 0
        raise ArgumentError.new("Polynom coeffitients are empty")
      when 1
        raise ArgumentError.new("Polynom have only 1 coeffitient")
      when 2
        return [Complex.new(-@coeffs[0] / -@coeffs[1])]
      when 3
        LibGSL.gsl_poly_complex_solve_quadratic(@coeffs[2], @coeffs[1], @coeffs[0], out x1, out x2)
        return [x1, x2].map { |x| Complex.from_gsl(x) }
      when 4
        LibGSL.gsl_poly_complex_solve_cubic(@coeffs[2]/@coeffs[3], @coeffs[1]/@coeffs[3], @coeffs[0]/@coeffs[3], out z1, out z2, out z3)
        return [z1, z2, z3].map { |x| Complex.from_gsl(x) }
      else
        workspace = LibGSL.gsl_poly_complex_workspace_alloc(@coeffs.size)
        begin
          results = Array(LibGSL::Gsl_complex).new(coeffs.size - 1, LibGSL::Gsl_complex.new)
          LibGSL.gsl_poly_complex_solve(coeffs.to_unsafe, coeffs.size, workspace, results.to_unsafe)
          return results.map { |x| Complex.from_gsl(x) }
        ensure
          LibGSL.gsl_poly_complex_workspace_free(workspace)
        end
      end
    end
  end
end
