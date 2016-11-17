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
      self.map { |x| x + n }.to_vector
    end

    def +(n : Statistics::Vector)
      if self.validate(n)
        [self.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a + b } }.to_vector
      else
        if self.size > n.size
          self2 = self.to_a[0...n.size]
          [self2.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a + b } }.concat(self.to_a[n.size..-1]).to_vector
        else
          n2 = n.to_a[0...self.size]
          [self.to_a, n2.to_a].transpose.map { |x| x.reduce { |a, b| a + b } }.concat(n.to_a[self.size..-1]).to_vector
        end
      end
    end

    def -(n : Int32 | Float64)
      self.map { |x| x - n }.to_vector
    end

    def -(n : Statistics::Vector)
      if self.validate(n)
        [self.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a - b } }.to_vector
      else
        if self.size > n.size
          self2 = self.to_a[0...n.size]
          [self2.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a - b } }.concat(self.to_a[n.size..-1]).to_vector
        else
          n2 = n.to_a[0...self.size]
          [self.to_a, n2.to_a].transpose.map { |x| x.reduce { |a, b| a - b } }.concat(n.to_a[self.size..-1]).to_vector
        end
      end
    end

    def *(n : Int32 | Float64)
      self.map { |x| x * n }.to_vector
    end

    def *(n : Statistics::Vector)
      if self.validate(n)
        [self.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a * b } }.to_vector
      else
        raise LengthException.new("Larger vector length is not the multiplication of shorter one.")
      end
    end

    def /(n : Int32 | Float64)
      self.map { |x| x / n }.to_vector
    end

    def /(n : Statistics::Vector)
      if self.validate(n)
        [self.to_a, n.to_a].transpose.map { |x| x.reduce { |a, b| a / b } }.to_vector
      else
        raise LengthException.new("Larger vector length is not the multiplication of shorter one.")
      end
    end

    def sum
      self.to_a.sum
    end

    def dot( n : Statistics::Vector )
      (self * n).sum
    end

    # same as dot function
    def inner_product( n : Statistics::Vector )
      self.dot n
    end
  end
end
