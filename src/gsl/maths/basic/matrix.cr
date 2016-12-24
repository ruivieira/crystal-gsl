module GSL
  class Matrix
    def +(n : GSL::Matrix) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_add(temp.pointer, n.pointer)
      temp
    end

    def +(n : Int32 | Float64) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_add_constant(temp.pointer, n.to_f)
      temp
    end

    def -(n : GSL::Matrix) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_sub(temp.pointer, n.pointer)
      temp
    end

    def -(n : Int32 | Float64) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_add_constant(temp.pointer, -(n.to_f))
      temp
    end

    def *(n : GSL::Matrix) : Matrix
      temp_row = self.shape[0]
      temp_column = n.shape[1]
      temp = GSL::Matrix.new temp_row, temp_column
      LibGSL.gsl_blas_dgemm(LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, 1.0, self.pointer, n.pointer, 0.0, temp.pointer)
      temp
    end

    def *(v : Vector) : Vector
      result = Vector.new self.nrows.to_i
      LibGSL.gsl_blas_dgemv(LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, 1.0, @pointer, v.getPointer, 1.0, result.getPointer)
      return result
    end

    def *(n : Int32 | Float64) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_scale(temp.pointer, n.to_f)
      temp
    end

    def /(n : Int32 | Float64) : Matrix
      temp = self.copy
      LibGSL.gsl_matrix_scale(temp.pointer, 1/(n.to_f))
      temp
    end

    def transpose : Matrix
      transpose = GSL::Matrix.new self.shape[1].to_i, self.shape[0].to_i
      LibGSL.gsl_matrix_transpose_memcpy(transpose.pointer, self.pointer)
      return transpose
    end

    # alias to transpose
    def t : Matrix
      self.transpose
    end

    def inverse : Matrix
      temp = self.copy
      p = GSL::Permutation.new Array.new(self.shape[0], 0)
      inverse = GSL::Matrix.new self.shape[0], self.shape[1]
      sig = 0
      LibGSL.gsl_linalg_LU_decomp(temp.pointer, p.@permutation, pointerof(sig))
      LibGSL.gsl_linalg_LU_invert(temp.pointer, p.@permutation, inverse.pointer)
      inverse
    end

    # alias to inverse
    def i : Matrix
      self.inverse
    end
  end
end
