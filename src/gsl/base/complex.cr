require "complex"

struct Complex
  def to_gsl
    self.unsafe_as(LibGSL::Gsl_complex)
  end

  def self.from_gsl(gsl : LibGSL::Gsl_complex)
    gsl.unsafe_as(self)
  end
end
