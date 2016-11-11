require "../../base/matrices"

module Statistics
  class Vector
    def +(n : Int32 | Float64)
      self.map { |x| x + n }.to_vector
    end

    def *(n : Int32 | Float64)
      self.map { |x| x*n }.to_vector
    end
  end
end
