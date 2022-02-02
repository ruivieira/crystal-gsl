require "./spec_helper"

describe GSL::Diff do
  it "differentiate simple function" do
    f = ->(x : Float64) { Math.log(x) }
    result, eps = GSL.diff(f, 4.0)
    result.should be_close 0.25, 1e-9
  end

  it "differentiate simple function in yield syntax" do
    result, eps = GSL.diff(0.25) { |x| Math.log(x) }
    result.should be_close 4.0, 1e-9
  end
end
