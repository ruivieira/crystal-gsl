require "./spec_helper"

test_matrix = GSL::DenseMatrix.new 5, 5

describe GSL::DenseMatrix do
  describe "#nrows" do
    it "should return the number of rows of a matrix" do
      test_matrix.nrows.should eq 5
    end
  end
  describe "#ncols" do
    it "should return the number of columns of a matrix" do
      test_matrix.ncols.should eq 5
    end
  end
  describe "#shape" do
    it "should return the shape of a matrix" do
      test_matrix.shape.should eq ({5, 5})
    end
  end
  describe "#[]" do
    it "should return a value of expected index" do
      test_matrix[0, 0].should eq 0.0
    end
    it "should return a vector of expected column" do
      test_matrix[:all, 0].should eq (GSL::Vector.new [0.0, 0.0, 0.0, 0.0, 0.0])
    end
    it "should return a vector of expected row" do
      test_matrix[0, :all].should eq (GSL::Vector.new [0.0, 0.0, 0.0, 0.0, 0.0])
    end
  end
  describe "#set_all" do
    it "should set all the values in matrix to input value" do
      temp = GSL::DenseMatrix.new 5, 5
      (0...test_matrix.nrows).each { |x| (0...test_matrix.ncols).each { |y| temp[x, y] = 5 } }
      tmp = test_matrix.copy
      (tmp.set_all 5).should eq temp
    end
  end
  describe "#set_zero" do
    it "should set all the values in matrix to zero" do
      temp = GSL::DenseMatrix.new 5, 5
      test_matrix[0, 0] = 10
      test_matrix.set_zero.should eq temp
    end
  end
  describe "#set_identity" do
    it "should set the diagonal value to zero" do
      temp = test_matrix.copy
      tmp = GSL::DenseMatrix.new 5, 5
      (0...tmp.nrows).each { |x| tmp[x, x] = 1 }
      temp.set_identity.should eq tmp
    end
  end
  describe "#max" do
    it "should return the maximum value of the matrix" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.max.should eq 1
    end
  end
  describe "#min" do
    it "should return the minimum value of the matrix" do
      test_matrix.min.should eq 0
    end
  end
  describe "#minmax" do
    it "should return the minimum and maximun value of the matrix" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.minmax.should eq [0, 1]
    end
  end
  describe "#max_index" do
    it "should return the index of the maximum value" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.max_index.should eq [0, 0]
    end
  end
  describe "#min_index" do
    it "should return the index of the minimum value" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.min_index.should eq [0, 1]
    end
  end
  describe "#empty?" do
    it "should return true if all the values are 0" do
      test_matrix.empty?.should eq true
    end
    it "should return false if not all the values are 0" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.empty?.should eq false
    end
  end
  describe "#pos?" do
    it "should return true if all the values are positive" do
      temp = test_matrix.copy
      temp.set_all 1
      temp.pos?.should eq true
    end
    it "should return false if some values are not positive" do
      temp = test_matrix.copy
      temp[0, 0] = -1
      temp.pos?.should eq false
    end
  end
  describe "#neg?" do
    it "should return true if all the values are negtive" do
      temp = test_matrix.copy
      temp.set_all -1
      temp.neg?.should eq true
    end
    it "should return false if some of the values are not negtive" do
      temp = test_matrix.copy
      temp[0, 0] = 1
      temp.neg?.should eq false
    end
  end
  describe "#has_neg?" do
    it "should return true if some values are negtive" do
      temp = test_matrix.copy
      temp[0, 0] = -1
      temp.has_neg?.should eq true
    end
  end
  describe "#t" do
    it "should return the transpose of a matrix" do
      temp = [[1, 2, 3], [2, 3, 4]].to_matrix
      temp.t.should eq ([[1, 2], [2, 3], [3, 4]].to_matrix)
    end
  end
  describe "#+" do
    it "should return the addition of two matrice" do
      temp = test_matrix.copy
      temp.set_all 1
      temp2 = test_matrix.copy
      temp2.set_all 2
      (temp + temp2).should eq ((GSL::DenseMatrix.new 5, 5).set_all 3)
    end
    it "should return the addition of one matrix and an integer" do
      temp = test_matrix.copy
      (temp + 1).should eq ((GSL::DenseMatrix.new 5, 5).set_all 1)
    end
    it "should return the addition of one matrix and an float" do
      temp = test_matrix.copy
      (temp + 1.0).should eq ((GSL::DenseMatrix.new 5, 5).set_all 1)
    end
  end
  describe "#-" do
    it "should return the substraction of two matrice" do
      temp = test_matrix.copy
      temp.set_all 1
      temp2 = test_matrix.copy
      temp2.set_all 2
      (temp2 - temp).should eq ((GSL::DenseMatrix.new 5, 5).set_all 1)
    end
    it "should return the substraction of one matrix and an integer" do
      temp = test_matrix.copy
      (temp - 1).should eq ((GSL::DenseMatrix.new 5, 5).set_all -1)
    end
    it "should return the substraction of one matrix and an float" do
      temp = test_matrix.copy
      (temp - 1.0).should eq ((GSL::DenseMatrix.new 5, 5).set_all -1)
    end
  end
  describe "#*" do
    it "should return the multiplication of two matrice with same dimension" do
      temp = test_matrix.copy
      temp.set_all 1
      temp2 = test_matrix.copy
      temp2.set_all 2
      (temp2 * temp).should eq ((GSL::DenseMatrix.new 5, 5).set_all 10)
    end
    it "should return the multiplication of two matrice with different dimension" do
      temp = [
        [1, 2, 3],
        [2, 3, 4],
      ].to_matrix
      temp2 = [
        [2, 2],
        [3, 3],
        [4, 4],
      ].to_matrix

      (temp * temp2).should eq ([[20, 20], [29, 29]].to_matrix)
    end
    it "should return the scale of one matrix and an integer" do
      temp = test_matrix.copy
      temp.set_all 5
      (temp * 2).should eq ((GSL::DenseMatrix.new 5, 5).set_all 10)
    end
    it "should return the scale of one matrix and an float" do
      temp = test_matrix.copy
      temp.set_all 5
      (temp * 2.0).should eq ((GSL::DenseMatrix.new 5, 5).set_all 10)
    end
    it "should return a matrix with the same dimensions" do
      temp = test_matrix.like
      temp.shape.should eq({5, 5})
    end
  end
  describe "#inverse" do
    it "should return the inverse of the input matrix" do
      tester = [
        [1.0, 0.6, 0.0],
        [0.0, 1.5, 1.0],
        [0.0, 1.0, 1.0],
      ].to_matrix
      target = [
        [1.0, -1.2, 1.2],
        [0.0, 2.0, -2.0],
        [0.0, -2.0, 3.0],
      ].to_matrix
      tester.inverse.should be_close target, 1e-9
    end
  end
end
