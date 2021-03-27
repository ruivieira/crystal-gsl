require "./matrix.cr"

module GSL
  class Vector
    def each(&block : Float64 -> _)
      self.to_a.each &block
      self
    end

    def map(&block : Float64 -> _)
      self.to_a.map &block
    end
  end

  class Matrix
    def each_rows(&block : Vector -> _)
      (0...self.nrows).map { |x| self.row(x) }.each &block
      self
    end

    def each_columns(&block : Vector -> _)
      (0...self.ncols).map { |x| self.column(x) }.each &block
      self
    end

    def map_rows(&block : Vector -> _)
      (0...self.nrows).map { |x| self.row(x) }.map &block
    end

    def map_columns(&block : Vector -> _)
      (0...self.ncols).map { |x| self.column(x) }.map &block
    end
  end
end
