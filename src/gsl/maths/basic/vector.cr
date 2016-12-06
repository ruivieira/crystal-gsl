require "../../base/matrices"

module Statistics
  class Vector
    def push(n : Int32 | Float64)
      self.to_a.push(n.to_f).to_vector
    end

    # alias of push function
    def <<(n : Int32 | Float64)
      self.push(n.to_f)
    end

    def +(n : Int32 | Float64)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_add_constant(temp.pointer, n.to_f)
      temp
    end

    def +(n : Statistics::Vector)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_add(temp.pointer, n.pointer)
      temp
    end

    def -(n : Int32 | Float64)
      self.map { |x| x - n }.to_vector
    end

    def -(n : Statistics::Vector)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_sub(temp.pointer, n.pointer)
      temp
    end

    def *(n : Int32 | Float64)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_scale(temp.pointer, n.to_f)
      temp
    end

    def *(n : Statistics::Vector)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_mul(temp.pointer, n.pointer)
      temp
    end

    def /(n : Int32 | Float64)
      self.map { |x| x / n }.to_vector
    end

    def /(n : Statistics::Vector)
      temp = Statistics::Vector.new self.to_a
      LibGSL.gsl_vector_div(temp.pointer, n.pointer)
      temp
    end

    def sum
      self.to_a.sum
    end

    def dot(n : Statistics::Vector)
      (self * n).sum
    end

    # same as dot function
    def inner_product(n : Statistics::Vector)
      self.dot n
    end
  end
end
