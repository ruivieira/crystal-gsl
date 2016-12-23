module GSL
  class Vector
    getter pointer

    def initialize(@size : Int32)
      @pointer = LibGSL.gsl_vector_calloc(@size)
    end

    def inspect
      "GSL::Vector: #{self.to_array}"
    end

    def initialize(a : Array(Float64))
      @size = a.size
      @pointer = LibGSL.gsl_vector_calloc(@size)
      (0...@size).each do |i|
        self[i] = a[i]
      end
    end

    def ==(n : GSL::Vector)
      LibGSL.gsl_vector_equal(self.pointer, n.pointer) == 1 ? true : false
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

    def includes?(n : Float64 | Int32)
      self.to_a.includes? n.to_f
    end

    def push(n : Float64 | Int32)
      (self.to_a.push n.to_f).to_vector
    end

    # alias of push methods
    def <<(n : Float64 | Int32)
      self.push n.to_f
    end

    def sort
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_sort_vector(temp.pointer)
      temp
    end

    def sort!
      LibGSL.gsl_sort_vector(self.pointer)
      self
    end

    def concat(n : GSL::Vector)
      (self.to_a.concat n.to_a).to_vector
    end

    def head
      self.size >= 5 ? ((0...5).map { |x| self[x] }).to_vector : self
    end

    def tail
      self.size >= 5 ? ((self.size - 5...self.size).map { |x| self[x] }).to_vector : self
    end

    def first
      self[0]
    end

    def last
      self[self.size - 1]
    end

    def replace(n : GSL::Vector)
      LibGSL.gsl_vector_memcpy(self.pointer, n.pointer)
      self
    end

    def copy
      temp = GSL::Vector.new self.size
      LibGSL.gsl_vector_memcpy(temp.pointer, self.pointer)
      temp
    end

    def reverse
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_reverse(temp.pointer)
      temp
    end

    def reverse!
      LibGSL.gsl_vector_reverse(self.pointer)
      self
    end

    def max
      LibGSL.gsl_vector_max(self.pointer)
    end

    def min
      LibGSL.gsl_vector_min(self.pointer)
    end

    def minmax
      [self.min, self.max]
    end

    def max_index
      LibGSL.gsl_vector_max_index(self.pointer)
    end

    def min_index
      LibGSL.gsl_vector_min_index(self.pointer)
    end

    def minmax_index
      [self.min_index, self.max_index]
    end

    def empty?
      LibGSL.gsl_vector_isnull(self.pointer) == 1 ? true : false
    end

    def pos?
      LibGSL.gsl_vector_ispos(self.pointer) == 1 ? true : false
    end

    def neg?
      LibGSL.gsl_vector_isneg(self.pointer) == 1 ? true : false
    end

    def has_neg?
      LibGSL.gsl_vector_isnonneg(self.pointer) == 1 ? false : true
    end

    def set_zero
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_zero(temp.pointer)
      temp
    end

    def set_zero!
      LibGSL.gsl_vector_set_zero(self.pointer)
      self
    end

    def set_all(n : Int32 | Float64)
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_all(temp.pointer, n.to_f)
      temp
    end

    def set_all!(n : Int32 | Float64)
      LibGSL.gsl_vector_set_all(self.pointer, n.to_f)
      self
    end

    def set_bias(n : Int32)
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_basis(temp.pointer, n)
      temp
    end

    def set_bias!(n : Int32)
      LibGSL.gsl_vector_set_basis(self.pointer, n)
      self
    end
  end
end
