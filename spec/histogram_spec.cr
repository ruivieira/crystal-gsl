require "./spec_helper"

describe GSL do
  describe "Immutable Histogram" do
    it "must return the correct number of bins" do
      h = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), 100
      h.nbins.should eq 100
    end

    expect_raises(ArgumentError) do
      h = GSL::Histogram.new [] of Float64, 100
    end

    expect_raises(NonIdenticalHistograms) do
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 1.0, 10.0, 1000.0]
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h3 = h1 + h2
    end

    it "should return true for histogram with identical bins" do
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h1.equal_bins(h2).should eq true
    end

    it "should return false for histogram with non-identical bins" do
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 0.0, 10.0, 1000.0]
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), [-10.0, -1.0, 2.0, 10.0, 1000.0]
      h1.equal_bins(h2).should eq false
    end

    it "adding should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2_original = h2.bin(50)
      h3 = h1 + h2
      h1.bin(50).should eq h1_original
    end

    it "adding should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h3 = h1 + h2
      sum = h1.bin(50) + h2.bin(50)
      h3.bin(50).should eq sum
    end

    it "subtracting should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2_original = h2.bin(50)
      h3 = h1 - h2
      h1.bin(50).should eq h1_original
    end

    it "subtracting should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h3 = h1 - h2
      sum = h1.bin(50) - h2.bin(50)
      h3.bin(50).should eq sum
    end

    it "multiplying should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2_original = h2.bin(50)
      h3 = h1 * h2
      h1.bin(50).should eq h1_original
    end

    it "multiplying should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h3 = h1 * h2
      sum = h1.bin(50) * h2.bin(50)
      h3.bin(50).should eq sum
    end

    it "dividing should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2_original = h2.bin(50)
      h3 = h1 / h2
      h1.bin(50).should eq h1_original
    end

    it "dividing should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h3 = h1 / h2
      sum = h1.bin(50) / h2.bin(50)
      h3.bin(50).should eq sum
    end

    it "scaling should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2 = h1 * 2.0
      h1.bin(50).should eq h1_original
    end

    it "scaling should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = h1 * 2.0
      sum = h1.bin(50) * 2.0
      h2.bin(50).should eq sum
    end

    it "offset should not modify originals" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h1_original = h1.bin(50)
      h2 = h1 + 2.0
      h1.bin(50).should eq h1_original
    end

    it "offset should return correct value" do
      bins = Statistics.linspace(-10.0, 10.0, 100)
      h1 = GSL::Histogram.new Statistics::Normal.sample(1000, 0.0, 1.0), bins
      h2 = h1 + 2.0
      sum = h1.bin(50) + 2.0
      h2.bin(50).should eq sum
    end
  end

  describe "Mutable Histogram" do
    it "must return the correct number of bins by extremes" do
      bins = 100
      h = GSL::MutableHistogram.new -5.0, 5.0, bins
      h.nbins.should eq bins
    end
    it "must return the correct number of bins by ranges" do
      bins = Statistics.linspace(-10.0, 10.0, 50)
      h = GSL::MutableHistogram.new bins
      h.nbins.should eq bins.size - 1
    end
    it "increment must set the correct values" do
      bins = Statistics.linspace(-10.0, 10.0, 50)
      h = GSL::MutableHistogram.new bins
      # destination bin
      b = h.find(5.0)
      (0...100).each { |i|
        h.increment(5.0)
      }
      h.bin(b).should eq 100
    end
    it "accumulate must set the correct values" do
      bins = Statistics.linspace(-10.0, 10.0, 50)
      h = GSL::MutableHistogram.new bins
      # destination bin
      b = h.find(5.0)
      (0...100).each { |i|
        h.accumulate x: 5.0, weight: 0.1
      }
      h.bin(b).should be_close(10.0, 1e-5)
    end
  end
end
