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

    def ranked
      output = [] of Float64
      rank = self.sort.frequencies
      rank.keys.each_with_index do |y, ind|
        temp = [] of Int32
        self.to_a.each_with_index do |x, index|
          if y == x
            temp << index + 1
          end
        end
        output << temp.sum / rank.values[ind].to_f
      end
      output.to_vector
    end
  end
end
