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

    def ==(n : GSL::Vector) : Bool
      LibGSL.gsl_vector_equal(self.pointer, n.pointer) == 1 ? true : false
    end

    def size : Int32
      return @size
    end

    def [](i) : Float64
      return LibGSL.gsl_vector_get(@pointer, i)
    end

    def []=(i, x) : Float64
      LibGSL.gsl_vector_set(@pointer, i, x)
      return LibGSL.gsl_vector_get(@pointer, i)
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

    # This function checks if values are in vector or not
    #
    # ```
    # data = [1,2,3].to_vector
    # data.includes? 2 => true
    # ```

    def includes?(n : Float64 | Int32) : Bool
      self.to_a.includes? n.to_f
    end

    # Add element to the button of vector
    #
    # ```
    # a = [1,2,3].to_vector
    # a.push 4 => GSL::Vector: [1.0,2.0,3.0,4.0]
    # ```

    def push(n : Float64 | Int32) : Vector
      (self.to_a.push n.to_f).to_vector
    end

    # alias of push methods

    def <<(n : Float64 | Int32) : Vector
      self.push n.to_f
    end

    # return a new vector in ascending order
    #
    # ```
    # a = [2,5,3,7,1].to_vector
    # a.sort => GSL::Vector: [1.0,2.0,3.0,5.0,7.0]
    # a => GSL::Vector: [2.0,5.0,3.0,7.0,1.0]
    # ```

    def sort : Vector
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_sort_vector(temp.pointer)
      temp
    end

    # change current vector in ascending order
    #
    # ```
    # a = [2,5,3,7,1].to_vector
    # a.sort! => GSL::Vector: [1.0,2.0,3.0,5.0,7.0]
    # a => GSL::Vector: [1.0,2.0,3.0,5.0,7.0]
    # ```
    def sort! : Vector
      LibGSL.gsl_sort_vector(self.pointer)
      self
    end

    # concatinate two different vector and return a new vector
    #
    # ```
    # a = [1,2,3].to_vector
    # b = [2,3,4].to_vector
    # a.concat b => GSL::Vector: [1.0,2.0,3.0,2.0,3.0,4.0]
    # ```
    def concat(n : GSL::Vector) : Vector
      (self.to_a.concat n.to_a).to_vector
    end

    # return the first five elements in vector of current vector
    #
    # ```
    # a = [1,2,3,4,5,6,7,8]to_vector
    # a.head => GSL::Vector: [1.0,2.0,3.0,4.0,5.0]
    # ```

    def head : Vector
      self.size >= 5 ? ((0...5).map { |x| self[x] }).to_vector : self
    end

    # return the last five elements in vector of current vector
    #
    # ```
    # a = [1,2,3,4,5,6,7,8]to_vector
    # a.tail => GSL::Vector: [2.0,3.0,4.0,5.0,6.0]
    # ```

    def tail : Vector
      self.size >= 5 ? ((self.size - 5...self.size).map { |x| self[x] }).to_vector : self
    end

    def first : Float64
      self[0]
    end

    def last : Float64
      self[self.size - 1]
    end

    # replace current vector with input vector
    # note that two vector should have the same length
    #
    # ```
    # a = [1,2,3].to_vector
    # b = [2,3,4].to_vector
    # c = [2,3,4,5].to_vector
    # a.replace b
    # a => GSL::Vector: [2.0,3.0,4.0]
    # a.replace c => length error
    # ```

    def replace(n : GSL::Vector) : Vector
      LibGSL.gsl_vector_memcpy(self.pointer, n.pointer)
      self
    end

    def copy
      temp = GSL::Vector.new self.size
      LibGSL.gsl_vector_memcpy(temp.pointer, self.pointer)
      temp
    end

    # return a new vector with reversed elements of current vector
    #
    # ```
    # a = [1,2,3].to_vector
    # a.reverse => GSL::Vector: [3.0,2.0,1.0]
    # a => GSL::Vector [1.0,2.0,3.0]
    # ```

    def reverse
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_reverse(temp.pointer)
      temp
    end

    # reverse elements of current vector
    #
    # ```
    # a = [1,2,3].to_vector
    # a.reverse! => GSL::Vector: [3.0,2.0,1.0]
    # a => GSL::Vector: [3.0,2.0,1.0]
    # ```

    def reverse! : Vector
      LibGSL.gsl_vector_reverse(self.pointer)
      self
    end

    # return the maximum value of current vector
    # note: if there are multiple same maximum value then only return once
    #
    # ```
    # a = [1,2,3].to_vector
    # a.max => 3.0
    # ```

    def max : Float64
      LibGSL.gsl_vector_max(self.pointer)
    end

    # return the minimum value of current vector
    # note: if there are multiple same minimum value then only return once
    #
    # ```
    # a = [1,2,3].to_vector
    # a.min => 1.0
    # ```
    def min : Float64
      LibGSL.gsl_vector_min(self.pointer)
    end

    # return the minimum and maximun values of current vector
    #
    # ```
    # a = [1,2,3].to_vector
    # min, max = a.minmax
    # min => 1.0
    # max => 3.0
    # ```
    def minmax : Array(Float64)
      [self.min, self.max]
    end

    # return the index of maximum value of current vector
    # note: if there are multiple same maximum value then only return the first one.
    #
    # ```
    # a = [1,2,3].to_vector
    # a.max_index => 2
    # ```
    def max_index : UInt64
      LibGSL.gsl_vector_max_index(self.pointer)
    end

    # return the index of minimum value of current vector
    # note: if there are multiple same minimum value then only return the first one.
    #
    # ```
    # a = [1,2,3].to_vector
    # a.min_index => 0
    # ```

    def min_index : UInt64
      LibGSL.gsl_vector_min_index(self.pointer)
    end

    # return the index of minimum  and maximum value of current vector
    #
    # ```
    # a = [1, 2, 3].to_vector
    # min, max = a.minmax_index
    # min = 0
    # max = 2
    # ```

    def minmax_index : Array(UInt64)
      [self.min_index, self.max_index]
    end

    # return true if current vector's elements are all 0
    #
    # ```
    # a = [0,0,0].to_vector
    # b = [1,0,0].to_vector
    # a.empty? => true
    # b.empty? => false
    # ```
    def empty? : Bool
      LibGSL.gsl_vector_isnull(self.pointer) == 1 ? true : false
    end

    # return true if current vector's elements are all positive
    #
    # ```
    # a = [1,1,1].to_vector
    # b = [-1,0,0].to_vector
    # a.empty? => true
    # b.empty? => false
    # ```

    def pos? : Bool
      LibGSL.gsl_vector_ispos(self.pointer) == 1 ? true : false
    end

    # return true if current vector's elements are all negtive
    #
    # ```
    # a = [-1,-1,-1].to_vector
    # b = [-1,0,0].to_vector
    # a.empty? => true
    # b.empty? => false
    # ```

    def neg? : Bool
      LibGSL.gsl_vector_isneg(self.pointer) == 1 ? true : false
    end

    # return true if current vector has negtive element in it.
    #
    # ```
    # a = [-1,-1,1].to_vector
    # b = [1,0,0].to_vector
    # a.empty? => true
    # b.empty? => false
    # ```

    def has_neg? : Bool
      LibGSL.gsl_vector_isnonneg(self.pointer) == 1 ? false : true
    end

    # return a new vector with a length same as current vector but elements are set to zero
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_zero => GSL::Vector: [0.0,0.0,0.0]
    # a => GSL::Vector: [-1.0,-1.0,1.0]
    # ```

    def set_zero : Vector
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_zero(temp.pointer)
      temp
    end

    # set current vector's elements to zero
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_zero => GSL::Vector: [0.0,0.0,0.0]
    # a => GSL::Vector: [0.0,0.0,0.0]
    # ```

    def set_zero! : Vector
      LibGSL.gsl_vector_set_zero(self.pointer)
      self
    end

    # return a new value with the same length as current vector's and all elements are set to input value
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_all! 2 => GSL::Vector: [2.0,2.0,2.0]
    # a => GSL::Vector: [-1.0,-1.0,1.0]
    # ```

    def set_all(n : Int32 | Float64) : Vector
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_all(temp.pointer, n.to_f)
      temp
    end

    # set current vector's elements to input value
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_all! 2 => GSL::Vector: [2.0,2.0,2.0]
    # a => GSL::Vector: [2.0,2.0,2.0]
    # ```

    def set_all!(n : Int32 | Float64) : Vector
      LibGSL.gsl_vector_set_all(self.pointer, n.to_f)
      self
    end

    # return a new vector with the same length of current vector but all values are zero except the input index
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_basis 2 => GSL::Vector: [0.0,0.0,1.0]
    # a => GSL::Vector: [-1.0,-1.0,1.0]
    # ```

    def set_basis(n : Int32) : Vector
      temp = GSL::Vector.new self.to_a
      LibGSL.gsl_vector_set_basis(temp.pointer, n)
      temp
    end

    # set current vector's elements to zero except the input index
    #
    # ```
    # a = [-1,-1,1].to_vector
    # a.set_basis! 2 => GSL::Vector: [0.0,0.0,1.0]
    # a => GSL::Vector: [0.0,0.0,1.0]
    # ```

    def set_basis!(n : Int32) : Vector
      LibGSL.gsl_vector_set_basis(self.pointer, n)
      self
    end

    # calculate the mean of the vector's elements
    #
    # ```
    # a = [0.0, -5.0, 7.3].to_vector.mean
    # a => 0.76666666666666661
    # ```
    def mean : Float64
      return Statistics.mean(self.to_a)
    end
  end
end
