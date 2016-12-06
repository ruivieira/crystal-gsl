require "./spec_helper"

describe Sorting do
  describe "QuickSort" do
    it "must return the same number of elements" do
      list = [1.0, 2.0, 10.0, 3.1, 2.9, 11.0]
      size = list.size
      sorted = Sorting.qsort(list)
      sorted.size.should eq size
    end
  end

  describe "QuickSort" do
    it "must return a sorted list" do
      list = [1.0, 2.0, 10.0, 3.1, 2.9, 11.0]
      sorted = Sorting.qsort(list)
      sorted.should eq [1.0, 2.0, 2.9, 3.1, 10.0, 11.0]
    end
  end
end
