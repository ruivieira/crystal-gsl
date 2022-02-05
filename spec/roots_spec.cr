require "./spec_helper"

describe GSL do
  describe "One Dimensional Root Finding" do
    it "performs root bracketing using high-level interface" do
      xm = GSL::Roots.find_root(0, 3) do |x|
        Math.cos(x) - 0.5
      end
      xm.should be_close(Math::PI / 3, 1e-9)
    end
  end
end
