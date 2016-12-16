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
  end
end
