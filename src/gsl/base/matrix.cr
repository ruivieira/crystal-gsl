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

    def inspect
      self.map_rows { |x| x.inspect }.join("\n")
    end

    def [](row : Symbol | Int32, column : Symbol | Int32) : Float64 | Vector
      if row == :all
        return self.column(column)
      elsif column == :all
        return self.row(row)
      else
        return LibGSL.gsl_matrix_get(@pointer, row.to_i, column.to_i)
      end
    end

    def set_row(r : Int32, v : Vector) : Int32
      LibGSL.gsl_matrix_set_row(@pointer, r.to_i, v.pointer)
    end

    def row(r : Int32 | Symbol) : Vector
      result = Vector.new @columns
      LibGSL.gsl_matrix_get_row(result.pointer, @pointer, r.to_i)
      return result
    end

    def set_col(c : Int32, v : Vector) : Int32
      LibGSL.gsl_matrix_set_col(@pointer, c.to_i, v.pointer)
    end

    def column(c : Int32 | Symbol) : Vector
      result = Vector.new @rows
      LibGSL.gsl_matrix_get_col(result.pointer, @pointer, c.to_i)
      return result
    end

    def []=(row : Symbol | Int32, column : Symbol | Int32, x : Int32)
      if row == :all
        (0...@rows).each { |n| LibGSL.gsl_matrix_set(@pointer, n, column.to_i, x.to_i) }
        self[:all, column]
      elsif column == :all
        (0...@columns).each { |n| LibGSL.gsl_matrix_set(@pointer, row.to_i, n, x.to_i) }
        self[row, :all]
      else
        LibGSL.gsl_matrix_set(@pointer, row.to_i, column.to_i, x.to_i)
        self[row, column]
      end
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

    def set_all(n : Float64 | Int32)
      LibGSL.gsl_matrix_set_all(self.pointer, n.to_f)
      self
    end

    def set_zero
      LibGSL.gsl_matrix_set_zero(self.pointer)
      self
    end

    def set_identity
      LibGSL.gsl_matrix_set_identity(self.pointer)
      self
    end
  end
end
