require "./libgsl.cr"

module GSL
  abstract class AbstractHistogram
    def nbins
      @histogram.value.n
    end

    protected def getHistogram
      return @histogram
    end

    protected def setHistogram(histogram : Gsl_histogram*)
      @histogram = histogram
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

    # This function returns *true* if the all of the individual bin ranges of the two histograms are identical, and *false* otherwise.
    def equal_bins(h : Histogram) : Bool
      return LibGSL.gsl_histogram_equal_bins_p(@histogram, h.getHistogram) == 1 ? true : false
    end

    # Returns an exact copy of this histogram
    def clone : Histogram
      return Histogram.new LibGSL.gsl_histogram_clone @histogram
    end
  end

  class Histogram < AbstractHistogram
    def initialize(data : Array(Float), bins : Array(Float))
      @histogram = LibGSL.gsl_histogram_alloc bins.size - 1
      LibGSL.gsl_histogram_set_ranges(@histogram, bins, bins.size)
      data.each { |x| LibGSL.gsl_histogram_increment @histogram, x }
    end

    protected def initialize(@histogram : LibGSL::Gsl_histogram*)
    end

    # TODO: case where data is empty
    def initialize(data : Array(Float), bins : Int32)
      if data.empty?
        raise ArgumentError.new("Data must not be empty")
      end
      @histogram = LibGSL.gsl_histogram_alloc bins
      LibGSL.gsl_histogram_set_ranges_uniform @histogram, data.min, data.max
      data.each { |x| LibGSL.gsl_histogram_increment @histogram, x }
    end

    # Add the values of histograms with identical bins.
    # This is an immutable operation, it return a new Histogram without changing the originals
    def +(h : Histogram) : Histogram
      dest_hist = LibGSL.gsl_histogram_clone @histogram
      LibGSL.gsl_histogram_add(dest_hist, h.getHistogram)
      return Histogram.new dest_hist
    end
  end

  class MutableHistogram < AbstractHistogram
    def initialize(min : Float64, max : Float64, bins : Int32)
      @histogram = LibGSL.gsl_histogram_alloc bins
      LibGSL.gsl_histogram_set_ranges_uniform @histogram, min, max
    end

    def initialize(bins : Array(Float64))
      @histogram = LibGSL.gsl_histogram_alloc bins.size - 1
      LibGSL.gsl_histogram_set_ranges(@histogram, bins, bins.size)
    end
  end
end
