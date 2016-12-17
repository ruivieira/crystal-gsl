module GSL
  class Matrix
    getter pointer

    def initialize(@rows : Int32, @columns : Int32)
      @pointer = LibGSL.gsl_matrix_calloc(@rows, @columns)
    end

    def nrows : LibC::SizeT
      @pointer.value.size1
    end

    def ncols : LibC::SizeT
      @pointer.value.size2
    end

    def shape
      Tuple.new(@rows, @columns)
    end

    def [](row : Int32, column : Int32) : Float64
      return LibGSL.gsl_matrix_get(@pointer, row, column)
    end

    def set_row(r : Int32, v : Vector) : Int32
      LibGSL.gsl_matrix_set_row(@pointer, r, v.pointer)
    end

    def row(r : Int32) : Vector
      result = Vector.new @columns
      LibGSL.gsl_matrix_get_row(result.pointer, @pointer, r)
      return result
    end

    def set_col(c : Int32, v : Vector) : Int32
      LibGSL.gsl_matrix_set_col(@pointer, c, v.pointer)
    end

    def column(c : Int32) : Vector
      result = Vector.new @rows
      LibGSL.gsl_matrix_get_col(result.pointer, @pointer, c)
      return result
    end

    def []=(row, column, x)
      return LibGSL.gsl_matrix_set(@pointer, row, column, x)
    end

    def set(row, column, x)
      return LibGSL.gsl_matrix_set(@pointer, row, column, x)
    end

    def get(row, column) : Float64
      return LibGSL.gsl_matrix_get(@pointer, row, column)
    end

    def *(v : Vector) : Vector
      result = Vector.new self.nrows
      LibGSL.gsl_blas_dgemv(LibGSL::CBLAS_TRANSPOSE_t::CblasNoTrans, 1.0, @pointer, v.getPointer, 1.0, result.getPointer)
      return result
    end

    def copy : Matrix
      result = Matrix.new @rows, @columns
      LibGSL.gsl_matrix_memcpy(result.pointer, @pointer)
      return result
    end

    def like : Matrix
      return Matrix.new @rows, @columns
    end

    def t : Matrix
      transpose = self.copy
      LibGSL.gsl_matrix_transpose(transpose.pointer)
      return transpose
    end

    def self.eye(size : Int32) : Matrix
      matrix = Matrix.new size, size
      (0...size).each do |i|
        matrix[i, i] = 1.0
      end
      return matrix
    end

    def self.free(m : Matrix)
      LibGSL.gsl_matrix_free(m.pointer)
    end
  end
end
