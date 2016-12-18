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

    def *(v : Vector) : Vector
      result = Vector.new self.nrows.to_i
      LibGSL.gsl_blas_dgemv(LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, 1.0, @pointer, v.getPointer, 1.0, result.getPointer)
      return result
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
      transpose = GSL::Matrix.new self.shape[1].to_i, self.shape[0].to_i
      LibGSL.gsl_matrix_transpose_memcpy(transpose.pointer, self.pointer)
      return transpose
    end
  end
end
