require "../../base/matrices"

module Statistics

  class Vector

    def frequencies
      self.to_a.group_by { |x| x }.map { |num, arr| [num, arr.size] }.to_h
    end

    def mode
      freq = self.frequencies
      output = freq.select {|k,v| v == freq.values.max }.keys
      output.to_vector
    end

    
  end

end

class Array(T)

  def to_vector
    Statistics::Vector.new self.map{ |x| x.to_f }
  end

end
