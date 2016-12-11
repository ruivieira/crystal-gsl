require "./spec_helper"

describe GSL do
  describe "Permutations allocation" do
    it "create a simple permutation" do
      data = [1, 3, 6, 10, 5]
      p = GSL::Permutation(Int32).new data
      p1 = p.next
      p1.should eq [1, 3, 6, 5, 10]
    end
  end
end
