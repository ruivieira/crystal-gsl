require "./libgsl.cr"

module GSL

    def self.lgamma(x : Float64) : Float64
        return LibGSL.gsl_sf_lngamma(x)
    end

end