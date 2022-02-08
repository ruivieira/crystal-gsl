# this is a Crystal translation of gsl/min/bracketing.c
# with patch proposed in http://savannah.gnu.org/bugs/?45053

# TODO - move somewhere?
private GOLDEN               =              0.3819660
private GSL_SQRT_DBL_EPSILON = 1.4901161193847656e-08

module GSL::Min
  def self.min_find_bracket(f : GSL::Function, x_minimum : LibC::Double*, f_minimum : LibC::Double*, x_lower : LibC::Double*, f_lower : LibC::Double*, x_upper : LibC::Double*, f_upper : LibC::Double*, eval_max : Int32) : LibGSL::Code
    f_left = f_lower.value
    f_right = f_upper.value
    f_center = f_left
    x_left = x_lower.value
    x_right = x_upper.value
    x_center = x_left
    nb_eval = 0
    if f_right >= f_left
      x_center = (x_right - x_left) * GOLDEN + x_left
      nb_eval += 1
      f_center = f.call(x_center)
    else
      x_center = (x_right - x_left) * (1 - GOLDEN) + x_left
      nb_eval += 1
      f_center = f.call(x_center)
    end
    loop do
      if f_center < f_left
        if f_center < f_right
          x_lower.value = x_left
          x_upper.value = x_right
          x_minimum.value = x_center
          f_lower.value = f_left
          f_upper.value = f_right
          f_minimum.value = f_center
          return LibGSL::Code::GSL_SUCCESS
        elsif f_center > f_right
          x_left = x_center
          f_left = f_center
          x_center = (x_right - x_left) * (1 - GOLDEN) + x_left
          nb_eval += 1
          f_center = f.call(x_center)
        else # /* f_center == f_right */
          x_right = x_center
          f_right = f_center
          x_center = (x_right - x_left) * GOLDEN + x_left
          nb_eval += 1
          f_center = f.call(x_center)
        end
      else # /* f_center >= f_left */
        x_right = x_center
        f_right = f_center
        x_center = (x_right - x_left) * GOLDEN + x_left
        nb_eval += 1
        f_center = f.call(x_center)
      end
      break unless nb_eval < eval_max && (x_right - x_left) > GSL_SQRT_DBL_EPSILON * ((x_right + x_left) * 0.5) + GSL_SQRT_DBL_EPSILON
    end
    x_lower.value = x_left
    x_upper.value = x_right
    x_minimum.value = x_center
    f_lower.value = f_left
    f_upper.value = f_right
    f_minimum.value = f_center
    return LibGSL::Code::GSL_FAILURE
  end
end
