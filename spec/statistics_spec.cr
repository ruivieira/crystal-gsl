require "./spec_helper"

describe Statistics do

  describe "Normal" do

    it "has the expected number of samples" do
      normal = Statistics::Normal.new 0.0, 1.0
      n = 100
      samples = normal.sample(n)
      samples.size.should eq n
    end

    it "has the expected mean" do
      normal = Statistics::Normal.new 0.0, 1.0
      n = 100000
      samples = normal.sample(n)
      mean = Statistics.mean(samples)
      mean.should be_close(0.0, 1e-2)
    end
  end

  describe "Matrix" do

    it "should set a vector as a column" do
      m = Statistics::Matrix.new 4, 4
      v = Statistics::Vector.new 4

      m[0,0] = 0.0
      m[0,1] = 1.0
      m[0,2] = 2.0
      m[0,3] = 3.0

      m[1,0] = 4.0
      m[1,1] = 5.0
      m[1,2] = 6.0
      m[1,3] = 7.0

      v[0] = -1.0
      v[1] = -2.0
      v[2] = -3.0
      v[3] = -4.0

      m.set_row(1, v)

      (0...4).each do |i|
        m[1,i].should eq v[i]
      end
    end


    it "increment in-place" do
      m = Statistics::Matrix.new 2,2
      m[0,0] = 5.0

      m[0,0] = m[0,0] + 5.0

      m[0,0].should eq 10.0
    end

    it "increment in-place syntax sugar" do
      m = Statistics::Matrix.new 2,2
      m[0,0] = 5.0

      m[0,0] += 5.0

      m[0,0].should eq 10.0
    end

    it "eye should have correct form" do
      m = Statistics::Matrix.eye 3
      (0...3).each do |x|
        m[x,x].should eq 1.0
      end
    end
  end

  describe "Vector" do

    it "should initialize given an array" do
      a = [1.0, 2.0, 3.0, 4.0, 5.0]
      v = Statistics::Vector.new a

      v.size.should eq 5
      (0...v.size).each do |i|
        v[i].should eq a[i]
      end
    end

    it "converted to array should keep dimensions" do
      a = [1.0, 2.0, 3.0, 4.0, 5.0]
      v = Statistics::Vector.new a

      v.to_array.size.should eq a.size
    end

  end

end
