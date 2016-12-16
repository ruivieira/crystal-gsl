require "./libgsl.cr"

module GSL
  class Permutation(T)
    include Iterator(Array(T))
    @n : Int32

    def initialize(@data : Array(T))
      @n = @data.size
      @permutation = LibGSL.gsl_permutation_calloc(@n)
    end

    def next
      if LibGSL.gsl_permutation_next(@permutation) == 0
        return (0...@n).map { |i|
          @data[LibGSL.gsl_permutation_get(@permutation, i)]
        }
      else
        stop
      end
    end

    def rewind
      @permutation = LibGSL.gsl_permutation_calloc(@n)
      self
    end

    def previous : Array(T)
      LibGSL.gsl_permutation_prev(@permutation)
      return (0...@n).map { |i|
        @data[LibGSL.gsl_permutation_get(@permutation, i)]
      }
    end
  end
end
