require "./base/matrices"

module Statistics
  class Vector
    def each(&block : Float64 -> _)
      self.to_a.each &block
      self
    end

    def map(&block : Float64 -> _)
      self.to_a.map &block
    end
  end
end
