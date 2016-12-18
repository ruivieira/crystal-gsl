module GSL
  class Vector
    def +(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_vector_add_constant(temp.pointer, n.to_f)
      temp
    end

    def +(n : GSL::Vector)
      temp = self.copy
      LibGSL.gsl_vector_add(temp.pointer, n.pointer)
      temp
    end

    def -(n : Int32 | Float64)
      self.map { |x| x - n }.to_vector
    end

    def -(n : GSL::Vector)
      temp = self.copy
      LibGSL.gsl_vector_sub(temp.pointer, n.pointer)
      temp
    end

    def *(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_vector_scale(temp.pointer, n.to_f)
      temp
    end

    def *(n : GSL::Vector)
      temp = self.copy
      LibGSL.gsl_vector_mul(temp.pointer, n.pointer)
      temp
    end

    def /(n : Int32 | Float64)
      self.map { |x| x / n }.to_vector
    end

    def /(n : GSL::Vector)
      temp = self.copy
      LibGSL.gsl_vector_div(temp.pointer, n.pointer)
      temp
    end

    def sum
      self.to_a.sum
    end

    def dot(n : GSL::Vector)
      (self * n).sum
    end

    # same as dot function
    def inner_product(n : GSL::Vector)
      self.dot n
    end
  end
end
