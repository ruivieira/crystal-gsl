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
end
