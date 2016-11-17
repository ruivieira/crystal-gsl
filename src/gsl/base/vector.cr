module Statistics
  class Vector
    def includes? ( n : Float64 | Int32 )
      self.to_a.includes? n.to_f
    end

    def push ( n : Float64 | Int32 )
      (self.to_a.push n.to_f).to_vector
    end

    # alias of push methods 
    def << ( n : Float64 | Int32 )
      self.push n.to_f
    end

    def sort
      self.to_a.sort.to_vector
    end

    def concat ( n : Statistics::Vector )
      (self.to_a.concat n.to_a).to_vector
    end

    def head
      ((0...5).map { |x| self[x] }).to_vector
    end

    def tail
      ((self.size - 5 ... self.size).map { |x| self[x] }).to_vector
    end

    def first
      self[0]
    end

    def last
      self[self.size - 1 ]
    end
  end
end
