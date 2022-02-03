module GSL::ODE
  abstract class System
    @@same_function : (LibC::Double, LibC::Double*, LibC::Double*, Void* -> LibC::Int) = ->(t : LibC::Double, y : LibC::Double*, dydt : LibC::Double*, data : Void*) do
      sys = data.as(System)
      sys.function(t, y.to_slice(sys.size), dydt.to_slice(sys.size))
      return 0
    end

    @@same_jacobian : (LibC::Double, LibC::Double*, LibC::Double*, LibC::Double*, Void* -> LibC::Int) = ->(t : LibC::Double, y : LibC::Double*, dfdt : LibC::Double*, dfdy : LibC::Double*, data : Void*) do
      sys = data.as(System)
      sys.jacobian(t, y.to_slice(sys.size), dfdt.to_slice(sys.size), dfdy.to_slice(sys.size*sys.size))
      return 0
    end

    @raw : LibGSL::Gsl_odeiv2_system

    def to_unsafe
      pointerof(@raw)
    end

    abstract def function(t : LibC::Double, y : Slice(LibC::Double), dydt : Slice(LibC::Double))
    abstract def jacobian(t : LibC::Double, y : Slice(LibC::Double), dfdt : Slice(LibC::Double), dfdy : Slice(LibC::Double))

    def size
      @raw.dimension
    end

    def initialize(size : Int32)
      @raw = uninitialized LibGSL::Gsl_odeiv2_system
      @raw.dimension = n
      @raw.params = self.as(Void*)
      @raw.function = @@same_function
      @raw.jacobian = @@same_jacobian
    end
  end

  enum Algorithm
    RK2
    RK4
    RKF45
    RKCK
    RK8PD
    RK1IMP
    RK2IMP
    RK4IMP
    BSIMP
    MSADAMS
    MSBDF
  end

  private def self.step_type(algorithm : Algorithm)
    case algorithm
    in .rk2?
      LibGSL.gsl_odeiv2_step_rk2
    in .rk4?
      LibGSL.gsl_odeiv2_step_rk4
    in .rkf45?
      LibGSL.gsl_odeiv2_step_rkf45
    in .rkck?
      LibGSL.gsl_odeiv2_step_rkck
    in .rk8pd?
      LibGSL.gsl_odeiv2_step_rk8pd
    in .rk2imp?
      LibGSL.gsl_odeiv2_step_rk2imp
    in .rk4imp?
      LibGSL.gsl_odeiv2_step_rk4imp
    in .bsimp?
      LibGSL.gsl_odeiv2_step_bsimp
    in .rk1imp?
      LibGSL.gsl_odeiv2_step_rk1imp
    in .msadams?
      LibGSL.gsl_odeiv2_step_msadams
    in .msbdf?
      LibGSL.gsl_odeiv2_step_msbdf
    end
  end

  class Driver
    @raw : Pointer(LibGSL::Gsl_odeiv2_driver)
    getter system : System

    # low level API

    def to_unsafe
      @raw
    end

    def free
      # to prevent second free (e.g. during finalize)
      return if @raw == Pointer(LibGSL::Gsl_odeiv2_driver).null?
      LibGSL.gsl_odeiv2_driver_free(@raw)
      @raw = Pointer(LibGSL::Gsl_odeiv2_driver).null
    end

    def finalize
      free
    end

    delegate hmin, hmax, nmax, to: @raw.value

    def hmin=(value)
      LibGSL.gsl_odeiv2_driver_set_hmin(@raw, value)
    end

    def hmax=(value)
      LibGSL.gsl_odeiv2_driver_set_hmax(@raw, value)
    end

    def nmax=(value)
      LibGSL.gsl_odeiv2_driver_set_nmax(@raw, value)
    end

    def reset(initial_step)
      LibGSL.gsl_odeiv2_driver_reset_hstart(@raw, initial_step)
    end

    def reset
      LibGSL.gsl_odeiv2_driver_reset(@raw)
    end

    property initial_step : Float64

    def initialize(@system, @initial_step, epsabs : Float64 = 0.0, epsrel : Float64 = 0.0, step_algo : Algorithm = Algorithm::RKF45, a_y : Float64 = 0.0, a_dydt : Float64 = 1.0, scale_abs : Array(Float64)? = nil)
      if scales
        raise ArgumentError.new("Scales size should match dimension of system") if scale_abs.size != @system.size
        @raw = gsl_odeiv2_driver_alloc_scaled_new(
          @system.to_unsafe,
          step_type(step_algo),
          initial_step,
          epsabs, epsrel,
          a_y, a_dydt,
          scales.to_unsafe)
      else
        @raw = gsl_odeiv2_driver_alloc_standard_new(
          @system.to_unsafe,
          step_type(step_algo),
          initial_step,
          epsabs, epsrel,
          a_y, a_dydt)
      end
      @state = Slice(Float64).new(@system.size)
    end

    def apply(t0 : Float64, t1 : Float64, y : Array(Float64) | Slice(Float64))
      raise ArgumentError.new("State size should match dimension of system") unless y.size == @system.size
      y = y.to_unsafe.to_slice(y.size) unless y.is_a? Slice
      LibGSL.gsl_odeiv2_driver_apply(@raw, t0, t1, y)
    end

    # high level API

    # evaluate states at given array of time points
    def evolve(y_initial, time_points, &)
      raise ArgumentError.new("State size should match dimension of system") unless y_initial.size == @system.size
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      t0 = time_points[0]
      reset
      (1...time_points.size).each do |i|
        t1 = time_points[i]
        apply(t0, t1, @state)
        yield(@state, t1)
        t0 = t1
      end
    end

    # evaluate states at given step from t0 to t1
    def evolve(y_initial, t0 : Float64, t1 : Float64, dt : Float64, &)
      raise ArgumentError.new("State size should match dimension of system") unless y_initial.size == @system.size
      raise ArgumentError.new("dt should be > 0") if dt <= 0
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      t = t0
      reset
      while t < t1
        t_next = {t0 + dt, t1}.min
        apply(t, t_next, @state)
        yield(@state, t_next)
        t = t_next
      end
    end

    # evaluate states with natural step from t0 to t1
    def evolve(y_initial, t0 : Float64, t1 : Float64, &)
      raise ArgumentError.new("State size should match dimension of system") unless y_initial.size == @system.size
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      t = t0
      reset(@initial_step)
      h = @initial_step
      while t < t1
        LibGSL.gsl_odeiv2_evolve_apply(@raw.value.e, @raw.value.c, @raw.value.s, @raw.value.sys, pointerof(t), t1, pointerof(h), @state)
        raise "ODE doesn't converge" if h < hmin
        yield(@state, t)
      end
    end

    # array versions of previous functions

    def evolve(y_initial, time_points)
      results = Array(Slice(Float64)).new(time_points.size)
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      results << @state.clone
      evolve(y_initial, time_points) do |y, t|
        results << y.clone
      end
      results
    end

    def evolve(y_initial, t0, t1)
      states = Array(Slice(Float64)).new
      times = Array(Slice(Float64)).new
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      states << @state.clone
      times << t0
      evolve(y_initial, t0, t1) do |y, t|
        states << y.clone
        times << t
      end
      {states, times}
    end

    def evolve(y_initial, t0, t1, step)
      states = Array(Slice(Float64)).new((t1 - t0)/step)
      times = Array(Slice(Float64)).new((t1 - t0)/step)
      @system.size.times do |i|
        @state[i] = y_initial[i]
      end
      states << @state.clone
      times << t0
      evolve(y_initial, t0, t1, step) do |y, t|
        states << y.clone
        times << t
      end
      {states, times}
    end
  end
end
