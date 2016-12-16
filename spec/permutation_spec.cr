require "./spec_helper"

describe GSL do
  describe "Permutations allocation" do
    it "move to next permutation" do
      data = [1, 3, 6, 10, 5]
      p = GSL::Permutation(Int32).new data
      p1 = p.next
      p1.should eq [1, 3, 6, 5, 10]
    end
    it "move to previous permutation" do
      data = [1, 3, 6, 10, 5]
      p = GSL::Permutation(Int32).new data
      p1 = p.previous # already first, returns original
      p1.should eq data
    end
  end
end
