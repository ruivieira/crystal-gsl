module GSL
  alias Function = (Float64 -> Float64)

  def self.wrap_function(function : Function)
    result = uninitialized LibGSL::Gsl_function
    if function.closure?
      box = Box.box(function)
      # (LibC::Double, Void* -> LibC::Double)
      result.function = ->(x : Float64, data : Void*) do
        Box(Function).unbox(data).call(x)
      end
      result.params = box # no need to keep reference to `box` as `result` holds it.
    else
      result.params = function.pointer
      result.function = ->(x : Float64, data : Void*) do
        Function.new(data, Pointer(Void).null).call(x)
      end
    end
    result
  end

  def self.wrap_function(&function : Function)
    wrap_function(function)
  end
end
