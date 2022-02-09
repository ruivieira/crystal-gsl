require "./spec_helper"

ROWS = 5
COLS = 5
test_matrix = GSL::SparseMatrix.new ROWS, COLS

describe GSL::SparseMatrix do
  describe "#nrows" do
    it "should return the number of rows of a matrix" do
      test_matrix.nrows.should eq ROWS
    end
  end
  describe "#ncols" do
    it "should return the number of columns of a matrix" do
      test_matrix.ncols.should eq COLS
    end
  end
  describe "#shape" do
    it "should return the shape of a matrix" do
      test_matrix.shape.should eq ({ROWS, COLS})
    end
  end
  describe "#[]" do
    it "should return a value of expected index" do
      test_matrix[0, 0].should eq 0.0
    end
    it "should return a vector of expected column" do
      test_matrix[:all, 0].should eq (GSL::Vector.new ROWS)
    end
    it "should return a vector of expected row" do
      test_matrix[0, :all].should eq (GSL::Vector.new COLS)
    end
    it "should return a matrix with the same dimensions" do
      temp = test_matrix.like
      temp.shape.should eq({5, 5})
    end
  end
  describe "#set_zero" do
    it "should set all the values in the sparse matrix to zero" do
      temp = GSL::SparseMatrix.new ROWS, COLS
      temp[0, 0] = 10
      temp.set_zero.should eq test_matrix
    end
  end
  describe "#*" do
    it "should return the scaling of two matrices" do
      temp = test_matrix.like
      temp[0, 0] = 7.0
      result = test_matrix.like
      result[0, 0] = 14.0
      (temp * 2.0).should eq result
    end
  end
  describe "#non_zero" do
    it "should count all non-zero entries" do
      temp = GSL::SparseMatrix.new ROWS, COLS
      temp[0, 0] = 10
      temp[1, 1] = 5.0
      temp.non_zero.should eq 2
    end
  end
  describe "#minmax" do
    it "should return the minimum and maximun value of the matrix" do
      temp = test_matrix.like
      temp[0, 0] = 1
      temp.minmax.should eq [0, 1]
    end
    it "should return 0 value for empty matrix" do
      temp = test_matrix.like
      temp.minmax.should eq [0, 0]
    end
  end
end
