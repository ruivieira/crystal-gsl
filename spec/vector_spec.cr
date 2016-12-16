require "./spec_helper"

length_ten_vector = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].to_vector
length_four_vector = [1, 2, 3, 4].to_vector
describe GSL::Vector do
  describe "#head" do
    it "should return first five data of a vector" do
      length_ten_vector.head.should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0, 5.0])
    end

    it "should return it self if the data is not long enough" do
      length_four_vector.head.should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0])
    end
  end
  describe "#tail" do
    it "should return last five data of a vector" do
      length_ten_vector.tail.should eq (GSL::Vector.new [6.0, 7.0, 8.0, 9.0, 10.0])
    end

    it "should return it self if the data is not long enough" do
      length_four_vector.tail.should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0])
    end
  end
end
