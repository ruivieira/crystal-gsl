require "./spec_helper"

describe GSL do
  describe "Log-gamma" do
    it "must return the correct value" do
      x = GSL.lgamma(0.1)
      x.should eq 2.2527126517342047
    end
  end
end
