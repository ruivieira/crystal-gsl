require "./libgsl.cr"

module GSL
  class Permutation(T)
    @n : Int32

    def initialize(@data : Array(T))
      @n = @data.size
      @permutation = LibGSL.gsl_permutation_calloc(@n)
    end

    def next : Array(T)
      LibGSL.gsl_permutation_next(@permutation)
      return (0...@n).map { |i|
        @data[LibGSL.gsl_permutation_get(@permutation, i)]
      }
    end
  end
end
