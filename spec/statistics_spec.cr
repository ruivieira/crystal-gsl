require "./spec_helper"

describe Statistics do
  describe "Binomial" do
    it "must return the corrent number of elements" do
      samples = Statistics::Binomial.sample(100, 0.5, 1_u64)
      samples.size.should eq 100
    end

    it "must return samples within the number of trials" do
      samples = Statistics::Binomial.sample(100, 0.5, 1_u64)
      samples.all? { |x| x == 0 || x == 1 }.should eq true
    end
  end

  describe "DiscreteUniform" do
    it "must be within the min and max" do
      uniforms = (1..1000).map { |i| Statistics::DiscreteUniform.sample(0, 1) }
      uniforms.all? { |x| x >= 0 && x <= 1 }.should eq true
    end

    it "has the expected number of samples" do
      uniforms = Statistics::DiscreteUniform.sample(1000, 0, 1)
      uniforms.size.should eq 1000
    end

    expect_raises(ArgumentError) do
      Statistics::DiscreteUniform.sample(1, 0)
    end
  end

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

  describe "Poisson" do
    it "should have the correct mean" do
      samples = Statistics::Poisson.sample(1000000, 2.3)
      mean = Statistics.mean(samples.map { |sample| sample.to_f })
      mean.should be_close(2.3, 1e-2)
    end
  end

  describe "Uniform" do
    it "should return an array of the correct dimension" do
      xs = Statistics::Uniform.sample(100, 0.0, 1.0)
      xs.size.should eq 100
    end

    it "should be within support" do
      xs = Statistics::Uniform.sample(100, 0.0, 1.0)
      xs.all? { |x| x > 0.0 && x < 1.0 }.should eq true
    end
  end

  describe "Matrix" do
    it "should set a vector as a column" do
      m = Statistics::Matrix.new 4, 4
      v = Statistics::Vector.new 4

      m[0, 0] = 0.0
      m[0, 1] = 1.0
      m[0, 2] = 2.0
      m[0, 3] = 3.0

      m[1, 0] = 4.0
      m[1, 1] = 5.0
      m[1, 2] = 6.0
      m[1, 3] = 7.0

      v[0] = -1.0
      v[1] = -2.0
      v[2] = -3.0
      v[3] = -4.0

      m.set_row(1, v)

      (0...4).each do |i|
        m[1, i].should eq v[i]
      end
    end

    it "increment in-place" do
      m = Statistics::Matrix.new 2, 2
      m[0, 0] = 5.0

      m[0, 0] = m[0, 0] + 5.0

      m[0, 0].should eq 10.0
    end

    it "increment in-place syntax sugar" do
      m = Statistics::Matrix.new 2, 2
      m[0, 0] = 5.0

      m[0, 0] += 5.0

      m[0, 0].should eq 10.0
    end

    it "eye should have correct form" do
      m = Statistics::Matrix.eye 3
      (0...3).each do |x|
        m[x, x].should eq 1.0
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

  describe "Linear space" do
    it "should return the correct size" do
      items = 10
      l = Statistics.linspace(1.0, 10.0, items)
      l.size.should eq items
    end
  end
end
