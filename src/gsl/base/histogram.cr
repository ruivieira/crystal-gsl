require "./libgsl.cr"

module GSL
  class Histogram
    getter nbins

    # TODO: case where data is empty
    def initialize(data : Array(Float), bins : Int32)
      if data.empty?
        raise ArgumentError.new("Data must not be empty")
      end
      @histogram = LibGSL.gsl_histogram_alloc bins
      @nbins = bins
      LibGSL.gsl_histogram_set_ranges_uniform @histogram, data.min, data.max
      data.each { |x| LibGSL.gsl_histogram_increment @histogram, x }
    end

    def initialize(data : Array(Float), bins : Array(Float))
      @nbins = bins.size
      @histogram = LibGSL.gsl_histogram_alloc @nbins
      LibGSL.gsl_histogram_set_ranges(@histogram, bins, @nbins + 1)
      data.each { |x| LibGSL.gsl_histogram_increment @histogram, x }
    end

    def bin(n : Int) : Float64
      return LibGSL.gsl_histogram_get(@histogram, n)
    end

    def range(n : Int) : Tuple(Float64, Float64)
      min = 0.0
      max = 0.0
      LibGSL.gsl_histogram_get_range(@histogram, n, pointerof(min), pointerof(max))
      return {min, max}
    end

    def find(x : Float64) : UInt64
      index = 0.to_u64
      LibGSL.gsl_histogram_find(@histogram, x, pointerof(index))
      return index
    end

    # This function returns the maximum value contained in the histogram bins.
    def max_val : Float64
      return LibGSL.gsl_histogram_max_val @histogram
    end

    # This function returns the minimum value contained in the histogram bins.
    def min_val : Float64
      return LibGSL.gsl_histogram_min_val @histogram
    end

    # This function returns the index of the bin containing the maximum value.
    # In the case where several bins contain the same maximum value the smallest index is returned.
    def max_bin : UInt64
      return LibGSL.gsl_histogram_max_bin @histogram
    end

    # This function returns the index of the bin containing the minimum value.
    # In the case where several bins contain the same maximum value the smallest index is returned.
    def min_bin : UInt64
      return LibGSL.gsl_histogram_min_bin @histogram
    end

    # This function returns the mean of the histogrammed variable, where the histogram is regarded as a probability distribution.
    # Negative bin values are ignored for the purposes of this calculation.
    # The accuracy of the result is limited by the bin width.
    def mean : Float64
      return LibGSL.gsl_histogram_mean @histogram
    end

    # This function returns the standard deviation of the histogrammed variable, where the histogram is regarded as a probability distribution.
    # Negative bin values are ignored for the purposes of this calculation.
    # The accuracy of the result is limited by the bin width.
    def sigma : Float64
      return LibGSL.gsl_histogram_sigma @histogram
    end

    # This function returns the sum of all bin values.
    # Negative bin values are included in the sum.
    def sum : Float64
      return LibGSL.gsl_histogram_sum @histogram
    end
  end
end
