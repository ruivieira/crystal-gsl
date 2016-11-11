require "math"
require "random"
require "./libgsl.cr"

module Statistics
  class Matrix
    getter pointer

    def initialize(@rows : Int32, @columns : Int32)
      @pointer = LibGSL.gsl_matrix_calloc(@rows, @columns)
    end

    def nrows : Int32
      @pointer.value.size1
    end

    def ncols : Int32
      @pointer.value.size2
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

  class Vector
    getter pointer

    def initialize(@size : Int32)
      @pointer = LibGSL.gsl_vector_calloc(@size)
    end

    def initialize(a : Array(Float64))
      @size = a.size
      @pointer = LibGSL.gsl_vector_calloc(@size)
      (0...@size).each do |i|
        self[i] = a[i]
      end
    end

    def size : Int32
      return @size
    end

    def [](i) : Float64
      return LibGSL.gsl_vector_get(@pointer, i)
    end

    def []=(i, x)
      return LibGSL.gsl_vector_set(@pointer, i, x)
    end

    def getPointer
      return @pointer
    end

    def to_s : String
      return "[#{(0...self.size).map { |i| self[i].to_s }.join(", ")}]"
    end

    def to_array : Array(Float64)
      result = Array(Float64).new @size { 0.0 }
      (0...@size).each do |i|
        result[i] = self[i]
      end
      return result
    end

    # alias to to_array
    def to_a : Array(Float64)
      self.to_array
    end
  end
end
