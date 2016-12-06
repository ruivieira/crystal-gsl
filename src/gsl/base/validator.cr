require "./error"

module Statistics
  class Vector
    def validate(n : Statistics::Vector)
      if self.size == n.size
        true
      else
        if self.size > n.size
          unless self.size % n.size == 0
            raise LengthException.new("vector length is not the multiplication of shorter one.")
          end
        else
          unless n.size % self.size == 0
            raise LengthException.new("Larger vector length is not the multiplication of shorter one.")
          end
        end
      end
    end
  end
end
