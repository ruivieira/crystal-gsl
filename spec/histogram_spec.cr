require "./spec_helper"

describe GSL do
  describe "Allocation" do
    it "must return the correct number of bins" do
      h = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), 100
      h.nbins.should eq 100
    end

    it "bins must be empty for empty data" do
      h = GSL::Histogram.new [] of Float64, 100
      v = (0...100).map { |i| h.bin(i) }
      v.all? { |x| x == 0.0 }.should eq true
    end
  end
end
