module GSL
  alias Function = (Float64 -> Float64)
  alias FunctionFDF = (Float64 -> Tuple(Float64, Float64))

  # wraps user supplied function (can be closured) to the `LibGSL::Gsl_Function` structure.
  # note that if you pass resulting function to some C code, you have to keep reference somewhere so it won't be garbage collected.
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

  def self.wrap_function(function : FunctionFDF)
    result = uninitialized LibGSL::Gsl_function_fdf
    if function.closure?
      box = Box.box(function)
      # (LibC::Double, Void*, LibC::Double*, LibC::Double* -> Void)
      result.f = ->(x : Float64, data : Void*) do
        f, _ = Box(FunctionFDF).unbox(data).call(x)
        f
      end
      result.df = ->(x : Float64, data : Void*) do
        _, df = Box(FunctionFDF).unbox(data).call(x)
        df
      end
      result.fdf = ->(x : Float64, data : Void*, f : Float64*, df : Float64*) do
        f.value, df.value = Box(FunctionFDF).unbox(data).call(x)
      end
      result.params = box # no need to keep reference to `box` as `result` holds it.
    else
      result.params = function.pointer
      result.f = ->(x : Float64, data : Void*) do
        f, _ = FunctionFDF.new(data, Pointer(Void).null).call(x)
        f
      end
      result.df = ->(x : Float64, data : Void*) do
        _, df = FunctionFDF.new(data, Pointer(Void).null).call(x)
        df
      end
      result.fdf = ->(x : Float64, data : Void*, f : Float64*, df : Float64*) do
        f.value, df.value = FunctionFDF.new(data, Pointer(Void).null).call(x)
      end
    end
    result
  end

  def self.wrap_function(&function : FunctionFDF)
    wrap_function(function)
  end
end
