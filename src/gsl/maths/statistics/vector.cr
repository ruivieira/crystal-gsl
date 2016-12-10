module GSL
  class Vector
    def frequencies
      self.to_a.group_by { |x| x }.map { |num, arr| [num, arr.size] }.to_h
    end

    # alias for frequencies
    def freqs
      self.frequencies
    end

    def mode
      freq = self.frequencies
      output = freq.select { |k, v| v == freq.values.max }.keys
      output.to_vector
    end

    def proportion(n : Float64 | Int32)
      self.to_a.count(n.to_f) / self.size.to_f
    end
  end
end

class Array(T)
  def to_vector
    GSL::Vector.new self.map { |x| x.to_f }
  end
end
