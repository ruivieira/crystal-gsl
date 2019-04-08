class Array(T)
  def to_vector
    GSL::Vector.new self.map { |x| x.to_f }
  end

  def to_matrix
    row = self.size
    column = self.first.size
    temp = GSL::DenseMatrix.new row, column
    self.each_with_index do |x, ind|
      x.each_with_index do |y, index|
        temp[ind, index] = y.to_f
      end
    end
    temp
  end
end
