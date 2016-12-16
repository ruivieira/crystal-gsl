require "./spec_helper"

length_ten_vector = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].to_vector
length_four_vector = [1, 2, 3, 4].to_vector
describe GSL::Vector do
  describe "#+" do
    it "should add every element with input integer" do
      (length_four_vector + 10).should eq (GSL::Vector.new [11.0, 12.0, 13.0, 14.0])
    end
    it "should add every element with input float" do
      (length_four_vector + 10.0).should eq (GSL::Vector.new [11.0, 12.0, 13.0, 14.0])
    end
    it "should add two vectors together" do
      (length_four_vector + [1, 2, 3, 4].to_vector).should eq (GSL::Vector.new [2.0, 4.0, 6.0, 8.0])
    end
  end
  describe "#-" do
    it "should sub every element with input integer" do
      (length_four_vector - 1).should eq (GSL::Vector.new [0.0, 1.0, 2.0, 3.0])
    end
    it "should sub every element with input float" do
      (length_four_vector - 1.0).should eq (GSL::Vector.new [0.0, 1.0, 2.0, 3.0])
    end
    it "should sub two vectors together" do
      (length_four_vector - [1, 2, 3, 4].to_vector).should eq (GSL::Vector.new [0.0, 0.0, 0.0, 0.0])
    end
  end
  describe "#*" do
    it "should scale every element with input integer" do
      (length_four_vector * 2).should eq (GSL::Vector.new [2.0, 4.0, 6.0, 8.0])
    end
    it "should scale every element with input float" do
      (length_four_vector * 2.0).should eq (GSL::Vector.new [2.0, 4.0, 6.0, 8.0])
    end
    it "should multiply two vectors together" do
      (length_four_vector * [1, 2, 3, 4].to_vector).should eq (GSL::Vector.new [1.0, 4.0, 9.0, 16.0])
    end
  end
  describe "#/" do
    it "should divide every element with input integer" do
      (length_four_vector / 2).should eq (GSL::Vector.new [0.5, 1.0, 1.5, 2.0])
    end
    it "should divide every element with input float" do
      (length_four_vector / 2.0).should eq (GSL::Vector.new [0.5, 1.0, 1.5, 2.0])
    end
    it "should divide two vectors together" do
      (length_four_vector / [1, 2, 3, 4].to_vector).should eq (GSL::Vector.new [1.0, 1.0, 1.0, 1.0])
    end
  end
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
  describe "#first" do
    it "should return the first element of vector" do
      length_four_vector.first.should eq 1.0
    end
  end
  describe "#last" do
    it "should return the last element of vector" do
      length_four_vector.last.should eq 4.0
    end
  end
  describe "#to_array" do
    it "should return the data of this vector" do
      length_four_vector.to_array.should eq [1.0, 2.0, 3.0, 4.0]
    end
    it "should return the data of this vector" do
      length_four_vector.to_a.should eq [1.0, 2.0, 3.0, 4.0]
    end
  end
  describe "#push" do
    it "should push data to the last of vector" do
      (length_four_vector.push 5).should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0, 5.0])
    end
    it "should push data to the last of vector" do
      (length_four_vector << 5).should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0, 5.0])
    end
  end
  describe "#includes?" do
    it "should return true if the data is in the vector" do
      (length_four_vector.includes? 4).should eq true
    end
    it "should return true if the data is in the vector" do
      (length_four_vector.includes? 4.0).should eq true
    end
    it "should return false if the data is not in the vector" do
      (length_four_vector.includes? 5).should eq false
    end
    it "should return false if the data is not in the vector" do
      (length_four_vector.includes? 5.0).should eq false
    end
  end
  describe "#concat" do
    it "should concatenate two vectors together" do
      (length_four_vector.concat length_ten_vector).should eq (GSL::Vector.new [1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])
    end
  end
end
