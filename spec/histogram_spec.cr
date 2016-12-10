require "./spec_helper"

describe GSL do
  describe "Allocation" do
    it "must return the correct number of bins" do
      h = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), 100
      h.nbins.should eq 100
    end

    expect_raises(ArgumentError) do
      h = GSL::Histogram.new [] of Float64, 100
    end

    it "should return true for histogram with identical bins" do
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h1.equal_bins(h2).should eq true
    end
  end
end
