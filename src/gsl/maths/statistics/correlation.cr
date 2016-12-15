module GSL
  module Stats
    def self.correlation(vector1 : GSL::Vector, vector2 : GSL::Vector)
      LibGSL.gsl_stats_correlation(vector1.to_a, 1, vector2.to_a, 1, vector1.size)
    end

    def self.spearman(vector1 : GSL::Vector, vector2 : GSL::Vector)
      LibGSL.gsl_stats_correlation(vector1.ranked.to_a, 1, vector2.ranked.to_a, 1, vector1.ranked.size)
    end
  end
end
