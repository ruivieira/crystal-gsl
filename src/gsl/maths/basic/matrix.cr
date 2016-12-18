module GSL
  class Matrix
    def +(n : GSL::Matrix)
      temp = self.copy
      LibGSL.gsl_matrix_add(temp.pointer, n.pointer)
      temp
    end

    def +(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_matrix_add_constant(temp.pointer, n.to_f)
      temp
    end

    def -(n : GSL::Matrix)
      temp = self.copy
      LibGSL.gsl_matrix_sub(temp.pointer, n.pointer)
      temp
    end

    def -(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_matrix_add_constant(temp.pointer, -(n.to_f))
      temp
    end

    def *(n : GSL::Matrix)
      temp = self.copy
      LibGSL.gsl_matrix_mul_elements(temp.pointer, n.pointer)
      temp
    end

    def *(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_matrix_scale(temp.pointer, n.to_f)
      temp
    end

    def /(n : GSL::Matrix)
      temp = self.copy
      LibGSL.gsl_matrix_div_elements(temp.pointer, n.pointer)
      temp
    end

    def /(n : Int32 | Float64)
      temp = self.copy
      LibGSL.gsl_matrix_scale(temp.pointer, 1/(n.to_f))
      temp
    end

    def t : Matrix
      transpose = self.copy
      LibGSL.gsl_matrix_transpose(transpose.pointer)
      return transpose
    end
  end
end
