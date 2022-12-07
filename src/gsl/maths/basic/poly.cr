require "complex"

module GSL
  # Poly class represents polinomial c0+c1*x+c2*x*x+...
  class Poly
    # Returns coefficients of polynomial
    getter coeffs : Array(Float64)

    # Creates polynomial from array of coefficients
    def initialize(acoeffs)
      @coeffs = acoeffs.map(&.to_f)
    end

    # Returns array containing value at given point and all derivatives at this point.
    def eval_derivs(x : Float64) : Array(Float64)
      results = Array(Float64).new(coeffs.size, 0.0)
      LibGSL.gsl_poly_eval_derivs(coeffs.to_unsafe, coeffs.size, x, results.to_unsafe, coeffs.size)
      results
    end

    # Returns value of polinomial at point x
    def eval(x : Float64) : Float64
      LibGSL.gsl_poly_eval(coeffs.to_unsafe, coeffs.size, x)
    end

    # Returns complex value of polinomial at complex point x
    def eval(x : Complex) : Complex
      Complex.from_gsl(LibGSL.gsl_poly_complex_eval(coeffs.to_unsafe, coeffs.size, x.to_gsl))
    end

    # Returns sorted array containing real roots of polinomial.
    # Roots of higher order will be returned as separate roots
    def solve : Array(Float64)
      case @coeffs.size
      when 0
        raise ArgumentError.new("Polynomial coefficients are empty")
      when 1
        raise ArgumentError.new("Polynomial have only 1 coefficient")
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

    # Returns sorted array containing real roots of polinomial.
    # Roots that differs less then `tolerance` will be returned as one root
    def solve_distinct(tolerance = 1e-9) : Array(Float64)
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

    # Returns array containing complex roots of polinomial.
    # Always returns `@coeffs.size-1` number of roots.
    def solve_complex : Array(Complex)
      case @coeffs.size
      when 0
        raise ArgumentError.new("Polynomial coefficients are empty")
      when 1
        raise ArgumentError.new("Polynomial have only 1 coefficient")
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

    # compare coefficients with another polynomial
    def ==(other : Poly)
      other.coeffs == @coeffs
    end

    # differentiate polynomial
    def diff
      Poly.new(coeffs.skip(1).map_with_index { |x, i| x*(i + 1) })
    end

    # integrate polynomial
    def integrate
      c = coeffs.map_with_index { |x, i| x/(i + 1) }
      c.unshift 0.0
      Poly.new(c)
    end
  end

  # PolyDD class represents divided difference representation of polinomial
  class PolyDD
    # array of divided-differences.
    getter dd : Slice(Float64)
    # array of x points
    getter xa : Slice(Float64)

    private def initialize(*, @dd, @xa)
    end

    # length of divided-differences (order of polinomial+1)
    def size
      @dd.size
    end

    # Constructs PolyDD that have values `ya` at points `xa`
    def self.new(xa : Array(Float64), ya : Array(Float64))
      unless xa.size == ya.size
        raise ArgumentError.new("xa and ya should have same size (given #{xa.size}, #{ya.size})")
      end
      coeffs = Slice(Float64).new(xa.size)
      LibGSL.gsl_poly_dd_init(coeffs, xa, ya, xa.size)
      new(dd: coeffs, xa: xa.clone.to_unsafe.to_slice(xa.size))
    end

    # Constructs PolyDD that have values `ya` at points `xa` and also derivates `dya`
    def self.new_hermite(xa : Array(Float64), ya : Array(Float64), dya : Array(Float64))
      unless xa.size == ya.size && xa.size == dya.size
        raise ArgumentError.new("xa, ya and dya should have same size (given #{xa.size}, #{ya.size}, #{dya.size})")
      end
      n = xa.size
      coeffs = Slice(Float64).new(n*2)
      za = Slice(Float64).new(n*2)
      LibGSL.gsl_poly_dd_hermite_init(coeffs, za, xa, ya, dya, n)
      new(dd: coeffs, xa: za)
    end

    # Evaluates polinomial value at given point
    def eval(x)
      LibGSL.gsl_poly_dd_eval(@dd, @xa, xa.size, x)
    end

    @workspace : Slice(Float64)? = nil

    # Converts to `Poly` that is taylor expansion of polinomial at point `xp`
    def to_taylor(xp)
      c = Array(Float64).new(size, 0.0)
      @workspace = Slice(Float64).new(size) unless @workspace
      LibGSL.gsl_poly_dd_taylor(c, xp, @dd, @xa, size, @workspace.not_nil!)
      Poly.new(c)
    end
  end
end
