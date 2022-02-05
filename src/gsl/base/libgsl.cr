@[Link("cblas")]
@[Link("gsl")]
lib LibGSL
  # GSL codes
  enum Code
    GSL_SUCCESS  =  0
    GSL_FAILURE  = -1
    GSL_CONTINUE = -2 # iteration has not converged
    GSL_EDOM     =  1 # input domain error, e.g sqrt(-1)
    GSL_ERANGE   =  2 # output range error, e.g. exp(1e100)
    GSL_EFAULT   =  3 # invalid pointer
    GSL_EINVAL   =  4 # invalid argument supplied by user
    GSL_EFAILED  =  5 # generic failure
    GSL_EFACTOR  =  6 # factorization failed
    GSL_ESANITY  =  7 # sanity check failed - shouldn't happen
    GSL_ENOMEM   =  8 # malloc failed
    GSL_EBADFUNC =  9 # problem with user-supplied function
    GSL_ERUNAWAY = 10 # iterative process is out of control
    GSL_EMAXITER = 11 # exceeded max number of iterations
    GSL_EZERODIV = 12 # tried to divide by zero
    GSL_EBADTOL  = 13 # user specified an invalid tolerance
    GSL_ETOL     = 14 # failed to reach the specified tolerance
    GSL_EUNDRFLW = 15 # underflow
    GSL_EOVRFLW  = 16 # overflow
    GSL_ELOSS    = 17 # loss of accuracy
    GSL_EROUND   = 18 # failed because of roundoff error
    GSL_EBADLEN  = 19 # matrix, vector lengths are not conformant
    GSL_ENOTSQR  = 20 # matrix not square
    GSL_ESING    = 21 # apparent singularity detected
    GSL_EDIVERGE = 22 # integral or series is divergent
    GSL_EUNSUP   = 23 # requested feature is not supported by the hardware
    GSL_EUNIMPL  = 24 # requested feature not (yet) implemented
    GSL_ECACHE   = 25 # cache table limit exceeded
    GSL_ENOPROG  = 26 # iteration is not making progress towards solution
    GSL_ENOPROGJ = 27 # jacobian evaluations are not improving the solution
  end

  fun gsl_error(reason : LibC::Char*, file : LibC::Char*, line : LibC::Int, errno : LibC::Int)
  fun gsl_stream_printf(label : LibC::Char*, file : LibC::Char*, line : LibC::Int, reason : LibC::Char*)
  fun gsl_strerror(errno : LibC::Int) : LibC::Char*
  fun gsl_set_error_handler(new_handler : (LibC::Char*, LibC::Char*, LibC::Int, LibC::Int -> Void)) : (LibC::Char*, LibC::Char*, LibC::Int, LibC::Int -> Void)
  fun gsl_set_error_handler_off : (LibC::Char*, LibC::Char*, LibC::Int, LibC::Int -> Void)
  fun gsl_set_stream_handler(new_handler : (LibC::Char*, LibC::Char*, LibC::Int, LibC::Char* -> Void)) : (LibC::Char*, LibC::Char*, LibC::Int, LibC::Char* -> Void)
  fun gsl_set_stream(new_stream : File*) : File*

  type File = Void

  # struct Gsl_block_long_double
  #   size : LibC::SizeT
  #   data : LibC::LongDouble*
  # end
  #
  # fun gsl_block_long_double_alloc(n : LibC::SizeT) : Gsl_block_long_double*
  # fun gsl_block_long_double_calloc(n : LibC::SizeT) : Gsl_block_long_double*
  # fun gsl_block_long_double_free(b : Gsl_block_long_double*)
  # fun gsl_block_long_double_fread(stream : File*, b : Gsl_block_long_double*) : LibC::Int
  # fun gsl_block_long_double_fwrite(stream : File*, b : Gsl_block_long_double*) : LibC::Int
  # fun gsl_block_long_double_fscanf(stream : File*, b : Gsl_block_long_double*) : LibC::Int
  # fun gsl_block_long_double_fprintf(stream : File*, b : Gsl_block_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_block_long_double_raw_fread(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_long_double_raw_fwrite(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_long_double_raw_fscanf(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_long_double_raw_fprintf(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  # fun gsl_block_long_double_size(b : Gsl_block_long_double*) : LibC::SizeT
  # fun gsl_block_long_double_data(b : Gsl_block_long_double*) : LibC::LongDouble*
  # fun gsl_vector_long_double_alloc(n : LibC::SizeT) : Gsl_vector_long_double*
  #
  # struct Gsl_vector_long_double
  #   size : LibC::SizeT
  #   stride : LibC::SizeT
  #   data : LibC::LongDouble*
  #   block : Gsl_block_long_double*
  #   owner : LibC::Int
  # end
  #
  # fun gsl_vector_long_double_calloc(n : LibC::SizeT) : Gsl_vector_long_double*
  # fun gsl_vector_long_double_alloc_from_block(b : Gsl_block_long_double*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_long_double*
  # fun gsl_vector_long_double_alloc_from_vector(v : Gsl_vector_long_double*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_long_double*
  # fun gsl_vector_long_double_free(v : Gsl_vector_long_double*)
  # fun gsl_vector_long_double_view_array(v : LibC::LongDouble*, n : LibC::SizeT) : Gsl_vector_long_double_view
  #
  # struct Gsl_vector_long_double_view
  #   vector : Gsl_vector_long_double
  # end
  #
  # fun gsl_vector_long_double_view_array_with_stride(base : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_vector_long_double_const_view_array(v : LibC::LongDouble*, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  #
  # struct Gsl_vector_long_double_const_view
  #   vector : Gsl_vector_long_double
  # end
  #
  # fun gsl_vector_long_double_const_view_array_with_stride(base : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_vector_long_double_subvector(v : Gsl_vector_long_double*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_vector_long_double_subvector_with_stride(v : Gsl_vector_long_double*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_vector_long_double_const_subvector(v : Gsl_vector_long_double*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_vector_long_double_const_subvector_with_stride(v : Gsl_vector_long_double*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_vector_long_double_set_zero(v : Gsl_vector_long_double*)
  # fun gsl_vector_long_double_set_all(v : Gsl_vector_long_double*, x : LibC::LongDouble)
  # fun gsl_vector_long_double_set_basis(v : Gsl_vector_long_double*, i : LibC::SizeT) : LibC::Int
  # fun gsl_vector_long_double_fread(stream : File*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_fwrite(stream : File*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_fscanf(stream : File*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_fprintf(stream : File*, v : Gsl_vector_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_vector_long_double_memcpy(dest : Gsl_vector_long_double*, src : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_reverse(v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_swap(v : Gsl_vector_long_double*, w : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_swap_elements(v : Gsl_vector_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_vector_long_double_max(v : Gsl_vector_long_double*) : LibC::LongDouble
  # fun gsl_vector_long_double_min(v : Gsl_vector_long_double*) : LibC::LongDouble
  # fun gsl_vector_long_double_minmax(v : Gsl_vector_long_double*, min_out : LibC::LongDouble*, max_out : LibC::LongDouble*)
  # fun gsl_vector_long_double_max_index(v : Gsl_vector_long_double*) : LibC::SizeT
  # fun gsl_vector_long_double_min_index(v : Gsl_vector_long_double*) : LibC::SizeT
  # fun gsl_vector_long_double_minmax_index(v : Gsl_vector_long_double*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  # fun gsl_vector_long_double_add(a : Gsl_vector_long_double*, b : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_sub(a : Gsl_vector_long_double*, b : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_mul(a : Gsl_vector_long_double*, b : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_div(a : Gsl_vector_long_double*, b : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_scale(a : Gsl_vector_long_double*, x : LibC::Double) : LibC::Int
  # fun gsl_vector_long_double_add_constant(a : Gsl_vector_long_double*, x : LibC::Double) : LibC::Int
  # fun gsl_vector_long_double_equal(u : Gsl_vector_long_double*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_isnull(v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_ispos(v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_isneg(v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_isnonneg(v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_vector_long_double_get(v : Gsl_vector_long_double*, i : LibC::SizeT) : LibC::LongDouble
  # fun gsl_vector_long_double_set(v : Gsl_vector_long_double*, i : LibC::SizeT, x : LibC::LongDouble)
  # fun gsl_vector_long_double_ptr(v : Gsl_vector_long_double*, i : LibC::SizeT) : LibC::LongDouble*
  # fun gsl_vector_long_double_const_ptr(v : Gsl_vector_long_double*, i : LibC::SizeT) : LibC::LongDouble*
  #
  # struct Gsl_block_complex_long_double
  #   size : LibC::SizeT
  #   data : LibC::LongDouble*
  # end
  #
  # fun gsl_block_complex_long_double_alloc(n : LibC::SizeT) : Gsl_block_complex_long_double*
  # fun gsl_block_complex_long_double_calloc(n : LibC::SizeT) : Gsl_block_complex_long_double*
  # fun gsl_block_complex_long_double_free(b : Gsl_block_complex_long_double*)
  # fun gsl_block_complex_long_double_fread(stream : File*, b : Gsl_block_complex_long_double*) : LibC::Int
  # fun gsl_block_complex_long_double_fwrite(stream : File*, b : Gsl_block_complex_long_double*) : LibC::Int
  # fun gsl_block_complex_long_double_fscanf(stream : File*, b : Gsl_block_complex_long_double*) : LibC::Int
  # fun gsl_block_complex_long_double_fprintf(stream : File*, b : Gsl_block_complex_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_block_complex_long_double_raw_fread(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_complex_long_double_raw_fwrite(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_complex_long_double_raw_fscanf(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  # fun gsl_block_complex_long_double_raw_fprintf(stream : File*, b : LibC::LongDouble*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  # fun gsl_block_complex_long_double_size(b : Gsl_block_complex_long_double*) : LibC::SizeT
  # fun gsl_block_complex_long_double_data(b : Gsl_block_complex_long_double*) : LibC::LongDouble*
  # fun gsl_vector_complex_long_double_alloc(n : LibC::SizeT) : Gsl_vector_complex_long_double*
  #
  # struct Gsl_vector_complex_long_double
  #   size : LibC::SizeT
  #   stride : LibC::SizeT
  #   data : LibC::LongDouble*
  #   block : Gsl_block_complex_long_double*
  #   owner : LibC::Int
  # end
  #
  # fun gsl_vector_complex_long_double_calloc(n : LibC::SizeT) : Gsl_vector_complex_long_double*
  # fun gsl_vector_complex_long_double_alloc_from_block(b : Gsl_block_complex_long_double*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex_long_double*
  # fun gsl_vector_complex_long_double_alloc_from_vector(v : Gsl_vector_complex_long_double*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex_long_double*
  # fun gsl_vector_complex_long_double_free(v : Gsl_vector_complex_long_double*)
  # fun gsl_vector_complex_long_double_view_array(base : LibC::LongDouble*, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  #
  # struct Gsl_vector_complex_long_double_view
  #   vector : Gsl_vector_complex_long_double
  # end
  #
  # fun gsl_vector_complex_long_double_view_array_with_stride(base : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_vector_complex_long_double_const_view_array(base : LibC::LongDouble*, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  #
  # struct Gsl_vector_complex_long_double_const_view
  #   vector : Gsl_vector_complex_long_double
  # end
  #
  # fun gsl_vector_complex_long_double_const_view_array_with_stride(base : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_vector_complex_long_double_subvector(base : Gsl_vector_complex_long_double*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_vector_complex_long_double_subvector_with_stride(v : Gsl_vector_complex_long_double*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_vector_complex_long_double_const_subvector(base : Gsl_vector_complex_long_double*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_vector_complex_long_double_const_subvector_with_stride(v : Gsl_vector_complex_long_double*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_vector_complex_long_double_real(v : Gsl_vector_complex_long_double*) : Gsl_vector_long_double_view
  # fun gsl_vector_complex_long_double_imag(v : Gsl_vector_complex_long_double*) : Gsl_vector_long_double_view
  # fun gsl_vector_complex_long_double_const_real(v : Gsl_vector_complex_long_double*) : Gsl_vector_long_double_const_view
  # fun gsl_vector_complex_long_double_const_imag(v : Gsl_vector_complex_long_double*) : Gsl_vector_long_double_const_view
  # fun gsl_vector_complex_long_double_set_zero(v : Gsl_vector_complex_long_double*)
  # fun gsl_vector_complex_long_double_set_all(v : Gsl_vector_complex_long_double*, z : Gsl_complex_long_double)
  #
  # struct Gsl_complex_long_double
  #   dat : LibC::LongDouble[2]
  # end
  #
  # fun gsl_vector_complex_long_double_set_basis(v : Gsl_vector_complex_long_double*, i : LibC::SizeT) : LibC::Int
  # fun gsl_vector_complex_long_double_fread(stream : File*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_fwrite(stream : File*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_fscanf(stream : File*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_fprintf(stream : File*, v : Gsl_vector_complex_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_vector_complex_long_double_memcpy(dest : Gsl_vector_complex_long_double*, src : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_reverse(v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_swap(v : Gsl_vector_complex_long_double*, w : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_swap_elements(v : Gsl_vector_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_vector_complex_long_double_equal(u : Gsl_vector_complex_long_double*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_isnull(v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_ispos(v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_isneg(v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_isnonneg(v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_add(a : Gsl_vector_complex_long_double*, b : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_sub(a : Gsl_vector_complex_long_double*, b : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_mul(a : Gsl_vector_complex_long_double*, b : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_div(a : Gsl_vector_complex_long_double*, b : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_vector_complex_long_double_scale(a : Gsl_vector_complex_long_double*, x : Gsl_complex_long_double) : LibC::Int
  # fun gsl_vector_complex_long_double_add_constant(a : Gsl_vector_complex_long_double*, x : Gsl_complex_long_double) : LibC::Int
  # fun gsl_vector_complex_long_double_get(v : Gsl_vector_complex_long_double*, i : LibC::SizeT) : Gsl_complex_long_double
  # fun gsl_vector_complex_long_double_set(v : Gsl_vector_complex_long_double*, i : LibC::SizeT, z : Gsl_complex_long_double)
  # fun gsl_vector_complex_long_double_ptr(v : Gsl_vector_complex_long_double*, i : LibC::SizeT) : Gsl_complex_long_double*
  # fun gsl_vector_complex_long_double_const_ptr(v : Gsl_vector_complex_long_double*, i : LibC::SizeT) : Gsl_complex_long_double*

  struct Gsl_block
    size : LibC::SizeT
    data : LibC::Double*
  end

  fun gsl_block_alloc(n : LibC::SizeT) : Gsl_block*
  fun gsl_block_calloc(n : LibC::SizeT) : Gsl_block*
  fun gsl_block_free(b : Gsl_block*)
  fun gsl_block_fread(stream : File*, b : Gsl_block*) : LibC::Int
  fun gsl_block_fwrite(stream : File*, b : Gsl_block*) : LibC::Int
  fun gsl_block_fscanf(stream : File*, b : Gsl_block*) : LibC::Int
  fun gsl_block_fprintf(stream : File*, b : Gsl_block*, format : LibC::Char*) : LibC::Int
  fun gsl_block_raw_fread(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_raw_fwrite(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_raw_fscanf(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_raw_fprintf(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_size(b : Gsl_block*) : LibC::SizeT
  fun gsl_block_data(b : Gsl_block*) : LibC::Double*
  fun gsl_vector_alloc(n : LibC::SizeT) : Gsl_vector*

  struct Gsl_vector
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block*
    owner : LibC::Int
  end

  struct Gsl_vector_view
    vector : Gsl_vector
  end

  struct Gsl_vector_const_view
    vector : Gsl_vector
  end

  fun gsl_vector_calloc(n : LibC::SizeT) : Gsl_vector*
  fun gsl_vector_alloc_from_block(b : Gsl_block*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector*
  fun gsl_vector_alloc_from_vector(v : Gsl_vector*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector*
  fun gsl_vector_free(v : Gsl_vector*)
  fun gsl_vector_view_array(v : LibC::Double*, n : LibC::SizeT) : Gsl_vector_view

  fun gsl_vector_view_array_with_stride(base : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_view
  fun gsl_vector_const_view_array(v : LibC::Double*, n : LibC::SizeT) : Gsl_vector_view

  fun gsl_vector_const_view_array_with_stride(base : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_vector_subvector(v : Gsl_vector*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_view
  fun gsl_vector_subvector_with_stride(v : Gsl_vector*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_view
  fun gsl_vector_const_subvector(v : Gsl_vector*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_vector_const_subvector_with_stride(v : Gsl_vector*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_vector_set_zero(v : Gsl_vector*)
  fun gsl_vector_set_all(v : Gsl_vector*, x : LibC::Double)
  fun gsl_vector_set_basis(v : Gsl_vector*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_fread(stream : File*, v : Gsl_vector*) : LibC::Int
  fun gsl_vector_fwrite(stream : File*, v : Gsl_vector*) : LibC::Int
  fun gsl_vector_fscanf(stream : File*, v : Gsl_vector*) : LibC::Int
  fun gsl_vector_fprintf(stream : File*, v : Gsl_vector*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_memcpy(dest : Gsl_vector*, src : Gsl_vector*) : LibC::Int
  fun gsl_vector_reverse(v : Gsl_vector*) : LibC::Int
  fun gsl_vector_swap(v : Gsl_vector*, w : Gsl_vector*) : LibC::Int
  fun gsl_vector_swap_elements(v : Gsl_vector*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_max(v : Gsl_vector*) : LibC::Double
  fun gsl_vector_min(v : Gsl_vector*) : LibC::Double
  fun gsl_vector_minmax(v : Gsl_vector*, min_out : LibC::Double*, max_out : LibC::Double*)
  fun gsl_vector_max_index(v : Gsl_vector*) : LibC::SizeT
  fun gsl_vector_min_index(v : Gsl_vector*) : LibC::SizeT
  fun gsl_vector_minmax_index(v : Gsl_vector*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_add(a : Gsl_vector*, b : Gsl_vector*) : LibC::Int
  fun gsl_vector_sub(a : Gsl_vector*, b : Gsl_vector*) : LibC::Int
  fun gsl_vector_mul(a : Gsl_vector*, b : Gsl_vector*) : LibC::Int
  fun gsl_vector_div(a : Gsl_vector*, b : Gsl_vector*) : LibC::Int
  fun gsl_vector_scale(a : Gsl_vector*, x : LibC::Double) : LibC::Int
  fun gsl_vector_add_constant(a : Gsl_vector*, x : LibC::Double) : LibC::Int
  fun gsl_vector_equal(u : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_vector_isnull(v : Gsl_vector*) : LibC::Int
  fun gsl_vector_ispos(v : Gsl_vector*) : LibC::Int
  fun gsl_vector_isneg(v : Gsl_vector*) : LibC::Int
  fun gsl_vector_isnonneg(v : Gsl_vector*) : LibC::Int
  fun gsl_vector_get(v : Gsl_vector*, i : LibC::SizeT) : LibC::Double
  fun gsl_vector_set(v : Gsl_vector*, i : LibC::SizeT, x : LibC::Double)
  fun gsl_vector_ptr(v : Gsl_vector*, i : LibC::SizeT) : LibC::Double*
  fun gsl_vector_const_ptr(v : Gsl_vector*, i : LibC::SizeT) : LibC::Double*

  struct Gsl_block_complex
    size : LibC::SizeT
    data : LibC::Double*
  end

  fun gsl_block_complex_alloc(n : LibC::SizeT) : Gsl_block_complex*
  fun gsl_block_complex_calloc(n : LibC::SizeT) : Gsl_block_complex*
  fun gsl_block_complex_free(b : Gsl_block_complex*)
  fun gsl_block_complex_fread(stream : File*, b : Gsl_block_complex*) : LibC::Int
  fun gsl_block_complex_fwrite(stream : File*, b : Gsl_block_complex*) : LibC::Int
  fun gsl_block_complex_fscanf(stream : File*, b : Gsl_block_complex*) : LibC::Int
  fun gsl_block_complex_fprintf(stream : File*, b : Gsl_block_complex*, format : LibC::Char*) : LibC::Int
  fun gsl_block_complex_raw_fread(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_raw_fwrite(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_raw_fscanf(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_raw_fprintf(stream : File*, b : LibC::Double*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_complex_size(b : Gsl_block_complex*) : LibC::SizeT
  fun gsl_block_complex_data(b : Gsl_block_complex*) : LibC::Double*
  fun gsl_vector_complex_alloc(n : LibC::SizeT) : Gsl_vector_complex*

  struct Gsl_vector_complex
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block_complex*
    owner : LibC::Int
  end

  struct Gsl_vector_complex_view
    vector : Gsl_vector_complex
  end

  struct Gsl_vector_complex_const_view
    vector : Gsl_vector_complex
  end

  fun gsl_vector_complex_calloc(n : LibC::SizeT) : Gsl_vector_complex*
  fun gsl_vector_complex_alloc_from_block(b : Gsl_block_complex*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex*
  fun gsl_vector_complex_alloc_from_vector(v : Gsl_vector_complex*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex*
  fun gsl_vector_complex_free(v : Gsl_vector_complex*)
  fun gsl_vector_complex_view_array(base : LibC::Double*, n : LibC::SizeT) : Gsl_vector_complex_view

  fun gsl_vector_complex_view_array_with_stride(base : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_vector_complex_const_view_array(base : LibC::Double*, n : LibC::SizeT) : Gsl_vector_complex_const_view

  fun gsl_vector_complex_const_view_array_with_stride(base : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_vector_complex_subvector(base : Gsl_vector_complex*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_vector_complex_subvector_with_stride(v : Gsl_vector_complex*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_vector_complex_const_subvector(base : Gsl_vector_complex*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_vector_complex_const_subvector_with_stride(v : Gsl_vector_complex*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_vector_complex_real(v : Gsl_vector_complex*) : Gsl_vector_view
  fun gsl_vector_complex_imag(v : Gsl_vector_complex*) : Gsl_vector_view
  fun gsl_vector_complex_const_real(v : Gsl_vector_complex*) : Gsl_vector_const_view
  fun gsl_vector_complex_const_imag(v : Gsl_vector_complex*) : Gsl_vector_const_view
  fun gsl_vector_complex_set_zero(v : Gsl_vector_complex*)
  fun gsl_vector_complex_set_all(v : Gsl_vector_complex*, z : Gsl_complex)

  struct Gsl_complex
    dat : LibC::Double[2]
  end

  fun gsl_vector_complex_set_basis(v : Gsl_vector_complex*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_complex_fread(stream : File*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_fwrite(stream : File*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_fscanf(stream : File*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_fprintf(stream : File*, v : Gsl_vector_complex*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_complex_memcpy(dest : Gsl_vector_complex*, src : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_reverse(v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_swap(v : Gsl_vector_complex*, w : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_swap_elements(v : Gsl_vector_complex*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_complex_equal(u : Gsl_vector_complex*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_isnull(v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_ispos(v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_isneg(v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_isnonneg(v : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_add(a : Gsl_vector_complex*, b : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_sub(a : Gsl_vector_complex*, b : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_mul(a : Gsl_vector_complex*, b : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_div(a : Gsl_vector_complex*, b : Gsl_vector_complex*) : LibC::Int
  fun gsl_vector_complex_scale(a : Gsl_vector_complex*, x : Gsl_complex) : LibC::Int
  fun gsl_vector_complex_add_constant(a : Gsl_vector_complex*, x : Gsl_complex) : LibC::Int
  fun gsl_vector_complex_get(v : Gsl_vector_complex*, i : LibC::SizeT) : Gsl_complex
  fun gsl_vector_complex_set(v : Gsl_vector_complex*, i : LibC::SizeT, z : Gsl_complex)
  fun gsl_vector_complex_ptr(v : Gsl_vector_complex*, i : LibC::SizeT) : Gsl_complex*
  fun gsl_vector_complex_const_ptr(v : Gsl_vector_complex*, i : LibC::SizeT) : Gsl_complex*

  struct Gsl_block_float
    size : LibC::SizeT
    data : LibC::Float*
  end

  fun gsl_block_float_alloc(n : LibC::SizeT) : Gsl_block_float*
  fun gsl_block_float_calloc(n : LibC::SizeT) : Gsl_block_float*
  fun gsl_block_float_free(b : Gsl_block_float*)
  fun gsl_block_float_fread(stream : File*, b : Gsl_block_float*) : LibC::Int
  fun gsl_block_float_fwrite(stream : File*, b : Gsl_block_float*) : LibC::Int
  fun gsl_block_float_fscanf(stream : File*, b : Gsl_block_float*) : LibC::Int
  fun gsl_block_float_fprintf(stream : File*, b : Gsl_block_float*, format : LibC::Char*) : LibC::Int
  fun gsl_block_float_raw_fread(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_float_raw_fwrite(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_float_raw_fscanf(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_float_raw_fprintf(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_float_size(b : Gsl_block_float*) : LibC::SizeT
  fun gsl_block_float_data(b : Gsl_block_float*) : LibC::Float*
  fun gsl_vector_float_alloc(n : LibC::SizeT) : Gsl_vector_float*

  struct Gsl_vector_float
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Float*
    block : Gsl_block_float*
    owner : LibC::Int
  end

  struct Gsl_vector_float_view
    vector : Gsl_vector_float
  end

  struct Gsl_vector_float_const_view
    vector : Gsl_vector_float
  end

  fun gsl_vector_float_calloc(n : LibC::SizeT) : Gsl_vector_float*
  fun gsl_vector_float_alloc_from_block(b : Gsl_block_float*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_float*
  fun gsl_vector_float_alloc_from_vector(v : Gsl_vector_float*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_float*
  fun gsl_vector_float_free(v : Gsl_vector_float*)
  fun gsl_vector_float_view_array(v : LibC::Float*, n : LibC::SizeT) : Gsl_vector_float_view

  fun gsl_vector_float_view_array_with_stride(base : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_vector_float_const_view_array(v : LibC::Float*, n : LibC::SizeT) : Gsl_vector_float_const_view

  fun gsl_vector_float_const_view_array_with_stride(base : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_vector_float_subvector(v : Gsl_vector_float*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_vector_float_subvector_with_stride(v : Gsl_vector_float*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_vector_float_const_subvector(v : Gsl_vector_float*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_vector_float_const_subvector_with_stride(v : Gsl_vector_float*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_vector_float_set_zero(v : Gsl_vector_float*)
  fun gsl_vector_float_set_all(v : Gsl_vector_float*, x : LibC::Float)
  fun gsl_vector_float_set_basis(v : Gsl_vector_float*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_float_fread(stream : File*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_fwrite(stream : File*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_fscanf(stream : File*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_fprintf(stream : File*, v : Gsl_vector_float*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_float_memcpy(dest : Gsl_vector_float*, src : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_reverse(v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_swap(v : Gsl_vector_float*, w : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_swap_elements(v : Gsl_vector_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_float_max(v : Gsl_vector_float*) : LibC::Float
  fun gsl_vector_float_min(v : Gsl_vector_float*) : LibC::Float
  fun gsl_vector_float_minmax(v : Gsl_vector_float*, min_out : LibC::Float*, max_out : LibC::Float*)
  fun gsl_vector_float_max_index(v : Gsl_vector_float*) : LibC::SizeT
  fun gsl_vector_float_min_index(v : Gsl_vector_float*) : LibC::SizeT
  fun gsl_vector_float_minmax_index(v : Gsl_vector_float*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_float_add(a : Gsl_vector_float*, b : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_sub(a : Gsl_vector_float*, b : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_mul(a : Gsl_vector_float*, b : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_div(a : Gsl_vector_float*, b : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_scale(a : Gsl_vector_float*, x : LibC::Double) : LibC::Int
  fun gsl_vector_float_add_constant(a : Gsl_vector_float*, x : LibC::Double) : LibC::Int
  fun gsl_vector_float_equal(u : Gsl_vector_float*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_isnull(v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_ispos(v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_isneg(v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_isnonneg(v : Gsl_vector_float*) : LibC::Int
  fun gsl_vector_float_get(v : Gsl_vector_float*, i : LibC::SizeT) : LibC::Float
  fun gsl_vector_float_set(v : Gsl_vector_float*, i : LibC::SizeT, x : LibC::Float)
  fun gsl_vector_float_ptr(v : Gsl_vector_float*, i : LibC::SizeT) : LibC::Float*
  fun gsl_vector_float_const_ptr(v : Gsl_vector_float*, i : LibC::SizeT) : LibC::Float*

  struct Gsl_block_complex_float
    size : LibC::SizeT
    data : LibC::Float*
  end

  fun gsl_block_complex_float_alloc(n : LibC::SizeT) : Gsl_block_complex_float*
  fun gsl_block_complex_float_calloc(n : LibC::SizeT) : Gsl_block_complex_float*
  fun gsl_block_complex_float_free(b : Gsl_block_complex_float*)
  fun gsl_block_complex_float_fread(stream : File*, b : Gsl_block_complex_float*) : LibC::Int
  fun gsl_block_complex_float_fwrite(stream : File*, b : Gsl_block_complex_float*) : LibC::Int
  fun gsl_block_complex_float_fscanf(stream : File*, b : Gsl_block_complex_float*) : LibC::Int
  fun gsl_block_complex_float_fprintf(stream : File*, b : Gsl_block_complex_float*, format : LibC::Char*) : LibC::Int
  fun gsl_block_complex_float_raw_fread(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_float_raw_fwrite(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_float_raw_fscanf(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_complex_float_raw_fprintf(stream : File*, b : LibC::Float*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_complex_float_size(b : Gsl_block_complex_float*) : LibC::SizeT
  fun gsl_block_complex_float_data(b : Gsl_block_complex_float*) : LibC::Float*
  fun gsl_vector_complex_float_alloc(n : LibC::SizeT) : Gsl_vector_complex_float*

  struct Gsl_vector_complex_float
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Float*
    block : Gsl_block_complex_float*
    owner : LibC::Int
  end

  fun gsl_vector_complex_float_calloc(n : LibC::SizeT) : Gsl_vector_complex_float*
  fun gsl_vector_complex_float_alloc_from_block(b : Gsl_block_complex_float*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex_float*
  fun gsl_vector_complex_float_alloc_from_vector(v : Gsl_vector_complex_float*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_complex_float*
  fun gsl_vector_complex_float_free(v : Gsl_vector_complex_float*)
  fun gsl_vector_complex_float_view_array(base : LibC::Float*, n : LibC::SizeT) : Gsl_vector_complex_float_view

  struct Gsl_vector_complex_float_view
    vector : Gsl_vector_complex_float
  end

  fun gsl_vector_complex_float_view_array_with_stride(base : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_vector_complex_float_const_view_array(base : LibC::Float*, n : LibC::SizeT) : Gsl_vector_complex_float_const_view

  struct Gsl_vector_complex_float_const_view
    vector : Gsl_vector_complex_float
  end

  fun gsl_vector_complex_float_const_view_array_with_stride(base : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_vector_complex_float_subvector(base : Gsl_vector_complex_float*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_vector_complex_float_subvector_with_stride(v : Gsl_vector_complex_float*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_vector_complex_float_const_subvector(base : Gsl_vector_complex_float*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_vector_complex_float_const_subvector_with_stride(v : Gsl_vector_complex_float*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_vector_complex_float_real(v : Gsl_vector_complex_float*) : Gsl_vector_float_view
  fun gsl_vector_complex_float_imag(v : Gsl_vector_complex_float*) : Gsl_vector_float_view
  fun gsl_vector_complex_float_const_real(v : Gsl_vector_complex_float*) : Gsl_vector_float_const_view
  fun gsl_vector_complex_float_const_imag(v : Gsl_vector_complex_float*) : Gsl_vector_float_const_view
  fun gsl_vector_complex_float_set_zero(v : Gsl_vector_complex_float*)
  fun gsl_vector_complex_float_set_all(v : Gsl_vector_complex_float*, z : Gsl_complex_float)

  struct Gsl_complex_float
    dat : LibC::Float[2]
  end

  fun gsl_vector_complex_float_set_basis(v : Gsl_vector_complex_float*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_complex_float_fread(stream : File*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_fwrite(stream : File*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_fscanf(stream : File*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_fprintf(stream : File*, v : Gsl_vector_complex_float*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_complex_float_memcpy(dest : Gsl_vector_complex_float*, src : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_reverse(v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_swap(v : Gsl_vector_complex_float*, w : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_swap_elements(v : Gsl_vector_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_complex_float_equal(u : Gsl_vector_complex_float*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_isnull(v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_ispos(v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_isneg(v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_isnonneg(v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_add(a : Gsl_vector_complex_float*, b : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_sub(a : Gsl_vector_complex_float*, b : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_mul(a : Gsl_vector_complex_float*, b : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_div(a : Gsl_vector_complex_float*, b : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_vector_complex_float_scale(a : Gsl_vector_complex_float*, x : Gsl_complex_float) : LibC::Int
  fun gsl_vector_complex_float_add_constant(a : Gsl_vector_complex_float*, x : Gsl_complex_float) : LibC::Int
  fun gsl_vector_complex_float_get(v : Gsl_vector_complex_float*, i : LibC::SizeT) : Gsl_complex_float
  fun gsl_vector_complex_float_set(v : Gsl_vector_complex_float*, i : LibC::SizeT, z : Gsl_complex_float)
  fun gsl_vector_complex_float_ptr(v : Gsl_vector_complex_float*, i : LibC::SizeT) : Gsl_complex_float
  fun gsl_vector_complex_float_const_ptr(v : Gsl_vector_complex_float*, i : LibC::SizeT) : Gsl_complex_float

  struct Gsl_block_ulong
    size : LibC::SizeT
    data : LibC::ULong*
  end

  fun gsl_block_ulong_alloc(n : LibC::SizeT) : Gsl_block_ulong*
  fun gsl_block_ulong_calloc(n : LibC::SizeT) : Gsl_block_ulong*
  fun gsl_block_ulong_free(b : Gsl_block_ulong*)
  fun gsl_block_ulong_fread(stream : File*, b : Gsl_block_ulong*) : LibC::Int
  fun gsl_block_ulong_fwrite(stream : File*, b : Gsl_block_ulong*) : LibC::Int
  fun gsl_block_ulong_fscanf(stream : File*, b : Gsl_block_ulong*) : LibC::Int
  fun gsl_block_ulong_fprintf(stream : File*, b : Gsl_block_ulong*, format : LibC::Char*) : LibC::Int
  fun gsl_block_ulong_raw_fread(stream : File*, b : LibC::ULong*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ulong_raw_fwrite(stream : File*, b : LibC::ULong*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ulong_raw_fscanf(stream : File*, b : LibC::ULong*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ulong_raw_fprintf(stream : File*, b : LibC::ULong*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_ulong_size(b : Gsl_block_ulong*) : LibC::SizeT
  fun gsl_block_ulong_data(b : Gsl_block_ulong*) : LibC::ULong*
  fun gsl_vector_ulong_alloc(n : LibC::SizeT) : Gsl_vector_ulong*

  struct Gsl_vector_ulong
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::ULong*
    block : Gsl_block_ulong*
    owner : LibC::Int
  end

  fun gsl_vector_ulong_calloc(n : LibC::SizeT) : Gsl_vector_ulong*
  fun gsl_vector_ulong_alloc_from_block(b : Gsl_block_ulong*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_ulong*
  fun gsl_vector_ulong_alloc_from_vector(v : Gsl_vector_ulong*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_ulong*
  fun gsl_vector_ulong_free(v : Gsl_vector_ulong*)
  fun gsl_vector_ulong_view_array(v : LibC::ULong*, n : LibC::SizeT) : Gsl_vector_ulong_view

  struct Gsl_vector_ulong_view
    vector : Gsl_vector_ulong
  end

  fun gsl_vector_ulong_view_array_with_stride(base : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_vector_ulong_const_view_array(v : LibC::ULong*, n : LibC::SizeT) : Gsl_vector_ulong_const_view

  struct Gsl_vector_ulong_const_view
    vector : Gsl_vector_ulong
  end

  fun gsl_vector_ulong_const_view_array_with_stride(base : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_vector_ulong_subvector(v : Gsl_vector_ulong*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_vector_ulong_subvector_with_stride(v : Gsl_vector_ulong*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_vector_ulong_const_subvector(v : Gsl_vector_ulong*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_vector_ulong_const_subvector_with_stride(v : Gsl_vector_ulong*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_vector_ulong_set_zero(v : Gsl_vector_ulong*)
  fun gsl_vector_ulong_set_all(v : Gsl_vector_ulong*, x : LibC::ULong)
  fun gsl_vector_ulong_set_basis(v : Gsl_vector_ulong*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_ulong_fread(stream : File*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_fwrite(stream : File*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_fscanf(stream : File*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_fprintf(stream : File*, v : Gsl_vector_ulong*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_ulong_memcpy(dest : Gsl_vector_ulong*, src : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_reverse(v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_swap(v : Gsl_vector_ulong*, w : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_swap_elements(v : Gsl_vector_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_ulong_max(v : Gsl_vector_ulong*) : LibC::ULong
  fun gsl_vector_ulong_min(v : Gsl_vector_ulong*) : LibC::ULong
  fun gsl_vector_ulong_minmax(v : Gsl_vector_ulong*, min_out : LibC::ULong*, max_out : LibC::ULong*)
  fun gsl_vector_ulong_max_index(v : Gsl_vector_ulong*) : LibC::SizeT
  fun gsl_vector_ulong_min_index(v : Gsl_vector_ulong*) : LibC::SizeT
  fun gsl_vector_ulong_minmax_index(v : Gsl_vector_ulong*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_ulong_add(a : Gsl_vector_ulong*, b : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_sub(a : Gsl_vector_ulong*, b : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_mul(a : Gsl_vector_ulong*, b : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_div(a : Gsl_vector_ulong*, b : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_scale(a : Gsl_vector_ulong*, x : LibC::Double) : LibC::Int
  fun gsl_vector_ulong_add_constant(a : Gsl_vector_ulong*, x : LibC::Double) : LibC::Int
  fun gsl_vector_ulong_equal(u : Gsl_vector_ulong*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_isnull(v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_ispos(v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_isneg(v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_isnonneg(v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_vector_ulong_get(v : Gsl_vector_ulong*, i : LibC::SizeT) : LibC::ULong
  fun gsl_vector_ulong_set(v : Gsl_vector_ulong*, i : LibC::SizeT, x : LibC::ULong)
  fun gsl_vector_ulong_ptr(v : Gsl_vector_ulong*, i : LibC::SizeT) : LibC::ULong*
  fun gsl_vector_ulong_const_ptr(v : Gsl_vector_ulong*, i : LibC::SizeT) : LibC::ULong*

  struct Gsl_block_long
    size : LibC::SizeT
    data : LibC::Long*
  end

  fun gsl_block_long_alloc(n : LibC::SizeT) : Gsl_block_long*
  fun gsl_block_long_calloc(n : LibC::SizeT) : Gsl_block_long*
  fun gsl_block_long_free(b : Gsl_block_long*)
  fun gsl_block_long_fread(stream : File*, b : Gsl_block_long*) : LibC::Int
  fun gsl_block_long_fwrite(stream : File*, b : Gsl_block_long*) : LibC::Int
  fun gsl_block_long_fscanf(stream : File*, b : Gsl_block_long*) : LibC::Int
  fun gsl_block_long_fprintf(stream : File*, b : Gsl_block_long*, format : LibC::Char*) : LibC::Int
  fun gsl_block_long_raw_fread(stream : File*, b : LibC::Long*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_long_raw_fwrite(stream : File*, b : LibC::Long*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_long_raw_fscanf(stream : File*, b : LibC::Long*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_long_raw_fprintf(stream : File*, b : LibC::Long*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_long_size(b : Gsl_block_long*) : LibC::SizeT
  fun gsl_block_long_data(b : Gsl_block_long*) : LibC::Long*
  fun gsl_vector_long_alloc(n : LibC::SizeT) : Gsl_vector_long*

  struct Gsl_vector_long
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Long*
    block : Gsl_block_long*
    owner : LibC::Int
  end

  fun gsl_vector_long_calloc(n : LibC::SizeT) : Gsl_vector_long*
  fun gsl_vector_long_alloc_from_block(b : Gsl_block_long*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_long*
  fun gsl_vector_long_alloc_from_vector(v : Gsl_vector_long*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_long*
  fun gsl_vector_long_free(v : Gsl_vector_long*)
  fun gsl_vector_long_view_array(v : LibC::Long*, n : LibC::SizeT) : Gsl_vector_long_view

  struct Gsl_vector_long_view
    vector : Gsl_vector_long
  end

  fun gsl_vector_long_view_array_with_stride(base : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_vector_long_const_view_array(v : LibC::Long*, n : LibC::SizeT) : Gsl_vector_long_const_view

  struct Gsl_vector_long_const_view
    vector : Gsl_vector_long
  end

  fun gsl_vector_long_const_view_array_with_stride(base : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_vector_long_subvector(v : Gsl_vector_long*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_vector_long_subvector_with_stride(v : Gsl_vector_long*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_vector_long_const_subvector(v : Gsl_vector_long*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_vector_long_const_subvector_with_stride(v : Gsl_vector_long*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_vector_long_set_zero(v : Gsl_vector_long*)
  fun gsl_vector_long_set_all(v : Gsl_vector_long*, x : LibC::Long)
  fun gsl_vector_long_set_basis(v : Gsl_vector_long*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_long_fread(stream : File*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_fwrite(stream : File*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_fscanf(stream : File*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_fprintf(stream : File*, v : Gsl_vector_long*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_long_memcpy(dest : Gsl_vector_long*, src : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_reverse(v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_swap(v : Gsl_vector_long*, w : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_swap_elements(v : Gsl_vector_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_long_max(v : Gsl_vector_long*) : LibC::Long
  fun gsl_vector_long_min(v : Gsl_vector_long*) : LibC::Long
  fun gsl_vector_long_minmax(v : Gsl_vector_long*, min_out : LibC::Long*, max_out : LibC::Long*)
  fun gsl_vector_long_max_index(v : Gsl_vector_long*) : LibC::SizeT
  fun gsl_vector_long_min_index(v : Gsl_vector_long*) : LibC::SizeT
  fun gsl_vector_long_minmax_index(v : Gsl_vector_long*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_long_add(a : Gsl_vector_long*, b : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_sub(a : Gsl_vector_long*, b : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_mul(a : Gsl_vector_long*, b : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_div(a : Gsl_vector_long*, b : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_scale(a : Gsl_vector_long*, x : LibC::Double) : LibC::Int
  fun gsl_vector_long_add_constant(a : Gsl_vector_long*, x : LibC::Double) : LibC::Int
  fun gsl_vector_long_equal(u : Gsl_vector_long*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_isnull(v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_ispos(v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_isneg(v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_isnonneg(v : Gsl_vector_long*) : LibC::Int
  fun gsl_vector_long_get(v : Gsl_vector_long*, i : LibC::SizeT) : LibC::Long
  fun gsl_vector_long_set(v : Gsl_vector_long*, i : LibC::SizeT, x : LibC::Long)
  fun gsl_vector_long_ptr(v : Gsl_vector_long*, i : LibC::SizeT) : LibC::Long*
  fun gsl_vector_long_const_ptr(v : Gsl_vector_long*, i : LibC::SizeT) : LibC::Long*

  struct Gsl_block_uint
    size : LibC::SizeT
    data : LibC::UInt*
  end

  fun gsl_block_uint_alloc(n : LibC::SizeT) : Gsl_block_uint*
  fun gsl_block_uint_calloc(n : LibC::SizeT) : Gsl_block_uint*
  fun gsl_block_uint_free(b : Gsl_block_uint*)
  fun gsl_block_uint_fread(stream : File*, b : Gsl_block_uint*) : LibC::Int
  fun gsl_block_uint_fwrite(stream : File*, b : Gsl_block_uint*) : LibC::Int
  fun gsl_block_uint_fscanf(stream : File*, b : Gsl_block_uint*) : LibC::Int
  fun gsl_block_uint_fprintf(stream : File*, b : Gsl_block_uint*, format : LibC::Char*) : LibC::Int
  fun gsl_block_uint_raw_fread(stream : File*, b : LibC::UInt*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uint_raw_fwrite(stream : File*, b : LibC::UInt*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uint_raw_fscanf(stream : File*, b : LibC::UInt*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uint_raw_fprintf(stream : File*, b : LibC::UInt*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_uint_size(b : Gsl_block_uint*) : LibC::SizeT
  fun gsl_block_uint_data(b : Gsl_block_uint*) : LibC::UInt*
  fun gsl_vector_uint_alloc(n : LibC::SizeT) : Gsl_vector_uint*

  struct Gsl_vector_uint
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::UInt*
    block : Gsl_block_uint*
    owner : LibC::Int
  end

  fun gsl_vector_uint_calloc(n : LibC::SizeT) : Gsl_vector_uint*
  fun gsl_vector_uint_alloc_from_block(b : Gsl_block_uint*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_uint*
  fun gsl_vector_uint_alloc_from_vector(v : Gsl_vector_uint*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_uint*
  fun gsl_vector_uint_free(v : Gsl_vector_uint*)
  fun gsl_vector_uint_view_array(v : LibC::UInt*, n : LibC::SizeT) : Gsl_vector_uint_view

  struct Gsl_vector_uint_view
    vector : Gsl_vector_uint
  end

  fun gsl_vector_uint_view_array_with_stride(base : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_vector_uint_const_view_array(v : LibC::UInt*, n : LibC::SizeT) : Gsl_vector_uint_const_view

  struct Gsl_vector_uint_const_view
    vector : Gsl_vector_uint
  end

  fun gsl_vector_uint_const_view_array_with_stride(base : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_vector_uint_subvector(v : Gsl_vector_uint*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_vector_uint_subvector_with_stride(v : Gsl_vector_uint*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_vector_uint_const_subvector(v : Gsl_vector_uint*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_vector_uint_const_subvector_with_stride(v : Gsl_vector_uint*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_vector_uint_set_zero(v : Gsl_vector_uint*)
  fun gsl_vector_uint_set_all(v : Gsl_vector_uint*, x : LibC::UInt)
  fun gsl_vector_uint_set_basis(v : Gsl_vector_uint*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_uint_fread(stream : File*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_fwrite(stream : File*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_fscanf(stream : File*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_fprintf(stream : File*, v : Gsl_vector_uint*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_uint_memcpy(dest : Gsl_vector_uint*, src : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_reverse(v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_swap(v : Gsl_vector_uint*, w : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_swap_elements(v : Gsl_vector_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_uint_max(v : Gsl_vector_uint*) : LibC::UInt
  fun gsl_vector_uint_min(v : Gsl_vector_uint*) : LibC::UInt
  fun gsl_vector_uint_minmax(v : Gsl_vector_uint*, min_out : LibC::UInt*, max_out : LibC::UInt*)
  fun gsl_vector_uint_max_index(v : Gsl_vector_uint*) : LibC::SizeT
  fun gsl_vector_uint_min_index(v : Gsl_vector_uint*) : LibC::SizeT
  fun gsl_vector_uint_minmax_index(v : Gsl_vector_uint*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_uint_add(a : Gsl_vector_uint*, b : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_sub(a : Gsl_vector_uint*, b : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_mul(a : Gsl_vector_uint*, b : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_div(a : Gsl_vector_uint*, b : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_scale(a : Gsl_vector_uint*, x : LibC::Double) : LibC::Int
  fun gsl_vector_uint_add_constant(a : Gsl_vector_uint*, x : LibC::Double) : LibC::Int
  fun gsl_vector_uint_equal(u : Gsl_vector_uint*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_isnull(v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_ispos(v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_isneg(v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_isnonneg(v : Gsl_vector_uint*) : LibC::Int
  fun gsl_vector_uint_get(v : Gsl_vector_uint*, i : LibC::SizeT) : LibC::UInt
  fun gsl_vector_uint_set(v : Gsl_vector_uint*, i : LibC::SizeT, x : LibC::UInt)
  fun gsl_vector_uint_ptr(v : Gsl_vector_uint*, i : LibC::SizeT) : LibC::UInt*
  fun gsl_vector_uint_const_ptr(v : Gsl_vector_uint*, i : LibC::SizeT) : LibC::UInt*

  struct Gsl_block_int
    size : LibC::SizeT
    data : LibC::Int*
  end

  fun gsl_block_int_alloc(n : LibC::SizeT) : Gsl_block_int*
  fun gsl_block_int_calloc(n : LibC::SizeT) : Gsl_block_int*
  fun gsl_block_int_free(b : Gsl_block_int*)
  fun gsl_block_int_fread(stream : File*, b : Gsl_block_int*) : LibC::Int
  fun gsl_block_int_fwrite(stream : File*, b : Gsl_block_int*) : LibC::Int
  fun gsl_block_int_fscanf(stream : File*, b : Gsl_block_int*) : LibC::Int
  fun gsl_block_int_fprintf(stream : File*, b : Gsl_block_int*, format : LibC::Char*) : LibC::Int
  fun gsl_block_int_raw_fread(stream : File*, b : LibC::Int*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_int_raw_fwrite(stream : File*, b : LibC::Int*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_int_raw_fscanf(stream : File*, b : LibC::Int*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_int_raw_fprintf(stream : File*, b : LibC::Int*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_int_size(b : Gsl_block_int*) : LibC::SizeT
  fun gsl_block_int_data(b : Gsl_block_int*) : LibC::Int*
  fun gsl_vector_int_alloc(n : LibC::SizeT) : Gsl_vector_int*

  struct Gsl_vector_int
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Int*
    block : Gsl_block_int*
    owner : LibC::Int
  end

  fun gsl_vector_int_calloc(n : LibC::SizeT) : Gsl_vector_int*
  fun gsl_vector_int_alloc_from_block(b : Gsl_block_int*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_int*
  fun gsl_vector_int_alloc_from_vector(v : Gsl_vector_int*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_int*
  fun gsl_vector_int_free(v : Gsl_vector_int*)
  fun gsl_vector_int_view_array(v : LibC::Int*, n : LibC::SizeT) : Gsl_vector_int_view

  struct Gsl_vector_int_view
    vector : Gsl_vector_int
  end

  fun gsl_vector_int_view_array_with_stride(base : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_vector_int_const_view_array(v : LibC::Int*, n : LibC::SizeT) : Gsl_vector_int_const_view

  struct Gsl_vector_int_const_view
    vector : Gsl_vector_int
  end

  fun gsl_vector_int_const_view_array_with_stride(base : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_vector_int_subvector(v : Gsl_vector_int*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_vector_int_subvector_with_stride(v : Gsl_vector_int*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_vector_int_const_subvector(v : Gsl_vector_int*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_vector_int_const_subvector_with_stride(v : Gsl_vector_int*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_vector_int_set_zero(v : Gsl_vector_int*)
  fun gsl_vector_int_set_all(v : Gsl_vector_int*, x : LibC::Int)
  fun gsl_vector_int_set_basis(v : Gsl_vector_int*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_int_fread(stream : File*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_fwrite(stream : File*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_fscanf(stream : File*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_fprintf(stream : File*, v : Gsl_vector_int*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_int_memcpy(dest : Gsl_vector_int*, src : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_reverse(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_swap(v : Gsl_vector_int*, w : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_swap_elements(v : Gsl_vector_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_int_max(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_min(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_minmax(v : Gsl_vector_int*, min_out : LibC::Int*, max_out : LibC::Int*)
  fun gsl_vector_int_max_index(v : Gsl_vector_int*) : LibC::SizeT
  fun gsl_vector_int_min_index(v : Gsl_vector_int*) : LibC::SizeT
  fun gsl_vector_int_minmax_index(v : Gsl_vector_int*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_int_add(a : Gsl_vector_int*, b : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_sub(a : Gsl_vector_int*, b : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_mul(a : Gsl_vector_int*, b : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_div(a : Gsl_vector_int*, b : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_scale(a : Gsl_vector_int*, x : LibC::Double) : LibC::Int
  fun gsl_vector_int_add_constant(a : Gsl_vector_int*, x : LibC::Double) : LibC::Int
  fun gsl_vector_int_equal(u : Gsl_vector_int*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_isnull(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_ispos(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_isneg(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_isnonneg(v : Gsl_vector_int*) : LibC::Int
  fun gsl_vector_int_get(v : Gsl_vector_int*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_int_set(v : Gsl_vector_int*, i : LibC::SizeT, x : LibC::Int)
  fun gsl_vector_int_ptr(v : Gsl_vector_int*, i : LibC::SizeT) : LibC::Int*
  fun gsl_vector_int_const_ptr(v : Gsl_vector_int*, i : LibC::SizeT) : LibC::Int*

  struct Gsl_block_ushort
    size : LibC::SizeT
    data : LibC::UShort*
  end

  fun gsl_block_ushort_alloc(n : LibC::SizeT) : Gsl_block_ushort*
  fun gsl_block_ushort_calloc(n : LibC::SizeT) : Gsl_block_ushort*
  fun gsl_block_ushort_free(b : Gsl_block_ushort*)
  fun gsl_block_ushort_fread(stream : File*, b : Gsl_block_ushort*) : LibC::Int
  fun gsl_block_ushort_fwrite(stream : File*, b : Gsl_block_ushort*) : LibC::Int
  fun gsl_block_ushort_fscanf(stream : File*, b : Gsl_block_ushort*) : LibC::Int
  fun gsl_block_ushort_fprintf(stream : File*, b : Gsl_block_ushort*, format : LibC::Char*) : LibC::Int
  fun gsl_block_ushort_raw_fread(stream : File*, b : LibC::UShort*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ushort_raw_fwrite(stream : File*, b : LibC::UShort*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ushort_raw_fscanf(stream : File*, b : LibC::UShort*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_ushort_raw_fprintf(stream : File*, b : LibC::UShort*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_ushort_size(b : Gsl_block_ushort*) : LibC::SizeT
  fun gsl_block_ushort_data(b : Gsl_block_ushort*) : LibC::UShort*
  fun gsl_vector_ushort_alloc(n : LibC::SizeT) : Gsl_vector_ushort*

  struct Gsl_vector_ushort
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::UShort*
    block : Gsl_block_ushort*
    owner : LibC::Int
  end

  fun gsl_vector_ushort_calloc(n : LibC::SizeT) : Gsl_vector_ushort*
  fun gsl_vector_ushort_alloc_from_block(b : Gsl_block_ushort*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_ushort*
  fun gsl_vector_ushort_alloc_from_vector(v : Gsl_vector_ushort*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_ushort*
  fun gsl_vector_ushort_free(v : Gsl_vector_ushort*)
  fun gsl_vector_ushort_view_array(v : LibC::UShort*, n : LibC::SizeT) : Gsl_vector_ushort_view

  struct Gsl_vector_ushort_view
    vector : Gsl_vector_ushort
  end

  fun gsl_vector_ushort_view_array_with_stride(base : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_vector_ushort_const_view_array(v : LibC::UShort*, n : LibC::SizeT) : Gsl_vector_ushort_const_view

  struct Gsl_vector_ushort_const_view
    vector : Gsl_vector_ushort
  end

  fun gsl_vector_ushort_const_view_array_with_stride(base : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_vector_ushort_subvector(v : Gsl_vector_ushort*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_vector_ushort_subvector_with_stride(v : Gsl_vector_ushort*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_vector_ushort_const_subvector(v : Gsl_vector_ushort*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_vector_ushort_const_subvector_with_stride(v : Gsl_vector_ushort*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_vector_ushort_set_zero(v : Gsl_vector_ushort*)
  fun gsl_vector_ushort_set_all(v : Gsl_vector_ushort*, x : LibC::UShort)
  fun gsl_vector_ushort_set_basis(v : Gsl_vector_ushort*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_ushort_fread(stream : File*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_fwrite(stream : File*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_fscanf(stream : File*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_fprintf(stream : File*, v : Gsl_vector_ushort*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_ushort_memcpy(dest : Gsl_vector_ushort*, src : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_reverse(v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_swap(v : Gsl_vector_ushort*, w : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_swap_elements(v : Gsl_vector_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_ushort_max(v : Gsl_vector_ushort*) : LibC::UShort
  fun gsl_vector_ushort_min(v : Gsl_vector_ushort*) : LibC::UShort
  fun gsl_vector_ushort_minmax(v : Gsl_vector_ushort*, min_out : LibC::UShort*, max_out : LibC::UShort*)
  fun gsl_vector_ushort_max_index(v : Gsl_vector_ushort*) : LibC::SizeT
  fun gsl_vector_ushort_min_index(v : Gsl_vector_ushort*) : LibC::SizeT
  fun gsl_vector_ushort_minmax_index(v : Gsl_vector_ushort*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_ushort_add(a : Gsl_vector_ushort*, b : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_sub(a : Gsl_vector_ushort*, b : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_mul(a : Gsl_vector_ushort*, b : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_div(a : Gsl_vector_ushort*, b : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_scale(a : Gsl_vector_ushort*, x : LibC::Double) : LibC::Int
  fun gsl_vector_ushort_add_constant(a : Gsl_vector_ushort*, x : LibC::Double) : LibC::Int
  fun gsl_vector_ushort_equal(u : Gsl_vector_ushort*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_isnull(v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_ispos(v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_isneg(v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_isnonneg(v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_vector_ushort_get(v : Gsl_vector_ushort*, i : LibC::SizeT) : LibC::UShort
  fun gsl_vector_ushort_set(v : Gsl_vector_ushort*, i : LibC::SizeT, x : LibC::UShort)
  fun gsl_vector_ushort_ptr(v : Gsl_vector_ushort*, i : LibC::SizeT) : LibC::UShort*
  fun gsl_vector_ushort_const_ptr(v : Gsl_vector_ushort*, i : LibC::SizeT) : LibC::UShort*

  struct Gsl_block_short
    size : LibC::SizeT
    data : LibC::Short*
  end

  fun gsl_block_short_alloc(n : LibC::SizeT) : Gsl_block_short*
  fun gsl_block_short_calloc(n : LibC::SizeT) : Gsl_block_short*
  fun gsl_block_short_free(b : Gsl_block_short*)
  fun gsl_block_short_fread(stream : File*, b : Gsl_block_short*) : LibC::Int
  fun gsl_block_short_fwrite(stream : File*, b : Gsl_block_short*) : LibC::Int
  fun gsl_block_short_fscanf(stream : File*, b : Gsl_block_short*) : LibC::Int
  fun gsl_block_short_fprintf(stream : File*, b : Gsl_block_short*, format : LibC::Char*) : LibC::Int
  fun gsl_block_short_raw_fread(stream : File*, b : LibC::Short*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_short_raw_fwrite(stream : File*, b : LibC::Short*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_short_raw_fscanf(stream : File*, b : LibC::Short*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_short_raw_fprintf(stream : File*, b : LibC::Short*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_short_size(b : Gsl_block_short*) : LibC::SizeT
  fun gsl_block_short_data(b : Gsl_block_short*) : LibC::Short*
  fun gsl_vector_short_alloc(n : LibC::SizeT) : Gsl_vector_short*

  struct Gsl_vector_short
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Short*
    block : Gsl_block_short*
    owner : LibC::Int
  end

  fun gsl_vector_short_calloc(n : LibC::SizeT) : Gsl_vector_short*
  fun gsl_vector_short_alloc_from_block(b : Gsl_block_short*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_short*
  fun gsl_vector_short_alloc_from_vector(v : Gsl_vector_short*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_short*
  fun gsl_vector_short_free(v : Gsl_vector_short*)
  fun gsl_vector_short_view_array(v : LibC::Short*, n : LibC::SizeT) : Gsl_vector_short_view

  struct Gsl_vector_short_view
    vector : Gsl_vector_short
  end

  fun gsl_vector_short_view_array_with_stride(base : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_vector_short_const_view_array(v : LibC::Short*, n : LibC::SizeT) : Gsl_vector_short_const_view

  struct Gsl_vector_short_const_view
    vector : Gsl_vector_short
  end

  fun gsl_vector_short_const_view_array_with_stride(base : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_vector_short_subvector(v : Gsl_vector_short*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_vector_short_subvector_with_stride(v : Gsl_vector_short*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_vector_short_const_subvector(v : Gsl_vector_short*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_vector_short_const_subvector_with_stride(v : Gsl_vector_short*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_vector_short_set_zero(v : Gsl_vector_short*)
  fun gsl_vector_short_set_all(v : Gsl_vector_short*, x : LibC::Short)
  fun gsl_vector_short_set_basis(v : Gsl_vector_short*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_short_fread(stream : File*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_fwrite(stream : File*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_fscanf(stream : File*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_fprintf(stream : File*, v : Gsl_vector_short*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_short_memcpy(dest : Gsl_vector_short*, src : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_reverse(v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_swap(v : Gsl_vector_short*, w : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_swap_elements(v : Gsl_vector_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_short_max(v : Gsl_vector_short*) : LibC::Short
  fun gsl_vector_short_min(v : Gsl_vector_short*) : LibC::Short
  fun gsl_vector_short_minmax(v : Gsl_vector_short*, min_out : LibC::Short*, max_out : LibC::Short*)
  fun gsl_vector_short_max_index(v : Gsl_vector_short*) : LibC::SizeT
  fun gsl_vector_short_min_index(v : Gsl_vector_short*) : LibC::SizeT
  fun gsl_vector_short_minmax_index(v : Gsl_vector_short*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_short_add(a : Gsl_vector_short*, b : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_sub(a : Gsl_vector_short*, b : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_mul(a : Gsl_vector_short*, b : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_div(a : Gsl_vector_short*, b : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_scale(a : Gsl_vector_short*, x : LibC::Double) : LibC::Int
  fun gsl_vector_short_add_constant(a : Gsl_vector_short*, x : LibC::Double) : LibC::Int
  fun gsl_vector_short_equal(u : Gsl_vector_short*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_isnull(v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_ispos(v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_isneg(v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_isnonneg(v : Gsl_vector_short*) : LibC::Int
  fun gsl_vector_short_get(v : Gsl_vector_short*, i : LibC::SizeT) : LibC::Short
  fun gsl_vector_short_set(v : Gsl_vector_short*, i : LibC::SizeT, x : LibC::Short)
  fun gsl_vector_short_ptr(v : Gsl_vector_short*, i : LibC::SizeT) : LibC::Short*
  fun gsl_vector_short_const_ptr(v : Gsl_vector_short*, i : LibC::SizeT) : LibC::Short*

  struct Gsl_block_uchar
    size : LibC::SizeT
    data : UInt8*
  end

  fun gsl_block_uchar_alloc(n : LibC::SizeT) : Gsl_block_uchar*
  fun gsl_block_uchar_calloc(n : LibC::SizeT) : Gsl_block_uchar*
  fun gsl_block_uchar_free(b : Gsl_block_uchar*)
  fun gsl_block_uchar_fread(stream : File*, b : Gsl_block_uchar*) : LibC::Int
  fun gsl_block_uchar_fwrite(stream : File*, b : Gsl_block_uchar*) : LibC::Int
  fun gsl_block_uchar_fscanf(stream : File*, b : Gsl_block_uchar*) : LibC::Int
  fun gsl_block_uchar_fprintf(stream : File*, b : Gsl_block_uchar*, format : LibC::Char*) : LibC::Int
  fun gsl_block_uchar_raw_fread(stream : File*, b : UInt8*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uchar_raw_fwrite(stream : File*, b : UInt8*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uchar_raw_fscanf(stream : File*, b : UInt8*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_uchar_raw_fprintf(stream : File*, b : UInt8*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_uchar_size(b : Gsl_block_uchar*) : LibC::SizeT
  fun gsl_block_uchar_data(b : Gsl_block_uchar*) : UInt8*
  fun gsl_vector_uchar_alloc(n : LibC::SizeT) : Gsl_vector_uchar*

  struct Gsl_vector_uchar
    size : LibC::SizeT
    stride : LibC::SizeT
    data : UInt8*
    block : Gsl_block_uchar*
    owner : LibC::Int
  end

  fun gsl_vector_uchar_calloc(n : LibC::SizeT) : Gsl_vector_uchar*
  fun gsl_vector_uchar_alloc_from_block(b : Gsl_block_uchar*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_uchar*
  fun gsl_vector_uchar_alloc_from_vector(v : Gsl_vector_uchar*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_uchar*
  fun gsl_vector_uchar_free(v : Gsl_vector_uchar*)
  fun gsl_vector_uchar_view_array(v : UInt8*, n : LibC::SizeT) : Gsl_vector_uchar_view

  struct Gsl_vector_uchar_view
    vector : Gsl_vector_uchar
  end

  fun gsl_vector_uchar_view_array_with_stride(base : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_vector_uchar_const_view_array(v : UInt8*, n : LibC::SizeT) : Gsl_vector_uchar_const_view

  struct Gsl_vector_uchar_const_view
    vector : Gsl_vector_uchar
  end

  fun gsl_vector_uchar_const_view_array_with_stride(base : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_vector_uchar_subvector(v : Gsl_vector_uchar*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_vector_uchar_subvector_with_stride(v : Gsl_vector_uchar*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_vector_uchar_const_subvector(v : Gsl_vector_uchar*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_vector_uchar_const_subvector_with_stride(v : Gsl_vector_uchar*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_vector_uchar_set_zero(v : Gsl_vector_uchar*)
  fun gsl_vector_uchar_set_all(v : Gsl_vector_uchar*, x : UInt8)
  fun gsl_vector_uchar_set_basis(v : Gsl_vector_uchar*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_uchar_fread(stream : File*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_fwrite(stream : File*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_fscanf(stream : File*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_fprintf(stream : File*, v : Gsl_vector_uchar*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_uchar_memcpy(dest : Gsl_vector_uchar*, src : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_reverse(v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_swap(v : Gsl_vector_uchar*, w : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_swap_elements(v : Gsl_vector_uchar*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_uchar_max(v : Gsl_vector_uchar*) : UInt8
  fun gsl_vector_uchar_min(v : Gsl_vector_uchar*) : UInt8
  fun gsl_vector_uchar_minmax(v : Gsl_vector_uchar*, min_out : UInt8*, max_out : UInt8*)
  fun gsl_vector_uchar_max_index(v : Gsl_vector_uchar*) : LibC::SizeT
  fun gsl_vector_uchar_min_index(v : Gsl_vector_uchar*) : LibC::SizeT
  fun gsl_vector_uchar_minmax_index(v : Gsl_vector_uchar*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_uchar_add(a : Gsl_vector_uchar*, b : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_sub(a : Gsl_vector_uchar*, b : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_mul(a : Gsl_vector_uchar*, b : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_div(a : Gsl_vector_uchar*, b : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_scale(a : Gsl_vector_uchar*, x : LibC::Double) : LibC::Int
  fun gsl_vector_uchar_add_constant(a : Gsl_vector_uchar*, x : LibC::Double) : LibC::Int
  fun gsl_vector_uchar_equal(u : Gsl_vector_uchar*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_isnull(v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_ispos(v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_isneg(v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_isnonneg(v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_vector_uchar_get(v : Gsl_vector_uchar*, i : LibC::SizeT) : UInt8
  fun gsl_vector_uchar_set(v : Gsl_vector_uchar*, i : LibC::SizeT, x : UInt8)
  fun gsl_vector_uchar_ptr(v : Gsl_vector_uchar*, i : LibC::SizeT) : UInt8*
  fun gsl_vector_uchar_const_ptr(v : Gsl_vector_uchar*, i : LibC::SizeT) : UInt8*

  struct Gsl_block_char
    size : LibC::SizeT
    data : LibC::Char*
  end

  fun gsl_block_char_alloc(n : LibC::SizeT) : Gsl_block_char*
  fun gsl_block_char_calloc(n : LibC::SizeT) : Gsl_block_char*
  fun gsl_block_char_free(b : Gsl_block_char*)
  fun gsl_block_char_fread(stream : File*, b : Gsl_block_char*) : LibC::Int
  fun gsl_block_char_fwrite(stream : File*, b : Gsl_block_char*) : LibC::Int
  fun gsl_block_char_fscanf(stream : File*, b : Gsl_block_char*) : LibC::Int
  fun gsl_block_char_fprintf(stream : File*, b : Gsl_block_char*, format : LibC::Char*) : LibC::Int
  fun gsl_block_char_raw_fread(stream : File*, b : LibC::Char*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_char_raw_fwrite(stream : File*, b : LibC::Char*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_char_raw_fscanf(stream : File*, b : LibC::Char*, n : LibC::SizeT, stride : LibC::SizeT) : LibC::Int
  fun gsl_block_char_raw_fprintf(stream : File*, b : LibC::Char*, n : LibC::SizeT, stride : LibC::SizeT, format : LibC::Char*) : LibC::Int
  fun gsl_block_char_size(b : Gsl_block_char*) : LibC::SizeT
  fun gsl_block_char_data(b : Gsl_block_char*) : LibC::Char*
  fun gsl_vector_char_alloc(n : LibC::SizeT) : Gsl_vector_char*

  struct Gsl_vector_char
    size : LibC::SizeT
    stride : LibC::SizeT
    data : LibC::Char*
    block : Gsl_block_char*
    owner : LibC::Int
  end

  fun gsl_vector_char_calloc(n : LibC::SizeT) : Gsl_vector_char*
  fun gsl_vector_char_alloc_from_block(b : Gsl_block_char*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_char*
  fun gsl_vector_char_alloc_from_vector(v : Gsl_vector_char*, offset : LibC::SizeT, n : LibC::SizeT, stride : LibC::SizeT) : Gsl_vector_char*
  fun gsl_vector_char_free(v : Gsl_vector_char*)
  fun gsl_vector_char_view_array(v : LibC::Char*, n : LibC::SizeT) : Gsl_vector_char_view

  struct Gsl_vector_char_view
    vector : Gsl_vector_char
  end

  fun gsl_vector_char_view_array_with_stride(base : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_vector_char_const_view_array(v : LibC::Char*, n : LibC::SizeT) : Gsl_vector_char_const_view

  struct Gsl_vector_char_const_view
    vector : Gsl_vector_char
  end

  fun gsl_vector_char_const_view_array_with_stride(base : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_vector_char_subvector(v : Gsl_vector_char*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_vector_char_subvector_with_stride(v : Gsl_vector_char*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_vector_char_const_subvector(v : Gsl_vector_char*, i : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_vector_char_const_subvector_with_stride(v : Gsl_vector_char*, i : LibC::SizeT, stride : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_vector_char_set_zero(v : Gsl_vector_char*)
  fun gsl_vector_char_set_all(v : Gsl_vector_char*, x : LibC::Char)
  fun gsl_vector_char_set_basis(v : Gsl_vector_char*, i : LibC::SizeT) : LibC::Int
  fun gsl_vector_char_fread(stream : File*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_fwrite(stream : File*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_fscanf(stream : File*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_fprintf(stream : File*, v : Gsl_vector_char*, format : LibC::Char*) : LibC::Int
  fun gsl_vector_char_memcpy(dest : Gsl_vector_char*, src : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_reverse(v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_swap(v : Gsl_vector_char*, w : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_swap_elements(v : Gsl_vector_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_vector_char_max(v : Gsl_vector_char*) : LibC::Char
  fun gsl_vector_char_min(v : Gsl_vector_char*) : LibC::Char
  fun gsl_vector_char_minmax(v : Gsl_vector_char*, min_out : LibC::Char*, max_out : LibC::Char*)
  fun gsl_vector_char_max_index(v : Gsl_vector_char*) : LibC::SizeT
  fun gsl_vector_char_min_index(v : Gsl_vector_char*) : LibC::SizeT
  fun gsl_vector_char_minmax_index(v : Gsl_vector_char*, imin : LibC::SizeT*, imax : LibC::SizeT*)
  fun gsl_vector_char_add(a : Gsl_vector_char*, b : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_sub(a : Gsl_vector_char*, b : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_mul(a : Gsl_vector_char*, b : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_div(a : Gsl_vector_char*, b : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_scale(a : Gsl_vector_char*, x : LibC::Double) : LibC::Int
  fun gsl_vector_char_add_constant(a : Gsl_vector_char*, x : LibC::Double) : LibC::Int
  fun gsl_vector_char_equal(u : Gsl_vector_char*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_isnull(v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_ispos(v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_isneg(v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_isnonneg(v : Gsl_vector_char*) : LibC::Int
  fun gsl_vector_char_get(v : Gsl_vector_char*, i : LibC::SizeT) : LibC::Char
  fun gsl_vector_char_set(v : Gsl_vector_char*, i : LibC::SizeT, x : LibC::Char)
  fun gsl_vector_char_ptr(v : Gsl_vector_char*, i : LibC::SizeT) : LibC::Char*
  fun gsl_vector_char_const_ptr(v : Gsl_vector_char*, i : LibC::SizeT) : LibC::Char*
  # fun gsl_matrix_complex_long_double_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double*
  #
  # struct Gsl_matrix_complex_long_double
  #   size1 : LibC::SizeT
  #   size2 : LibC::SizeT
  #   tda : LibC::SizeT
  #   data : LibC::LongDouble*
  #   block : Gsl_block_complex_long_double*
  #   owner : LibC::Int
  # end
  #
  # fun gsl_matrix_complex_long_double_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double*
  # fun gsl_matrix_complex_long_double_alloc_from_block(b : Gsl_block_complex_long_double*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_complex_long_double*
  # fun gsl_matrix_complex_long_double_alloc_from_matrix(b : Gsl_matrix_complex_long_double*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double*
  # fun gsl_vector_complex_long_double_alloc_row_from_matrix(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT) : Gsl_vector_complex_long_double*
  # fun gsl_vector_complex_long_double_alloc_col_from_matrix(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT) : Gsl_vector_complex_long_double*
  # fun gsl_matrix_complex_long_double_free(m : Gsl_matrix_complex_long_double*)
  # fun gsl_matrix_complex_long_double_submatrix(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_view
  #
  # struct Gsl_matrix_complex_long_double_view
  #   matrix : Gsl_matrix_complex_long_double
  # end
  #
  # fun gsl_matrix_complex_long_double_row(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_column(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_diagonal(m : Gsl_matrix_complex_long_double*) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_subdiagonal(m : Gsl_matrix_complex_long_double*, k : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_superdiagonal(m : Gsl_matrix_complex_long_double*, k : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_subrow(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_subcolumn(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_view
  # fun gsl_matrix_complex_long_double_view_array(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_view
  # fun gsl_matrix_complex_long_double_view_array_with_tda(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_long_double_view
  # fun gsl_matrix_complex_long_double_view_vector(v : Gsl_vector_complex_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_view
  # fun gsl_matrix_complex_long_double_view_vector_with_tda(v : Gsl_vector_complex_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_long_double_view
  # fun gsl_matrix_complex_long_double_const_submatrix(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_const_view
  #
  # struct Gsl_matrix_complex_long_double_const_view
  #   matrix : Gsl_matrix_complex_long_double
  # end
  #
  # fun gsl_matrix_complex_long_double_const_row(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_column(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_diagonal(m : Gsl_matrix_complex_long_double*) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_subdiagonal(m : Gsl_matrix_complex_long_double*, k : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_superdiagonal(m : Gsl_matrix_complex_long_double*, k : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_subrow(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_subcolumn(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_view_array(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_view_array_with_tda(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_view_vector(v : Gsl_vector_complex_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_const_view_vector_with_tda(v : Gsl_vector_complex_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_long_double_const_view
  # fun gsl_matrix_complex_long_double_set_zero(m : Gsl_matrix_complex_long_double*)
  # fun gsl_matrix_complex_long_double_set_identity(m : Gsl_matrix_complex_long_double*)
  # fun gsl_matrix_complex_long_double_set_all(m : Gsl_matrix_complex_long_double*, x : Gsl_complex_long_double)
  # fun gsl_matrix_complex_long_double_fread(stream : File*, m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_fwrite(stream : File*, m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_fscanf(stream : File*, m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_fprintf(stream : File*, m : Gsl_matrix_complex_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_matrix_complex_long_double_memcpy(dest : Gsl_matrix_complex_long_double*, src : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_swap(m1 : Gsl_matrix_complex_long_double*, m2 : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex_long_double*, src : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_swap_rows(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_complex_long_double_swap_columns(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_complex_long_double_swap_rowcol(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_complex_long_double_transpose(m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_transpose_memcpy(dest : Gsl_matrix_complex_long_double*, src : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex_long_double*, src : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_equal(a : Gsl_matrix_complex_long_double*, b : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_isnull(m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_ispos(m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_isneg(m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_isnonneg(m : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_add(a : Gsl_matrix_complex_long_double*, b : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_sub(a : Gsl_matrix_complex_long_double*, b : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_mul_elements(a : Gsl_matrix_complex_long_double*, b : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_div_elements(a : Gsl_matrix_complex_long_double*, b : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_scale(a : Gsl_matrix_complex_long_double*, x : Gsl_complex_long_double) : LibC::Int
  # fun gsl_matrix_complex_long_double_add_constant(a : Gsl_matrix_complex_long_double*, x : Gsl_complex_long_double) : LibC::Int
  # fun gsl_matrix_complex_long_double_add_diagonal(a : Gsl_matrix_complex_long_double*, x : Gsl_complex_long_double) : LibC::Int
  # fun gsl_matrix_complex_long_double_get_row(v : Gsl_vector_complex_long_double*, m : Gsl_matrix_complex_long_double*, i : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_complex_long_double_get_col(v : Gsl_vector_complex_long_double*, m : Gsl_matrix_complex_long_double*, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_complex_long_double_set_row(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_set_col(m : Gsl_matrix_complex_long_double*, j : LibC::SizeT, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_matrix_complex_long_double_get(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_long_double
  # fun gsl_matrix_complex_long_double_set(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT, x : Gsl_complex_long_double)
  # fun gsl_matrix_complex_long_double_ptr(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_long_double*
  # fun gsl_matrix_complex_long_double_const_ptr(m : Gsl_matrix_complex_long_double*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_long_double*
  fun gsl_matrix_complex_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex*

  struct Gsl_matrix_complex
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block_complex*
    owner : LibC::Int
  end

  fun gsl_matrix_complex_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex*
  fun gsl_matrix_complex_alloc_from_block(b : Gsl_block_complex*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_complex*
  fun gsl_matrix_complex_alloc_from_matrix(b : Gsl_matrix_complex*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex*
  fun gsl_vector_complex_alloc_row_from_matrix(m : Gsl_matrix_complex*, i : LibC::SizeT) : Gsl_vector_complex*
  fun gsl_vector_complex_alloc_col_from_matrix(m : Gsl_matrix_complex*, j : LibC::SizeT) : Gsl_vector_complex*
  fun gsl_matrix_complex_free(m : Gsl_matrix_complex*)
  fun gsl_matrix_complex_submatrix(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_view

  struct Gsl_matrix_complex_view
    matrix : Gsl_matrix_complex
  end

  fun gsl_matrix_complex_row(m : Gsl_matrix_complex*, i : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_column(m : Gsl_matrix_complex*, j : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_diagonal(m : Gsl_matrix_complex*) : Gsl_vector_complex_view
  fun gsl_matrix_complex_subdiagonal(m : Gsl_matrix_complex*, k : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_superdiagonal(m : Gsl_matrix_complex*, k : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_subrow(m : Gsl_matrix_complex*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_subcolumn(m : Gsl_matrix_complex*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_view
  fun gsl_matrix_complex_view_array(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_view
  fun gsl_matrix_complex_view_array_with_tda(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_view
  fun gsl_matrix_complex_view_vector(v : Gsl_vector_complex*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_view
  fun gsl_matrix_complex_view_vector_with_tda(v : Gsl_vector_complex*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_view
  fun gsl_matrix_complex_const_submatrix(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_const_view

  struct Gsl_matrix_complex_const_view
    matrix : Gsl_matrix_complex
  end

  fun gsl_matrix_complex_const_row(m : Gsl_matrix_complex*, i : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_column(m : Gsl_matrix_complex*, j : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_diagonal(m : Gsl_matrix_complex*) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_subdiagonal(m : Gsl_matrix_complex*, k : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_superdiagonal(m : Gsl_matrix_complex*, k : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_subrow(m : Gsl_matrix_complex*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_subcolumn(m : Gsl_matrix_complex*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_const_view
  fun gsl_matrix_complex_const_view_array(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_const_view
  fun gsl_matrix_complex_const_view_array_with_tda(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_const_view
  fun gsl_matrix_complex_const_view_vector(v : Gsl_vector_complex*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_const_view
  fun gsl_matrix_complex_const_view_vector_with_tda(v : Gsl_vector_complex*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_const_view
  fun gsl_matrix_complex_set_zero(m : Gsl_matrix_complex*)
  fun gsl_matrix_complex_set_identity(m : Gsl_matrix_complex*)
  fun gsl_matrix_complex_set_all(m : Gsl_matrix_complex*, x : Gsl_complex)
  fun gsl_matrix_complex_fread(stream : File*, m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_fwrite(stream : File*, m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_fscanf(stream : File*, m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_fprintf(stream : File*, m : Gsl_matrix_complex*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_complex_memcpy(dest : Gsl_matrix_complex*, src : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_swap(m1 : Gsl_matrix_complex*, m2 : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex*, src : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_swap_rows(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_swap_columns(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_swap_rowcol(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_transpose(m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_transpose_memcpy(dest : Gsl_matrix_complex*, src : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex*, src : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_equal(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_isnull(m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_ispos(m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_isneg(m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_isnonneg(m : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_add(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_sub(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_mul_elements(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_div_elements(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_matrix_complex_scale(a : Gsl_matrix_complex*, x : Gsl_complex) : LibC::Int
  fun gsl_matrix_complex_add_constant(a : Gsl_matrix_complex*, x : Gsl_complex) : LibC::Int
  fun gsl_matrix_complex_add_diagonal(a : Gsl_matrix_complex*, x : Gsl_complex) : LibC::Int
  fun gsl_matrix_complex_get_row(v : Gsl_vector_complex*, m : Gsl_matrix_complex*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_get_col(v : Gsl_vector_complex*, m : Gsl_matrix_complex*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_set_row(m : Gsl_matrix_complex*, i : LibC::SizeT, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_matrix_complex_set_col(m : Gsl_matrix_complex*, j : LibC::SizeT, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_matrix_complex_get(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex
  fun gsl_matrix_complex_set(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT, x : Gsl_complex)
  fun gsl_matrix_complex_ptr(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex*
  fun gsl_matrix_complex_const_ptr(m : Gsl_matrix_complex*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex*
  fun gsl_matrix_complex_float_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float*

  struct Gsl_matrix_complex_float
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Float*
    block : Gsl_block_complex_float*
    owner : LibC::Int
  end

  fun gsl_matrix_complex_float_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float*
  fun gsl_matrix_complex_float_alloc_from_block(b : Gsl_block_complex_float*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_complex_float*
  fun gsl_matrix_complex_float_alloc_from_matrix(b : Gsl_matrix_complex_float*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float*
  fun gsl_vector_complex_float_alloc_row_from_matrix(m : Gsl_matrix_complex_float*, i : LibC::SizeT) : Gsl_vector_complex_float*
  fun gsl_vector_complex_float_alloc_col_from_matrix(m : Gsl_matrix_complex_float*, j : LibC::SizeT) : Gsl_vector_complex_float*
  fun gsl_matrix_complex_float_free(m : Gsl_matrix_complex_float*)
  fun gsl_matrix_complex_float_submatrix(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_view

  struct Gsl_matrix_complex_float_view
    matrix : Gsl_matrix_complex_float
  end

  fun gsl_matrix_complex_float_row(m : Gsl_matrix_complex_float*, i : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_column(m : Gsl_matrix_complex_float*, j : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_diagonal(m : Gsl_matrix_complex_float*) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_subdiagonal(m : Gsl_matrix_complex_float*, k : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_superdiagonal(m : Gsl_matrix_complex_float*, k : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_subrow(m : Gsl_matrix_complex_float*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_subcolumn(m : Gsl_matrix_complex_float*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_view
  fun gsl_matrix_complex_float_view_array(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_view
  fun gsl_matrix_complex_float_view_array_with_tda(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_float_view
  fun gsl_matrix_complex_float_view_vector(v : Gsl_vector_complex_float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_view
  fun gsl_matrix_complex_float_view_vector_with_tda(v : Gsl_vector_complex_float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_float_view
  fun gsl_matrix_complex_float_const_submatrix(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_const_view

  struct Gsl_matrix_complex_float_const_view
    matrix : Gsl_matrix_complex_float
  end

  fun gsl_matrix_complex_float_const_row(m : Gsl_matrix_complex_float*, i : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_column(m : Gsl_matrix_complex_float*, j : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_diagonal(m : Gsl_matrix_complex_float*) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_subdiagonal(m : Gsl_matrix_complex_float*, k : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_superdiagonal(m : Gsl_matrix_complex_float*, k : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_subrow(m : Gsl_matrix_complex_float*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_subcolumn(m : Gsl_matrix_complex_float*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_complex_float_const_view
  fun gsl_matrix_complex_float_const_view_array(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_const_view
  fun gsl_matrix_complex_float_const_view_array_with_tda(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_float_const_view
  fun gsl_matrix_complex_float_const_view_vector(v : Gsl_vector_complex_float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_complex_float_const_view
  fun gsl_matrix_complex_float_const_view_vector_with_tda(v : Gsl_vector_complex_float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_complex_float_const_view
  fun gsl_matrix_complex_float_set_zero(m : Gsl_matrix_complex_float*)
  fun gsl_matrix_complex_float_set_identity(m : Gsl_matrix_complex_float*)
  fun gsl_matrix_complex_float_set_all(m : Gsl_matrix_complex_float*, x : Gsl_complex_float)
  fun gsl_matrix_complex_float_fread(stream : File*, m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_fwrite(stream : File*, m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_fscanf(stream : File*, m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_fprintf(stream : File*, m : Gsl_matrix_complex_float*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_complex_float_memcpy(dest : Gsl_matrix_complex_float*, src : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_swap(m1 : Gsl_matrix_complex_float*, m2 : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex_float*, src : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_swap_rows(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_float_swap_columns(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_float_swap_rowcol(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_float_transpose(m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_transpose_memcpy(dest : Gsl_matrix_complex_float*, src : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_complex_float*, src : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_equal(a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_isnull(m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_ispos(m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_isneg(m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_isnonneg(m : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_add(a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_sub(a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_mul_elements(a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_div_elements(a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_scale(a : Gsl_matrix_complex_float*, x : Gsl_complex_float) : LibC::Int
  fun gsl_matrix_complex_float_add_constant(a : Gsl_matrix_complex_float*, x : Gsl_complex_float) : LibC::Int
  fun gsl_matrix_complex_float_add_diagonal(a : Gsl_matrix_complex_float*, x : Gsl_complex_float) : LibC::Int
  fun gsl_matrix_complex_float_get_row(v : Gsl_vector_complex_float*, m : Gsl_matrix_complex_float*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_float_get_col(v : Gsl_vector_complex_float*, m : Gsl_matrix_complex_float*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_complex_float_set_row(m : Gsl_matrix_complex_float*, i : LibC::SizeT, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_set_col(m : Gsl_matrix_complex_float*, j : LibC::SizeT, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_matrix_complex_float_get(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_float
  fun gsl_matrix_complex_float_set(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT, x : Gsl_complex_float)
  fun gsl_matrix_complex_float_ptr(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_float
  fun gsl_matrix_complex_float_const_ptr(m : Gsl_matrix_complex_float*, i : LibC::SizeT, j : LibC::SizeT) : Gsl_complex_float
  # fun gsl_matrix_long_double_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double*
  #
  # struct Gsl_matrix_long_double
  #   size1 : LibC::SizeT
  #   size2 : LibC::SizeT
  #   tda : LibC::SizeT
  #   data : LibC::LongDouble*
  #   block : Gsl_block_long_double*
  #   owner : LibC::Int
  # end
  #
  # fun gsl_matrix_long_double_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double*
  # fun gsl_matrix_long_double_alloc_from_block(b : Gsl_block_long_double*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_long_double*
  # fun gsl_matrix_long_double_alloc_from_matrix(m : Gsl_matrix_long_double*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double*
  # fun gsl_vector_long_double_alloc_row_from_matrix(m : Gsl_matrix_long_double*, i : LibC::SizeT) : Gsl_vector_long_double*
  # fun gsl_vector_long_double_alloc_col_from_matrix(m : Gsl_matrix_long_double*, j : LibC::SizeT) : Gsl_vector_long_double*
  # fun gsl_matrix_long_double_free(m : Gsl_matrix_long_double*)
  # fun gsl_matrix_long_double_submatrix(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_view
  #
  # struct Gsl_matrix_long_double_view
  #   matrix : Gsl_matrix_long_double
  # end
  #
  # fun gsl_matrix_long_double_row(m : Gsl_matrix_long_double*, i : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_column(m : Gsl_matrix_long_double*, j : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_diagonal(m : Gsl_matrix_long_double*) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_subdiagonal(m : Gsl_matrix_long_double*, k : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_superdiagonal(m : Gsl_matrix_long_double*, k : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_subrow(m : Gsl_matrix_long_double*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_subcolumn(m : Gsl_matrix_long_double*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_view
  # fun gsl_matrix_long_double_view_array(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_view
  # fun gsl_matrix_long_double_view_array_with_tda(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_double_view
  # fun gsl_matrix_long_double_view_vector(v : Gsl_vector_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_view
  # fun gsl_matrix_long_double_view_vector_with_tda(v : Gsl_vector_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_double_view
  # fun gsl_matrix_long_double_const_submatrix(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_const_view
  #
  # struct Gsl_matrix_long_double_const_view
  #   matrix : Gsl_matrix_long_double
  # end
  #
  # fun gsl_matrix_long_double_const_row(m : Gsl_matrix_long_double*, i : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_column(m : Gsl_matrix_long_double*, j : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_diagonal(m : Gsl_matrix_long_double*) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_subdiagonal(m : Gsl_matrix_long_double*, k : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_superdiagonal(m : Gsl_matrix_long_double*, k : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_subrow(m : Gsl_matrix_long_double*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_subcolumn(m : Gsl_matrix_long_double*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_double_const_view
  # fun gsl_matrix_long_double_const_view_array(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_const_view
  # fun gsl_matrix_long_double_const_view_array_with_tda(base : LibC::LongDouble*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_double_const_view
  # fun gsl_matrix_long_double_const_view_vector(v : Gsl_vector_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_double_const_view
  # fun gsl_matrix_long_double_const_view_vector_with_tda(v : Gsl_vector_long_double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_double_const_view
  # fun gsl_matrix_long_double_set_zero(m : Gsl_matrix_long_double*)
  # fun gsl_matrix_long_double_set_identity(m : Gsl_matrix_long_double*)
  # fun gsl_matrix_long_double_set_all(m : Gsl_matrix_long_double*, x : LibC::LongDouble)
  # fun gsl_matrix_long_double_fread(stream : File*, m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_fwrite(stream : File*, m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_fscanf(stream : File*, m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_fprintf(stream : File*, m : Gsl_matrix_long_double*, format : LibC::Char*) : LibC::Int
  # fun gsl_matrix_long_double_memcpy(dest : Gsl_matrix_long_double*, src : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_swap(m1 : Gsl_matrix_long_double*, m2 : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_long_double*, src : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_swap_rows(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_long_double_swap_columns(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_long_double_swap_rowcol(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_long_double_transpose(m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_transpose_memcpy(dest : Gsl_matrix_long_double*, src : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_long_double*, src : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_max(m : Gsl_matrix_long_double*) : LibC::LongDouble
  # fun gsl_matrix_long_double_min(m : Gsl_matrix_long_double*) : LibC::LongDouble
  # fun gsl_matrix_long_double_minmax(m : Gsl_matrix_long_double*, min_out : LibC::LongDouble*, max_out : LibC::LongDouble*)
  # fun gsl_matrix_long_double_max_index(m : Gsl_matrix_long_double*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  # fun gsl_matrix_long_double_min_index(m : Gsl_matrix_long_double*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  # fun gsl_matrix_long_double_minmax_index(m : Gsl_matrix_long_double*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  # fun gsl_matrix_long_double_equal(a : Gsl_matrix_long_double*, b : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_isnull(m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_ispos(m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_isneg(m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_isnonneg(m : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_add(a : Gsl_matrix_long_double*, b : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_sub(a : Gsl_matrix_long_double*, b : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_mul_elements(a : Gsl_matrix_long_double*, b : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_div_elements(a : Gsl_matrix_long_double*, b : Gsl_matrix_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_scale(a : Gsl_matrix_long_double*, x : LibC::Double) : LibC::Int
  # fun gsl_matrix_long_double_add_constant(a : Gsl_matrix_long_double*, x : LibC::Double) : LibC::Int
  # fun gsl_matrix_long_double_add_diagonal(a : Gsl_matrix_long_double*, x : LibC::Double) : LibC::Int
  # fun gsl_matrix_long_double_get_row(v : Gsl_vector_long_double*, m : Gsl_matrix_long_double*, i : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_long_double_get_col(v : Gsl_vector_long_double*, m : Gsl_matrix_long_double*, j : LibC::SizeT) : LibC::Int
  # fun gsl_matrix_long_double_set_row(m : Gsl_matrix_long_double*, i : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_set_col(m : Gsl_matrix_long_double*, j : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_matrix_long_double_get(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::LongDouble
  # fun gsl_matrix_long_double_set(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::LongDouble)
  # fun gsl_matrix_long_double_ptr(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::LongDouble*
  # fun gsl_matrix_long_double_const_ptr(m : Gsl_matrix_long_double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::LongDouble*
  fun gsl_matrix_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix*

  struct Gsl_matrix
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block*
    owner : LibC::Int
  end

  struct Gsl_matrix_view
    matrix : Gsl_matrix
  end

  struct Gsl_matrix_const_view
    matrix : Gsl_matrix
  end

  fun gsl_matrix_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix*
  fun gsl_matrix_alloc_from_block(b : Gsl_block*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix*
  fun gsl_matrix_alloc_from_matrix(m : Gsl_matrix*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix*
  fun gsl_vector_alloc_row_from_matrix(m : Gsl_matrix*, i : LibC::SizeT) : Gsl_vector*
  fun gsl_vector_alloc_col_from_matrix(m : Gsl_matrix*, j : LibC::SizeT) : Gsl_vector*
  fun gsl_matrix_free(m : Gsl_matrix*)
  fun gsl_matrix_submatrix(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_view

  fun gsl_matrix_row(m : Gsl_matrix*, i : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_column(m : Gsl_matrix*, j : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_diagonal(m : Gsl_matrix*) : Gsl_vector_view
  fun gsl_matrix_subdiagonal(m : Gsl_matrix*, k : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_superdiagonal(m : Gsl_matrix*, k : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_subrow(m : Gsl_matrix*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_subcolumn(m : Gsl_matrix*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_view
  fun gsl_matrix_view_array(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_view
  fun gsl_matrix_view_array_with_tda(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_view
  fun gsl_matrix_view_vector(v : Gsl_vector*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_view
  fun gsl_matrix_view_vector_with_tda(v : Gsl_vector*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_view
  fun gsl_matrix_const_submatrix(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_const_view

  fun gsl_matrix_const_row(m : Gsl_matrix*, i : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_column(m : Gsl_matrix*, j : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_diagonal(m : Gsl_matrix*) : Gsl_vector_const_view
  fun gsl_matrix_const_subdiagonal(m : Gsl_matrix*, k : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_superdiagonal(m : Gsl_matrix*, k : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_subrow(m : Gsl_matrix*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_subcolumn(m : Gsl_matrix*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_const_view
  fun gsl_matrix_const_view_array(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_const_view
  fun gsl_matrix_const_view_array_with_tda(base : LibC::Double*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_const_view
  fun gsl_matrix_const_view_vector(v : Gsl_vector*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_const_view
  fun gsl_matrix_const_view_vector_with_tda(v : Gsl_vector*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_const_view
  fun gsl_matrix_set_zero(m : Gsl_matrix*)
  fun gsl_matrix_set_identity(m : Gsl_matrix*)
  fun gsl_matrix_set_all(m : Gsl_matrix*, x : LibC::Double)
  fun gsl_matrix_fread(stream : File*, m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_fwrite(stream : File*, m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_fscanf(stream : File*, m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_fprintf(stream : File*, m : Gsl_matrix*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_memcpy(dest : Gsl_matrix*, src : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_swap(m1 : Gsl_matrix*, m2 : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix*, src : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_swap_rows(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_swap_columns(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_swap_rowcol(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_transpose(m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_transpose_memcpy(dest : Gsl_matrix*, src : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix*, src : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_max(m : Gsl_matrix*) : LibC::Double
  fun gsl_matrix_min(m : Gsl_matrix*) : LibC::Double
  fun gsl_matrix_minmax(m : Gsl_matrix*, min_out : LibC::Double*, max_out : LibC::Double*)
  fun gsl_matrix_max_index(m : Gsl_matrix*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_min_index(m : Gsl_matrix*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_minmax_index(m : Gsl_matrix*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_equal(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_isnull(m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_ispos(m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_isneg(m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_isnonneg(m : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_add(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_sub(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_mul_elements(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_div_elements(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_matrix_scale(a : Gsl_matrix*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_add_constant(a : Gsl_matrix*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_add_diagonal(a : Gsl_matrix*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_get_row(v : Gsl_vector*, m : Gsl_matrix*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_get_col(v : Gsl_vector*, m : Gsl_matrix*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_set_row(m : Gsl_matrix*, i : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_matrix_set_col(m : Gsl_matrix*, j : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_matrix_get(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double
  fun gsl_matrix_set(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Double)
  fun gsl_matrix_ptr(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double*
  fun gsl_matrix_const_ptr(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double*
  fun gsl_matrix_float_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float*

  struct Gsl_matrix_float
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Float*
    block : Gsl_block_float*
    owner : LibC::Int
  end

  fun gsl_matrix_float_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float*
  fun gsl_matrix_float_alloc_from_block(b : Gsl_block_float*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_float*
  fun gsl_matrix_float_alloc_from_matrix(m : Gsl_matrix_float*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float*
  fun gsl_vector_float_alloc_row_from_matrix(m : Gsl_matrix_float*, i : LibC::SizeT) : Gsl_vector_float*
  fun gsl_vector_float_alloc_col_from_matrix(m : Gsl_matrix_float*, j : LibC::SizeT) : Gsl_vector_float*
  fun gsl_matrix_float_free(m : Gsl_matrix_float*)
  fun gsl_matrix_float_submatrix(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_view

  struct Gsl_matrix_float_view
    matrix : Gsl_matrix_float
  end

  fun gsl_matrix_float_row(m : Gsl_matrix_float*, i : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_column(m : Gsl_matrix_float*, j : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_diagonal(m : Gsl_matrix_float*) : Gsl_vector_float_view
  fun gsl_matrix_float_subdiagonal(m : Gsl_matrix_float*, k : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_superdiagonal(m : Gsl_matrix_float*, k : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_subrow(m : Gsl_matrix_float*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_subcolumn(m : Gsl_matrix_float*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_view
  fun gsl_matrix_float_view_array(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_view
  fun gsl_matrix_float_view_array_with_tda(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_float_view
  fun gsl_matrix_float_view_vector(v : Gsl_vector_float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_view
  fun gsl_matrix_float_view_vector_with_tda(v : Gsl_vector_float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_float_view
  fun gsl_matrix_float_const_submatrix(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_const_view

  struct Gsl_matrix_float_const_view
    matrix : Gsl_matrix_float
  end

  fun gsl_matrix_float_const_row(m : Gsl_matrix_float*, i : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_column(m : Gsl_matrix_float*, j : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_diagonal(m : Gsl_matrix_float*) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_subdiagonal(m : Gsl_matrix_float*, k : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_superdiagonal(m : Gsl_matrix_float*, k : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_subrow(m : Gsl_matrix_float*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_subcolumn(m : Gsl_matrix_float*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_float_const_view
  fun gsl_matrix_float_const_view_array(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_const_view
  fun gsl_matrix_float_const_view_array_with_tda(base : LibC::Float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_float_const_view
  fun gsl_matrix_float_const_view_vector(v : Gsl_vector_float*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_float_const_view
  fun gsl_matrix_float_const_view_vector_with_tda(v : Gsl_vector_float*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_float_const_view
  fun gsl_matrix_float_set_zero(m : Gsl_matrix_float*)
  fun gsl_matrix_float_set_identity(m : Gsl_matrix_float*)
  fun gsl_matrix_float_set_all(m : Gsl_matrix_float*, x : LibC::Float)
  fun gsl_matrix_float_fread(stream : File*, m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_fwrite(stream : File*, m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_fscanf(stream : File*, m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_fprintf(stream : File*, m : Gsl_matrix_float*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_float_memcpy(dest : Gsl_matrix_float*, src : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_swap(m1 : Gsl_matrix_float*, m2 : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_float*, src : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_swap_rows(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_float_swap_columns(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_float_swap_rowcol(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_float_transpose(m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_transpose_memcpy(dest : Gsl_matrix_float*, src : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_float*, src : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_max(m : Gsl_matrix_float*) : LibC::Float
  fun gsl_matrix_float_min(m : Gsl_matrix_float*) : LibC::Float
  fun gsl_matrix_float_minmax(m : Gsl_matrix_float*, min_out : LibC::Float*, max_out : LibC::Float*)
  fun gsl_matrix_float_max_index(m : Gsl_matrix_float*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_float_min_index(m : Gsl_matrix_float*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_float_minmax_index(m : Gsl_matrix_float*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_float_equal(a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_isnull(m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_ispos(m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_isneg(m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_isnonneg(m : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_add(a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_sub(a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_mul_elements(a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_div_elements(a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_matrix_float_scale(a : Gsl_matrix_float*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_float_add_constant(a : Gsl_matrix_float*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_float_add_diagonal(a : Gsl_matrix_float*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_float_get_row(v : Gsl_vector_float*, m : Gsl_matrix_float*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_float_get_col(v : Gsl_vector_float*, m : Gsl_matrix_float*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_float_set_row(m : Gsl_matrix_float*, i : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  fun gsl_matrix_float_set_col(m : Gsl_matrix_float*, j : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  fun gsl_matrix_float_get(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Float
  fun gsl_matrix_float_set(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Float)
  fun gsl_matrix_float_ptr(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Float*
  fun gsl_matrix_float_const_ptr(m : Gsl_matrix_float*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Float*
  fun gsl_matrix_ulong_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong*

  struct Gsl_matrix_ulong
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::ULong*
    block : Gsl_block_ulong*
    owner : LibC::Int
  end

  fun gsl_matrix_ulong_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong*
  fun gsl_matrix_ulong_alloc_from_block(b : Gsl_block_ulong*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_ulong*
  fun gsl_matrix_ulong_alloc_from_matrix(m : Gsl_matrix_ulong*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong*
  fun gsl_vector_ulong_alloc_row_from_matrix(m : Gsl_matrix_ulong*, i : LibC::SizeT) : Gsl_vector_ulong*
  fun gsl_vector_ulong_alloc_col_from_matrix(m : Gsl_matrix_ulong*, j : LibC::SizeT) : Gsl_vector_ulong*
  fun gsl_matrix_ulong_free(m : Gsl_matrix_ulong*)
  fun gsl_matrix_ulong_submatrix(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_view

  struct Gsl_matrix_ulong_view
    matrix : Gsl_matrix_ulong
  end

  fun gsl_matrix_ulong_row(m : Gsl_matrix_ulong*, i : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_column(m : Gsl_matrix_ulong*, j : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_diagonal(m : Gsl_matrix_ulong*) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_subdiagonal(m : Gsl_matrix_ulong*, k : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_superdiagonal(m : Gsl_matrix_ulong*, k : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_subrow(m : Gsl_matrix_ulong*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_subcolumn(m : Gsl_matrix_ulong*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_view
  fun gsl_matrix_ulong_view_array(base : LibC::ULong*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_view
  fun gsl_matrix_ulong_view_array_with_tda(base : LibC::ULong*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ulong_view
  fun gsl_matrix_ulong_view_vector(v : Gsl_vector_ulong*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_view
  fun gsl_matrix_ulong_view_vector_with_tda(v : Gsl_vector_ulong*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ulong_view
  fun gsl_matrix_ulong_const_submatrix(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_const_view

  struct Gsl_matrix_ulong_const_view
    matrix : Gsl_matrix_ulong
  end

  fun gsl_matrix_ulong_const_row(m : Gsl_matrix_ulong*, i : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_column(m : Gsl_matrix_ulong*, j : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_diagonal(m : Gsl_matrix_ulong*) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_subdiagonal(m : Gsl_matrix_ulong*, k : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_superdiagonal(m : Gsl_matrix_ulong*, k : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_subrow(m : Gsl_matrix_ulong*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_subcolumn(m : Gsl_matrix_ulong*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ulong_const_view
  fun gsl_matrix_ulong_const_view_array(base : LibC::ULong*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_const_view
  fun gsl_matrix_ulong_const_view_array_with_tda(base : LibC::ULong*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ulong_const_view
  fun gsl_matrix_ulong_const_view_vector(v : Gsl_vector_ulong*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ulong_const_view
  fun gsl_matrix_ulong_const_view_vector_with_tda(v : Gsl_vector_ulong*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ulong_const_view
  fun gsl_matrix_ulong_set_zero(m : Gsl_matrix_ulong*)
  fun gsl_matrix_ulong_set_identity(m : Gsl_matrix_ulong*)
  fun gsl_matrix_ulong_set_all(m : Gsl_matrix_ulong*, x : LibC::ULong)
  fun gsl_matrix_ulong_fread(stream : File*, m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_fwrite(stream : File*, m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_fscanf(stream : File*, m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_fprintf(stream : File*, m : Gsl_matrix_ulong*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_ulong_memcpy(dest : Gsl_matrix_ulong*, src : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_swap(m1 : Gsl_matrix_ulong*, m2 : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_ulong*, src : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_swap_rows(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ulong_swap_columns(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ulong_swap_rowcol(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ulong_transpose(m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_transpose_memcpy(dest : Gsl_matrix_ulong*, src : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_ulong*, src : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_max(m : Gsl_matrix_ulong*) : LibC::ULong
  fun gsl_matrix_ulong_min(m : Gsl_matrix_ulong*) : LibC::ULong
  fun gsl_matrix_ulong_minmax(m : Gsl_matrix_ulong*, min_out : LibC::ULong*, max_out : LibC::ULong*)
  fun gsl_matrix_ulong_max_index(m : Gsl_matrix_ulong*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_ulong_min_index(m : Gsl_matrix_ulong*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_ulong_minmax_index(m : Gsl_matrix_ulong*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_ulong_equal(a : Gsl_matrix_ulong*, b : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_isnull(m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_ispos(m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_isneg(m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_isnonneg(m : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_add(a : Gsl_matrix_ulong*, b : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_sub(a : Gsl_matrix_ulong*, b : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_mul_elements(a : Gsl_matrix_ulong*, b : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_div_elements(a : Gsl_matrix_ulong*, b : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_matrix_ulong_scale(a : Gsl_matrix_ulong*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ulong_add_constant(a : Gsl_matrix_ulong*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ulong_add_diagonal(a : Gsl_matrix_ulong*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ulong_get_row(v : Gsl_vector_ulong*, m : Gsl_matrix_ulong*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ulong_get_col(v : Gsl_vector_ulong*, m : Gsl_matrix_ulong*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ulong_set_row(m : Gsl_matrix_ulong*, i : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_matrix_ulong_set_col(m : Gsl_matrix_ulong*, j : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_matrix_ulong_get(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::ULong
  fun gsl_matrix_ulong_set(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::ULong)
  fun gsl_matrix_ulong_ptr(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::ULong*
  fun gsl_matrix_ulong_const_ptr(m : Gsl_matrix_ulong*, i : LibC::SizeT, j : LibC::SizeT) : LibC::ULong*
  fun gsl_matrix_long_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long*

  struct Gsl_matrix_long
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Long*
    block : Gsl_block_long*
    owner : LibC::Int
  end

  fun gsl_matrix_long_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long*
  fun gsl_matrix_long_alloc_from_block(b : Gsl_block_long*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_long*
  fun gsl_matrix_long_alloc_from_matrix(m : Gsl_matrix_long*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long*
  fun gsl_vector_long_alloc_row_from_matrix(m : Gsl_matrix_long*, i : LibC::SizeT) : Gsl_vector_long*
  fun gsl_vector_long_alloc_col_from_matrix(m : Gsl_matrix_long*, j : LibC::SizeT) : Gsl_vector_long*
  fun gsl_matrix_long_free(m : Gsl_matrix_long*)
  fun gsl_matrix_long_submatrix(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_view

  struct Gsl_matrix_long_view
    matrix : Gsl_matrix_long
  end

  fun gsl_matrix_long_row(m : Gsl_matrix_long*, i : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_column(m : Gsl_matrix_long*, j : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_diagonal(m : Gsl_matrix_long*) : Gsl_vector_long_view
  fun gsl_matrix_long_subdiagonal(m : Gsl_matrix_long*, k : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_superdiagonal(m : Gsl_matrix_long*, k : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_subrow(m : Gsl_matrix_long*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_subcolumn(m : Gsl_matrix_long*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_view
  fun gsl_matrix_long_view_array(base : LibC::Long*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_view
  fun gsl_matrix_long_view_array_with_tda(base : LibC::Long*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_view
  fun gsl_matrix_long_view_vector(v : Gsl_vector_long*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_view
  fun gsl_matrix_long_view_vector_with_tda(v : Gsl_vector_long*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_view
  fun gsl_matrix_long_const_submatrix(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_const_view

  struct Gsl_matrix_long_const_view
    matrix : Gsl_matrix_long
  end

  fun gsl_matrix_long_const_row(m : Gsl_matrix_long*, i : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_column(m : Gsl_matrix_long*, j : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_diagonal(m : Gsl_matrix_long*) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_subdiagonal(m : Gsl_matrix_long*, k : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_superdiagonal(m : Gsl_matrix_long*, k : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_subrow(m : Gsl_matrix_long*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_subcolumn(m : Gsl_matrix_long*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_long_const_view
  fun gsl_matrix_long_const_view_array(base : LibC::Long*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_const_view
  fun gsl_matrix_long_const_view_array_with_tda(base : LibC::Long*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_const_view
  fun gsl_matrix_long_const_view_vector(v : Gsl_vector_long*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_long_const_view
  fun gsl_matrix_long_const_view_vector_with_tda(v : Gsl_vector_long*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_long_const_view
  fun gsl_matrix_long_set_zero(m : Gsl_matrix_long*)
  fun gsl_matrix_long_set_identity(m : Gsl_matrix_long*)
  fun gsl_matrix_long_set_all(m : Gsl_matrix_long*, x : LibC::Long)
  fun gsl_matrix_long_fread(stream : File*, m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_fwrite(stream : File*, m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_fscanf(stream : File*, m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_fprintf(stream : File*, m : Gsl_matrix_long*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_long_memcpy(dest : Gsl_matrix_long*, src : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_swap(m1 : Gsl_matrix_long*, m2 : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_long*, src : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_swap_rows(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_long_swap_columns(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_long_swap_rowcol(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_long_transpose(m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_transpose_memcpy(dest : Gsl_matrix_long*, src : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_long*, src : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_max(m : Gsl_matrix_long*) : LibC::Long
  fun gsl_matrix_long_min(m : Gsl_matrix_long*) : LibC::Long
  fun gsl_matrix_long_minmax(m : Gsl_matrix_long*, min_out : LibC::Long*, max_out : LibC::Long*)
  fun gsl_matrix_long_max_index(m : Gsl_matrix_long*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_long_min_index(m : Gsl_matrix_long*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_long_minmax_index(m : Gsl_matrix_long*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_long_equal(a : Gsl_matrix_long*, b : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_isnull(m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_ispos(m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_isneg(m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_isnonneg(m : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_add(a : Gsl_matrix_long*, b : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_sub(a : Gsl_matrix_long*, b : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_mul_elements(a : Gsl_matrix_long*, b : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_div_elements(a : Gsl_matrix_long*, b : Gsl_matrix_long*) : LibC::Int
  fun gsl_matrix_long_scale(a : Gsl_matrix_long*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_long_add_constant(a : Gsl_matrix_long*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_long_add_diagonal(a : Gsl_matrix_long*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_long_get_row(v : Gsl_vector_long*, m : Gsl_matrix_long*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_long_get_col(v : Gsl_vector_long*, m : Gsl_matrix_long*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_long_set_row(m : Gsl_matrix_long*, i : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_matrix_long_set_col(m : Gsl_matrix_long*, j : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_matrix_long_get(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Long
  fun gsl_matrix_long_set(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Long)
  fun gsl_matrix_long_ptr(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Long*
  fun gsl_matrix_long_const_ptr(m : Gsl_matrix_long*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Long*
  fun gsl_matrix_uint_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint*

  struct Gsl_matrix_uint
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::UInt*
    block : Gsl_block_uint*
    owner : LibC::Int
  end

  fun gsl_matrix_uint_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint*
  fun gsl_matrix_uint_alloc_from_block(b : Gsl_block_uint*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_uint*
  fun gsl_matrix_uint_alloc_from_matrix(m : Gsl_matrix_uint*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint*
  fun gsl_vector_uint_alloc_row_from_matrix(m : Gsl_matrix_uint*, i : LibC::SizeT) : Gsl_vector_uint*
  fun gsl_vector_uint_alloc_col_from_matrix(m : Gsl_matrix_uint*, j : LibC::SizeT) : Gsl_vector_uint*
  fun gsl_matrix_uint_free(m : Gsl_matrix_uint*)
  fun gsl_matrix_uint_submatrix(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_view

  struct Gsl_matrix_uint_view
    matrix : Gsl_matrix_uint
  end

  fun gsl_matrix_uint_row(m : Gsl_matrix_uint*, i : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_column(m : Gsl_matrix_uint*, j : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_diagonal(m : Gsl_matrix_uint*) : Gsl_vector_uint_view
  fun gsl_matrix_uint_subdiagonal(m : Gsl_matrix_uint*, k : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_superdiagonal(m : Gsl_matrix_uint*, k : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_subrow(m : Gsl_matrix_uint*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_subcolumn(m : Gsl_matrix_uint*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_view
  fun gsl_matrix_uint_view_array(base : LibC::UInt*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_view
  fun gsl_matrix_uint_view_array_with_tda(base : LibC::UInt*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uint_view
  fun gsl_matrix_uint_view_vector(v : Gsl_vector_uint*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_view
  fun gsl_matrix_uint_view_vector_with_tda(v : Gsl_vector_uint*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uint_view
  fun gsl_matrix_uint_const_submatrix(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_const_view

  struct Gsl_matrix_uint_const_view
    matrix : Gsl_matrix_uint
  end

  fun gsl_matrix_uint_const_row(m : Gsl_matrix_uint*, i : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_column(m : Gsl_matrix_uint*, j : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_diagonal(m : Gsl_matrix_uint*) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_subdiagonal(m : Gsl_matrix_uint*, k : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_superdiagonal(m : Gsl_matrix_uint*, k : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_subrow(m : Gsl_matrix_uint*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_subcolumn(m : Gsl_matrix_uint*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uint_const_view
  fun gsl_matrix_uint_const_view_array(base : LibC::UInt*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_const_view
  fun gsl_matrix_uint_const_view_array_with_tda(base : LibC::UInt*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uint_const_view
  fun gsl_matrix_uint_const_view_vector(v : Gsl_vector_uint*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uint_const_view
  fun gsl_matrix_uint_const_view_vector_with_tda(v : Gsl_vector_uint*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uint_const_view
  fun gsl_matrix_uint_set_zero(m : Gsl_matrix_uint*)
  fun gsl_matrix_uint_set_identity(m : Gsl_matrix_uint*)
  fun gsl_matrix_uint_set_all(m : Gsl_matrix_uint*, x : LibC::UInt)
  fun gsl_matrix_uint_fread(stream : File*, m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_fwrite(stream : File*, m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_fscanf(stream : File*, m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_fprintf(stream : File*, m : Gsl_matrix_uint*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_uint_memcpy(dest : Gsl_matrix_uint*, src : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_swap(m1 : Gsl_matrix_uint*, m2 : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_uint*, src : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_swap_rows(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uint_swap_columns(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uint_swap_rowcol(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uint_transpose(m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_transpose_memcpy(dest : Gsl_matrix_uint*, src : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_uint*, src : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_max(m : Gsl_matrix_uint*) : LibC::UInt
  fun gsl_matrix_uint_min(m : Gsl_matrix_uint*) : LibC::UInt
  fun gsl_matrix_uint_minmax(m : Gsl_matrix_uint*, min_out : LibC::UInt*, max_out : LibC::UInt*)
  fun gsl_matrix_uint_max_index(m : Gsl_matrix_uint*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_uint_min_index(m : Gsl_matrix_uint*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_uint_minmax_index(m : Gsl_matrix_uint*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_uint_equal(a : Gsl_matrix_uint*, b : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_isnull(m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_ispos(m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_isneg(m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_isnonneg(m : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_add(a : Gsl_matrix_uint*, b : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_sub(a : Gsl_matrix_uint*, b : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_mul_elements(a : Gsl_matrix_uint*, b : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_div_elements(a : Gsl_matrix_uint*, b : Gsl_matrix_uint*) : LibC::Int
  fun gsl_matrix_uint_scale(a : Gsl_matrix_uint*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uint_add_constant(a : Gsl_matrix_uint*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uint_add_diagonal(a : Gsl_matrix_uint*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uint_get_row(v : Gsl_vector_uint*, m : Gsl_matrix_uint*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uint_get_col(v : Gsl_vector_uint*, m : Gsl_matrix_uint*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uint_set_row(m : Gsl_matrix_uint*, i : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_matrix_uint_set_col(m : Gsl_matrix_uint*, j : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_matrix_uint_get(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UInt
  fun gsl_matrix_uint_set(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::UInt)
  fun gsl_matrix_uint_ptr(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UInt*
  fun gsl_matrix_uint_const_ptr(m : Gsl_matrix_uint*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UInt*
  fun gsl_matrix_int_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int*

  struct Gsl_matrix_int
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Int*
    block : Gsl_block_int*
    owner : LibC::Int
  end

  fun gsl_matrix_int_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int*
  fun gsl_matrix_int_alloc_from_block(b : Gsl_block_int*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_int*
  fun gsl_matrix_int_alloc_from_matrix(m : Gsl_matrix_int*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int*
  fun gsl_vector_int_alloc_row_from_matrix(m : Gsl_matrix_int*, i : LibC::SizeT) : Gsl_vector_int*
  fun gsl_vector_int_alloc_col_from_matrix(m : Gsl_matrix_int*, j : LibC::SizeT) : Gsl_vector_int*
  fun gsl_matrix_int_free(m : Gsl_matrix_int*)
  fun gsl_matrix_int_submatrix(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_view

  struct Gsl_matrix_int_view
    matrix : Gsl_matrix_int
  end

  fun gsl_matrix_int_row(m : Gsl_matrix_int*, i : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_column(m : Gsl_matrix_int*, j : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_diagonal(m : Gsl_matrix_int*) : Gsl_vector_int_view
  fun gsl_matrix_int_subdiagonal(m : Gsl_matrix_int*, k : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_superdiagonal(m : Gsl_matrix_int*, k : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_subrow(m : Gsl_matrix_int*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_subcolumn(m : Gsl_matrix_int*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_view
  fun gsl_matrix_int_view_array(base : LibC::Int*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_view
  fun gsl_matrix_int_view_array_with_tda(base : LibC::Int*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_int_view
  fun gsl_matrix_int_view_vector(v : Gsl_vector_int*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_view
  fun gsl_matrix_int_view_vector_with_tda(v : Gsl_vector_int*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_int_view
  fun gsl_matrix_int_const_submatrix(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_const_view

  struct Gsl_matrix_int_const_view
    matrix : Gsl_matrix_int
  end

  fun gsl_matrix_int_const_row(m : Gsl_matrix_int*, i : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_column(m : Gsl_matrix_int*, j : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_diagonal(m : Gsl_matrix_int*) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_subdiagonal(m : Gsl_matrix_int*, k : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_superdiagonal(m : Gsl_matrix_int*, k : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_subrow(m : Gsl_matrix_int*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_subcolumn(m : Gsl_matrix_int*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_int_const_view
  fun gsl_matrix_int_const_view_array(base : LibC::Int*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_const_view
  fun gsl_matrix_int_const_view_array_with_tda(base : LibC::Int*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_int_const_view
  fun gsl_matrix_int_const_view_vector(v : Gsl_vector_int*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_int_const_view
  fun gsl_matrix_int_const_view_vector_with_tda(v : Gsl_vector_int*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_int_const_view
  fun gsl_matrix_int_set_zero(m : Gsl_matrix_int*)
  fun gsl_matrix_int_set_identity(m : Gsl_matrix_int*)
  fun gsl_matrix_int_set_all(m : Gsl_matrix_int*, x : LibC::Int)
  fun gsl_matrix_int_fread(stream : File*, m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_fwrite(stream : File*, m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_fscanf(stream : File*, m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_fprintf(stream : File*, m : Gsl_matrix_int*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_int_memcpy(dest : Gsl_matrix_int*, src : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_swap(m1 : Gsl_matrix_int*, m2 : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_int*, src : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_swap_rows(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_swap_columns(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_swap_rowcol(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_transpose(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_transpose_memcpy(dest : Gsl_matrix_int*, src : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_int*, src : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_max(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_min(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_minmax(m : Gsl_matrix_int*, min_out : LibC::Int*, max_out : LibC::Int*)
  fun gsl_matrix_int_max_index(m : Gsl_matrix_int*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_int_min_index(m : Gsl_matrix_int*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_int_minmax_index(m : Gsl_matrix_int*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_int_equal(a : Gsl_matrix_int*, b : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_isnull(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_ispos(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_isneg(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_isnonneg(m : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_add(a : Gsl_matrix_int*, b : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_sub(a : Gsl_matrix_int*, b : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_mul_elements(a : Gsl_matrix_int*, b : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_div_elements(a : Gsl_matrix_int*, b : Gsl_matrix_int*) : LibC::Int
  fun gsl_matrix_int_scale(a : Gsl_matrix_int*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_int_add_constant(a : Gsl_matrix_int*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_int_add_diagonal(a : Gsl_matrix_int*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_int_get_row(v : Gsl_vector_int*, m : Gsl_matrix_int*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_get_col(v : Gsl_vector_int*, m : Gsl_matrix_int*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_set_row(m : Gsl_matrix_int*, i : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_matrix_int_set_col(m : Gsl_matrix_int*, j : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_matrix_int_get(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_int_set(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Int)
  fun gsl_matrix_int_ptr(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int*
  fun gsl_matrix_int_const_ptr(m : Gsl_matrix_int*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int*
  fun gsl_matrix_ushort_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort*

  struct Gsl_matrix_ushort
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::UShort*
    block : Gsl_block_ushort*
    owner : LibC::Int
  end

  fun gsl_matrix_ushort_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort*
  fun gsl_matrix_ushort_alloc_from_block(b : Gsl_block_ushort*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_ushort*
  fun gsl_matrix_ushort_alloc_from_matrix(m : Gsl_matrix_ushort*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort*
  fun gsl_vector_ushort_alloc_row_from_matrix(m : Gsl_matrix_ushort*, i : LibC::SizeT) : Gsl_vector_ushort*
  fun gsl_vector_ushort_alloc_col_from_matrix(m : Gsl_matrix_ushort*, j : LibC::SizeT) : Gsl_vector_ushort*
  fun gsl_matrix_ushort_free(m : Gsl_matrix_ushort*)
  fun gsl_matrix_ushort_submatrix(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_view

  struct Gsl_matrix_ushort_view
    matrix : Gsl_matrix_ushort
  end

  fun gsl_matrix_ushort_row(m : Gsl_matrix_ushort*, i : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_column(m : Gsl_matrix_ushort*, j : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_diagonal(m : Gsl_matrix_ushort*) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_subdiagonal(m : Gsl_matrix_ushort*, k : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_superdiagonal(m : Gsl_matrix_ushort*, k : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_subrow(m : Gsl_matrix_ushort*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_subcolumn(m : Gsl_matrix_ushort*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_view
  fun gsl_matrix_ushort_view_array(base : LibC::UShort*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_view
  fun gsl_matrix_ushort_view_array_with_tda(base : LibC::UShort*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ushort_view
  fun gsl_matrix_ushort_view_vector(v : Gsl_vector_ushort*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_view
  fun gsl_matrix_ushort_view_vector_with_tda(v : Gsl_vector_ushort*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ushort_view
  fun gsl_matrix_ushort_const_submatrix(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_const_view

  struct Gsl_matrix_ushort_const_view
    matrix : Gsl_matrix_ushort
  end

  fun gsl_matrix_ushort_const_row(m : Gsl_matrix_ushort*, i : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_column(m : Gsl_matrix_ushort*, j : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_diagonal(m : Gsl_matrix_ushort*) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_subdiagonal(m : Gsl_matrix_ushort*, k : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_superdiagonal(m : Gsl_matrix_ushort*, k : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_subrow(m : Gsl_matrix_ushort*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_subcolumn(m : Gsl_matrix_ushort*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_ushort_const_view
  fun gsl_matrix_ushort_const_view_array(base : LibC::UShort*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_const_view
  fun gsl_matrix_ushort_const_view_array_with_tda(base : LibC::UShort*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ushort_const_view
  fun gsl_matrix_ushort_const_view_vector(v : Gsl_vector_ushort*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_ushort_const_view
  fun gsl_matrix_ushort_const_view_vector_with_tda(v : Gsl_vector_ushort*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_ushort_const_view
  fun gsl_matrix_ushort_set_zero(m : Gsl_matrix_ushort*)
  fun gsl_matrix_ushort_set_identity(m : Gsl_matrix_ushort*)
  fun gsl_matrix_ushort_set_all(m : Gsl_matrix_ushort*, x : LibC::UShort)
  fun gsl_matrix_ushort_fread(stream : File*, m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_fwrite(stream : File*, m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_fscanf(stream : File*, m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_fprintf(stream : File*, m : Gsl_matrix_ushort*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_ushort_memcpy(dest : Gsl_matrix_ushort*, src : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_swap(m1 : Gsl_matrix_ushort*, m2 : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_ushort*, src : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_swap_rows(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ushort_swap_columns(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ushort_swap_rowcol(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ushort_transpose(m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_transpose_memcpy(dest : Gsl_matrix_ushort*, src : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_ushort*, src : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_max(m : Gsl_matrix_ushort*) : LibC::UShort
  fun gsl_matrix_ushort_min(m : Gsl_matrix_ushort*) : LibC::UShort
  fun gsl_matrix_ushort_minmax(m : Gsl_matrix_ushort*, min_out : LibC::UShort*, max_out : LibC::UShort*)
  fun gsl_matrix_ushort_max_index(m : Gsl_matrix_ushort*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_ushort_min_index(m : Gsl_matrix_ushort*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_ushort_minmax_index(m : Gsl_matrix_ushort*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_ushort_equal(a : Gsl_matrix_ushort*, b : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_isnull(m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_ispos(m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_isneg(m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_isnonneg(m : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_add(a : Gsl_matrix_ushort*, b : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_sub(a : Gsl_matrix_ushort*, b : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_mul_elements(a : Gsl_matrix_ushort*, b : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_div_elements(a : Gsl_matrix_ushort*, b : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_matrix_ushort_scale(a : Gsl_matrix_ushort*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ushort_add_constant(a : Gsl_matrix_ushort*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ushort_add_diagonal(a : Gsl_matrix_ushort*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_ushort_get_row(v : Gsl_vector_ushort*, m : Gsl_matrix_ushort*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ushort_get_col(v : Gsl_vector_ushort*, m : Gsl_matrix_ushort*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_ushort_set_row(m : Gsl_matrix_ushort*, i : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_matrix_ushort_set_col(m : Gsl_matrix_ushort*, j : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_matrix_ushort_get(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UShort
  fun gsl_matrix_ushort_set(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::UShort)
  fun gsl_matrix_ushort_ptr(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UShort*
  fun gsl_matrix_ushort_const_ptr(m : Gsl_matrix_ushort*, i : LibC::SizeT, j : LibC::SizeT) : LibC::UShort*
  fun gsl_matrix_short_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short*

  struct Gsl_matrix_short
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Short*
    block : Gsl_block_short*
    owner : LibC::Int
  end

  fun gsl_matrix_short_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short*
  fun gsl_matrix_short_alloc_from_block(b : Gsl_block_short*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_short*
  fun gsl_matrix_short_alloc_from_matrix(m : Gsl_matrix_short*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short*
  fun gsl_vector_short_alloc_row_from_matrix(m : Gsl_matrix_short*, i : LibC::SizeT) : Gsl_vector_short*
  fun gsl_vector_short_alloc_col_from_matrix(m : Gsl_matrix_short*, j : LibC::SizeT) : Gsl_vector_short*
  fun gsl_matrix_short_free(m : Gsl_matrix_short*)
  fun gsl_matrix_short_submatrix(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_view

  struct Gsl_matrix_short_view
    matrix : Gsl_matrix_short
  end

  fun gsl_matrix_short_row(m : Gsl_matrix_short*, i : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_column(m : Gsl_matrix_short*, j : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_diagonal(m : Gsl_matrix_short*) : Gsl_vector_short_view
  fun gsl_matrix_short_subdiagonal(m : Gsl_matrix_short*, k : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_superdiagonal(m : Gsl_matrix_short*, k : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_subrow(m : Gsl_matrix_short*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_subcolumn(m : Gsl_matrix_short*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_view
  fun gsl_matrix_short_view_array(base : LibC::Short*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_view
  fun gsl_matrix_short_view_array_with_tda(base : LibC::Short*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_short_view
  fun gsl_matrix_short_view_vector(v : Gsl_vector_short*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_view
  fun gsl_matrix_short_view_vector_with_tda(v : Gsl_vector_short*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_short_view
  fun gsl_matrix_short_const_submatrix(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_const_view

  struct Gsl_matrix_short_const_view
    matrix : Gsl_matrix_short
  end

  fun gsl_matrix_short_const_row(m : Gsl_matrix_short*, i : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_column(m : Gsl_matrix_short*, j : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_diagonal(m : Gsl_matrix_short*) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_subdiagonal(m : Gsl_matrix_short*, k : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_superdiagonal(m : Gsl_matrix_short*, k : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_subrow(m : Gsl_matrix_short*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_subcolumn(m : Gsl_matrix_short*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_short_const_view
  fun gsl_matrix_short_const_view_array(base : LibC::Short*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_const_view
  fun gsl_matrix_short_const_view_array_with_tda(base : LibC::Short*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_short_const_view
  fun gsl_matrix_short_const_view_vector(v : Gsl_vector_short*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_short_const_view
  fun gsl_matrix_short_const_view_vector_with_tda(v : Gsl_vector_short*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_short_const_view
  fun gsl_matrix_short_set_zero(m : Gsl_matrix_short*)
  fun gsl_matrix_short_set_identity(m : Gsl_matrix_short*)
  fun gsl_matrix_short_set_all(m : Gsl_matrix_short*, x : LibC::Short)
  fun gsl_matrix_short_fread(stream : File*, m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_fwrite(stream : File*, m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_fscanf(stream : File*, m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_fprintf(stream : File*, m : Gsl_matrix_short*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_short_memcpy(dest : Gsl_matrix_short*, src : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_swap(m1 : Gsl_matrix_short*, m2 : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_short*, src : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_swap_rows(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_short_swap_columns(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_short_swap_rowcol(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_short_transpose(m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_transpose_memcpy(dest : Gsl_matrix_short*, src : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_short*, src : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_max(m : Gsl_matrix_short*) : LibC::Short
  fun gsl_matrix_short_min(m : Gsl_matrix_short*) : LibC::Short
  fun gsl_matrix_short_minmax(m : Gsl_matrix_short*, min_out : LibC::Short*, max_out : LibC::Short*)
  fun gsl_matrix_short_max_index(m : Gsl_matrix_short*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_short_min_index(m : Gsl_matrix_short*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_short_minmax_index(m : Gsl_matrix_short*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_short_equal(a : Gsl_matrix_short*, b : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_isnull(m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_ispos(m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_isneg(m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_isnonneg(m : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_add(a : Gsl_matrix_short*, b : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_sub(a : Gsl_matrix_short*, b : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_mul_elements(a : Gsl_matrix_short*, b : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_div_elements(a : Gsl_matrix_short*, b : Gsl_matrix_short*) : LibC::Int
  fun gsl_matrix_short_scale(a : Gsl_matrix_short*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_short_add_constant(a : Gsl_matrix_short*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_short_add_diagonal(a : Gsl_matrix_short*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_short_get_row(v : Gsl_vector_short*, m : Gsl_matrix_short*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_short_get_col(v : Gsl_vector_short*, m : Gsl_matrix_short*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_short_set_row(m : Gsl_matrix_short*, i : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_matrix_short_set_col(m : Gsl_matrix_short*, j : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_matrix_short_get(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Short
  fun gsl_matrix_short_set(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Short)
  fun gsl_matrix_short_ptr(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Short*
  fun gsl_matrix_short_const_ptr(m : Gsl_matrix_short*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Short*
  fun gsl_matrix_uchar_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar*

  struct Gsl_matrix_uchar
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : UInt8*
    block : Gsl_block_uchar*
    owner : LibC::Int
  end

  fun gsl_matrix_uchar_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar*
  fun gsl_matrix_uchar_alloc_from_block(b : Gsl_block_uchar*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_uchar*
  fun gsl_matrix_uchar_alloc_from_matrix(m : Gsl_matrix_uchar*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar*
  fun gsl_vector_uchar_alloc_row_from_matrix(m : Gsl_matrix_uchar*, i : LibC::SizeT) : Gsl_vector_uchar*
  fun gsl_vector_uchar_alloc_col_from_matrix(m : Gsl_matrix_uchar*, j : LibC::SizeT) : Gsl_vector_uchar*
  fun gsl_matrix_uchar_free(m : Gsl_matrix_uchar*)
  fun gsl_matrix_uchar_submatrix(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_view

  struct Gsl_matrix_uchar_view
    matrix : Gsl_matrix_uchar
  end

  fun gsl_matrix_uchar_row(m : Gsl_matrix_uchar*, i : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_column(m : Gsl_matrix_uchar*, j : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_diagonal(m : Gsl_matrix_uchar*) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_subdiagonal(m : Gsl_matrix_uchar*, k : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_superdiagonal(m : Gsl_matrix_uchar*, k : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_subrow(m : Gsl_matrix_uchar*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_subcolumn(m : Gsl_matrix_uchar*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_view
  fun gsl_matrix_uchar_view_array(base : UInt8*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_view
  fun gsl_matrix_uchar_view_array_with_tda(base : UInt8*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uchar_view
  fun gsl_matrix_uchar_view_vector(v : Gsl_vector_uchar*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_view
  fun gsl_matrix_uchar_view_vector_with_tda(v : Gsl_vector_uchar*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uchar_view
  fun gsl_matrix_uchar_const_submatrix(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_const_view

  struct Gsl_matrix_uchar_const_view
    matrix : Gsl_matrix_uchar
  end

  fun gsl_matrix_uchar_const_row(m : Gsl_matrix_uchar*, i : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_column(m : Gsl_matrix_uchar*, j : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_diagonal(m : Gsl_matrix_uchar*) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_subdiagonal(m : Gsl_matrix_uchar*, k : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_superdiagonal(m : Gsl_matrix_uchar*, k : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_subrow(m : Gsl_matrix_uchar*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_subcolumn(m : Gsl_matrix_uchar*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_uchar_const_view
  fun gsl_matrix_uchar_const_view_array(base : UInt8*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_const_view
  fun gsl_matrix_uchar_const_view_array_with_tda(base : UInt8*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uchar_const_view
  fun gsl_matrix_uchar_const_view_vector(v : Gsl_vector_uchar*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_uchar_const_view
  fun gsl_matrix_uchar_const_view_vector_with_tda(v : Gsl_vector_uchar*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_uchar_const_view
  fun gsl_matrix_uchar_set_zero(m : Gsl_matrix_uchar*)
  fun gsl_matrix_uchar_set_identity(m : Gsl_matrix_uchar*)
  fun gsl_matrix_uchar_set_all(m : Gsl_matrix_uchar*, x : UInt8)
  fun gsl_matrix_uchar_fread(stream : File*, m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_fwrite(stream : File*, m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_fscanf(stream : File*, m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_fprintf(stream : File*, m : Gsl_matrix_uchar*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_uchar_memcpy(dest : Gsl_matrix_uchar*, src : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_swap(m1 : Gsl_matrix_uchar*, m2 : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_uchar*, src : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_swap_rows(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uchar_swap_columns(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uchar_swap_rowcol(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uchar_transpose(m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_transpose_memcpy(dest : Gsl_matrix_uchar*, src : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_uchar*, src : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_max(m : Gsl_matrix_uchar*) : UInt8
  fun gsl_matrix_uchar_min(m : Gsl_matrix_uchar*) : UInt8
  fun gsl_matrix_uchar_minmax(m : Gsl_matrix_uchar*, min_out : UInt8*, max_out : UInt8*)
  fun gsl_matrix_uchar_max_index(m : Gsl_matrix_uchar*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_uchar_min_index(m : Gsl_matrix_uchar*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_uchar_minmax_index(m : Gsl_matrix_uchar*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_uchar_equal(a : Gsl_matrix_uchar*, b : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_isnull(m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_ispos(m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_isneg(m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_isnonneg(m : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_add(a : Gsl_matrix_uchar*, b : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_sub(a : Gsl_matrix_uchar*, b : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_mul_elements(a : Gsl_matrix_uchar*, b : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_div_elements(a : Gsl_matrix_uchar*, b : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_matrix_uchar_scale(a : Gsl_matrix_uchar*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uchar_add_constant(a : Gsl_matrix_uchar*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uchar_add_diagonal(a : Gsl_matrix_uchar*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_uchar_get_row(v : Gsl_vector_uchar*, m : Gsl_matrix_uchar*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uchar_get_col(v : Gsl_vector_uchar*, m : Gsl_matrix_uchar*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_uchar_set_row(m : Gsl_matrix_uchar*, i : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_matrix_uchar_set_col(m : Gsl_matrix_uchar*, j : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_matrix_uchar_get(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : UInt8
  fun gsl_matrix_uchar_set(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT, x : UInt8)
  fun gsl_matrix_uchar_ptr(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : UInt8*
  fun gsl_matrix_uchar_const_ptr(m : Gsl_matrix_uchar*, i : LibC::SizeT, j : LibC::SizeT) : UInt8*
  fun gsl_matrix_char_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char*

  struct Gsl_matrix_char
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    tda : LibC::SizeT
    data : LibC::Char*
    block : Gsl_block_char*
    owner : LibC::Int
  end

  fun gsl_matrix_char_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char*
  fun gsl_matrix_char_alloc_from_block(b : Gsl_block_char*, offset : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT, d2 : LibC::SizeT) : Gsl_matrix_char*
  fun gsl_matrix_char_alloc_from_matrix(m : Gsl_matrix_char*, k1 : LibC::SizeT, k2 : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char*
  fun gsl_vector_char_alloc_row_from_matrix(m : Gsl_matrix_char*, i : LibC::SizeT) : Gsl_vector_char*
  fun gsl_vector_char_alloc_col_from_matrix(m : Gsl_matrix_char*, j : LibC::SizeT) : Gsl_vector_char*
  fun gsl_matrix_char_free(m : Gsl_matrix_char*)
  fun gsl_matrix_char_submatrix(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_view

  struct Gsl_matrix_char_view
    matrix : Gsl_matrix_char
  end

  fun gsl_matrix_char_row(m : Gsl_matrix_char*, i : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_column(m : Gsl_matrix_char*, j : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_diagonal(m : Gsl_matrix_char*) : Gsl_vector_char_view
  fun gsl_matrix_char_subdiagonal(m : Gsl_matrix_char*, k : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_superdiagonal(m : Gsl_matrix_char*, k : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_subrow(m : Gsl_matrix_char*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_subcolumn(m : Gsl_matrix_char*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_view
  fun gsl_matrix_char_view_array(base : LibC::Char*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_view
  fun gsl_matrix_char_view_array_with_tda(base : LibC::Char*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_char_view
  fun gsl_matrix_char_view_vector(v : Gsl_vector_char*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_view
  fun gsl_matrix_char_view_vector_with_tda(v : Gsl_vector_char*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_char_view
  fun gsl_matrix_char_const_submatrix(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_const_view

  struct Gsl_matrix_char_const_view
    matrix : Gsl_matrix_char
  end

  fun gsl_matrix_char_const_row(m : Gsl_matrix_char*, i : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_column(m : Gsl_matrix_char*, j : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_diagonal(m : Gsl_matrix_char*) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_subdiagonal(m : Gsl_matrix_char*, k : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_superdiagonal(m : Gsl_matrix_char*, k : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_subrow(m : Gsl_matrix_char*, i : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_subcolumn(m : Gsl_matrix_char*, j : LibC::SizeT, offset : LibC::SizeT, n : LibC::SizeT) : Gsl_vector_char_const_view
  fun gsl_matrix_char_const_view_array(base : LibC::Char*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_const_view
  fun gsl_matrix_char_const_view_array_with_tda(base : LibC::Char*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_char_const_view
  fun gsl_matrix_char_const_view_vector(v : Gsl_vector_char*, n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix_char_const_view
  fun gsl_matrix_char_const_view_vector_with_tda(v : Gsl_vector_char*, n1 : LibC::SizeT, n2 : LibC::SizeT, tda : LibC::SizeT) : Gsl_matrix_char_const_view
  fun gsl_matrix_char_set_zero(m : Gsl_matrix_char*)
  fun gsl_matrix_char_set_identity(m : Gsl_matrix_char*)
  fun gsl_matrix_char_set_all(m : Gsl_matrix_char*, x : LibC::Char)
  fun gsl_matrix_char_fread(stream : File*, m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_fwrite(stream : File*, m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_fscanf(stream : File*, m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_fprintf(stream : File*, m : Gsl_matrix_char*, format : LibC::Char*) : LibC::Int
  fun gsl_matrix_char_memcpy(dest : Gsl_matrix_char*, src : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_swap(m1 : Gsl_matrix_char*, m2 : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_char*, src : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_swap_rows(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_char_swap_columns(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_char_swap_rowcol(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_char_transpose(m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_transpose_memcpy(dest : Gsl_matrix_char*, src : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_transpose_tricpy(uplo_src : LibC::Char, copy_diag : LibC::Int, dest : Gsl_matrix_char*, src : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_max(m : Gsl_matrix_char*) : LibC::Char
  fun gsl_matrix_char_min(m : Gsl_matrix_char*) : LibC::Char
  fun gsl_matrix_char_minmax(m : Gsl_matrix_char*, min_out : LibC::Char*, max_out : LibC::Char*)
  fun gsl_matrix_char_max_index(m : Gsl_matrix_char*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_char_min_index(m : Gsl_matrix_char*, imin : LibC::SizeT*, jmin : LibC::SizeT*)
  fun gsl_matrix_char_minmax_index(m : Gsl_matrix_char*, imin : LibC::SizeT*, jmin : LibC::SizeT*, imax : LibC::SizeT*, jmax : LibC::SizeT*)
  fun gsl_matrix_char_equal(a : Gsl_matrix_char*, b : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_isnull(m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_ispos(m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_isneg(m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_isnonneg(m : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_add(a : Gsl_matrix_char*, b : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_sub(a : Gsl_matrix_char*, b : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_mul_elements(a : Gsl_matrix_char*, b : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_div_elements(a : Gsl_matrix_char*, b : Gsl_matrix_char*) : LibC::Int
  fun gsl_matrix_char_scale(a : Gsl_matrix_char*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_char_add_constant(a : Gsl_matrix_char*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_char_add_diagonal(a : Gsl_matrix_char*, x : LibC::Double) : LibC::Int
  fun gsl_matrix_char_get_row(v : Gsl_vector_char*, m : Gsl_matrix_char*, i : LibC::SizeT) : LibC::Int
  fun gsl_matrix_char_get_col(v : Gsl_vector_char*, m : Gsl_matrix_char*, j : LibC::SizeT) : LibC::Int
  fun gsl_matrix_char_set_row(m : Gsl_matrix_char*, i : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_matrix_char_set_col(m : Gsl_matrix_char*, j : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_matrix_char_get(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Char
  fun gsl_matrix_char_set(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Char)
  fun gsl_matrix_char_ptr(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Char*
  fun gsl_matrix_char_const_ptr(m : Gsl_matrix_char*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Char*
  fun gsl_blas_sdsdot(alpha : LibC::Float, x : Gsl_vector_float*, y : Gsl_vector_float*, result : LibC::Float*) : LibC::Int
  fun gsl_blas_dsdot(x : Gsl_vector_float*, y : Gsl_vector_float*, result : LibC::Double*) : LibC::Int
  fun gsl_blas_sdot(x : Gsl_vector_float*, y : Gsl_vector_float*, result : LibC::Float*) : LibC::Int
  fun gsl_blas_ddot(x : Gsl_vector*, y : Gsl_vector*, result : LibC::Double*) : LibC::Int
  fun gsl_blas_cdotu(x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*, dotu : Gsl_complex_float) : LibC::Int
  fun gsl_blas_cdotc(x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*, dotc : Gsl_complex_float) : LibC::Int
  fun gsl_blas_zdotu(x : Gsl_vector_complex*, y : Gsl_vector_complex*, dotu : Gsl_complex*) : LibC::Int
  fun gsl_blas_zdotc(x : Gsl_vector_complex*, y : Gsl_vector_complex*, dotc : Gsl_complex*) : LibC::Int
  fun gsl_blas_snrm2(x : Gsl_vector_float*) : LibC::Float
  fun gsl_blas_sasum(x : Gsl_vector_float*) : LibC::Float
  fun gsl_blas_dnrm2(x : Gsl_vector*) : LibC::Double
  fun gsl_blas_dasum(x : Gsl_vector*) : LibC::Double
  fun gsl_blas_scnrm2(x : Gsl_vector_complex_float*) : LibC::Float
  fun gsl_blas_scasum(x : Gsl_vector_complex_float*) : LibC::Float
  fun gsl_blas_dznrm2(x : Gsl_vector_complex*) : LibC::Double
  fun gsl_blas_dzasum(x : Gsl_vector_complex*) : LibC::Double
  fun gsl_blas_isamax(x : Gsl_vector_float*) : CBLAS_INDEX_t
  alias CBLAS_INDEX_t = LibC::SizeT
  fun gsl_blas_idamax(x : Gsl_vector*) : CBLAS_INDEX_t
  fun gsl_blas_icamax(x : Gsl_vector_complex_float*) : CBLAS_INDEX_t
  fun gsl_blas_izamax(x : Gsl_vector_complex*) : CBLAS_INDEX_t
  fun gsl_blas_sswap(x : Gsl_vector_float*, y : Gsl_vector_float*) : LibC::Int
  fun gsl_blas_scopy(x : Gsl_vector_float*, y : Gsl_vector_float*) : LibC::Int
  fun gsl_blas_saxpy(alpha : LibC::Float, x : Gsl_vector_float*, y : Gsl_vector_float*) : LibC::Int
  fun gsl_blas_dswap(x : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_blas_dcopy(x : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_blas_daxpy(alpha : LibC::Double, x : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_blas_cswap(x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_ccopy(x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_caxpy(alpha : Gsl_complex_float, x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_zswap(x : Gsl_vector_complex*, y : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_zcopy(x : Gsl_vector_complex*, y : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_zaxpy(alpha : Gsl_complex, x : Gsl_vector_complex*, y : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_srotg(a : LibC::Float*, b : LibC::Float*, c : LibC::Float*, s : LibC::Float*) : LibC::Int
  fun gsl_blas_srotmg(d1 : LibC::Float*, d2 : LibC::Float*, b1 : LibC::Float*, b2 : LibC::Float, p : LibC::Float*) : LibC::Int
  fun gsl_blas_srot(x : Gsl_vector_float*, y : Gsl_vector_float*, c : LibC::Float, s : LibC::Float) : LibC::Int
  fun gsl_blas_srotm(x : Gsl_vector_float*, y : Gsl_vector_float*, p : LibC::Float*) : LibC::Int
  fun gsl_blas_drotg(a : LibC::Double*, b : LibC::Double*, c : LibC::Double*, s : LibC::Double*) : LibC::Int
  fun gsl_blas_drotmg(d1 : LibC::Double*, d2 : LibC::Double*, b1 : LibC::Double*, b2 : LibC::Double, p : LibC::Double*) : LibC::Int
  fun gsl_blas_drot(x : Gsl_vector*, y : Gsl_vector*, c : LibC::Double, s : LibC::Double) : LibC::Int
  fun gsl_blas_drotm(x : Gsl_vector*, y : Gsl_vector*, p : LibC::Double*) : LibC::Int
  fun gsl_blas_sscal(alpha : LibC::Float, x : Gsl_vector_float*)
  fun gsl_blas_dscal(alpha : LibC::Double, x : Gsl_vector*)
  fun gsl_blas_cscal(alpha : Gsl_complex_float, x : Gsl_vector_complex_float*)
  fun gsl_blas_zscal(alpha : Gsl_complex, x : Gsl_vector_complex*)
  fun gsl_blas_csscal(alpha : LibC::Float, x : Gsl_vector_complex_float*)
  fun gsl_blas_zdscal(alpha : LibC::Double, x : Gsl_vector_complex*)
  fun gsl_blas_sgemv(trans_a : CBLAS_TRANSPOSE_t, alpha : LibC::Float, a : Gsl_matrix_float*, x : Gsl_vector_float*, beta : LibC::Float, y : Gsl_vector_float*) : LibC::Int
  enum CBLAS_TRANSPOSE_t
    CblasNoTrans   = 111
    CblasTrans     = 112
    CblasConjTrans = 113
  end
  fun gsl_blas_strmv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_float*, x : Gsl_vector_float*) : LibC::Int
  enum CBLAS_UPLO_t
    CblasUpper = 121
    CblasLower = 122
  end

  enum CBLAS_DIAG_t
    CblasNonUnit = 131
    CblasUnit    = 132
  end
  fun gsl_blas_strsv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_float*, x : Gsl_vector_float*) : LibC::Int
  fun gsl_blas_dgemv(trans_a : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_matrix*, x : Gsl_vector*, beta : LibC::Double, y : Gsl_vector*) : LibC::Int
  fun gsl_blas_dtrmv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_blas_dtrsv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_blas_cgemv(trans_a : CBLAS_TRANSPOSE_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, x : Gsl_vector_complex_float*, beta : Gsl_complex_float, y : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_ctrmv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_complex_float*, x : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_ctrsv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_complex_float*, x : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_zgemv(trans_a : CBLAS_TRANSPOSE_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, x : Gsl_vector_complex*, beta : Gsl_complex, y : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_ztrmv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_complex*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_ztrsv(uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix_complex*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_ssymv(uplo : CBLAS_UPLO_t, alpha : LibC::Float, a : Gsl_matrix_float*, x : Gsl_vector_float*, beta : LibC::Float, y : Gsl_vector_float*) : LibC::Int
  fun gsl_blas_sger(alpha : LibC::Float, x : Gsl_vector_float*, y : Gsl_vector_float*, a : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_ssyr(uplo : CBLAS_UPLO_t, alpha : LibC::Float, x : Gsl_vector_float*, a : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_ssyr2(uplo : CBLAS_UPLO_t, alpha : LibC::Float, x : Gsl_vector_float*, y : Gsl_vector_float*, a : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_dsymv(uplo : CBLAS_UPLO_t, alpha : LibC::Double, a : Gsl_matrix*, x : Gsl_vector*, beta : LibC::Double, y : Gsl_vector*) : LibC::Int
  fun gsl_blas_dger(alpha : LibC::Double, x : Gsl_vector*, y : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dsyr(uplo : CBLAS_UPLO_t, alpha : LibC::Double, x : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dsyr2(uplo : CBLAS_UPLO_t, alpha : LibC::Double, x : Gsl_vector*, y : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_blas_chemv(uplo : CBLAS_UPLO_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, x : Gsl_vector_complex_float*, beta : Gsl_complex_float, y : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_blas_cgeru(alpha : Gsl_complex_float, x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*, a : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_cgerc(alpha : Gsl_complex_float, x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*, a : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_cher(uplo : CBLAS_UPLO_t, alpha : LibC::Float, x : Gsl_vector_complex_float*, a : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_cher2(uplo : CBLAS_UPLO_t, alpha : Gsl_complex_float, x : Gsl_vector_complex_float*, y : Gsl_vector_complex_float*, a : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_zhemv(uplo : CBLAS_UPLO_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, x : Gsl_vector_complex*, beta : Gsl_complex, y : Gsl_vector_complex*) : LibC::Int
  fun gsl_blas_zgeru(alpha : Gsl_complex, x : Gsl_vector_complex*, y : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zgerc(alpha : Gsl_complex, x : Gsl_vector_complex*, y : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zher(uplo : CBLAS_UPLO_t, alpha : LibC::Double, x : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zher2(uplo : CBLAS_UPLO_t, alpha : Gsl_complex, x : Gsl_vector_complex*, y : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_sgemm(trans_a : CBLAS_TRANSPOSE_t, trans_b : CBLAS_TRANSPOSE_t, alpha : LibC::Float, a : Gsl_matrix_float*, b : Gsl_matrix_float*, beta : LibC::Float, c : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_ssymm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : LibC::Float, a : Gsl_matrix_float*, b : Gsl_matrix_float*, beta : LibC::Float, c : Gsl_matrix_float*) : LibC::Int
  enum CBLAS_SIDE_t
    CblasLeft  = 141
    CblasRight = 142
  end
  fun gsl_blas_ssyrk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Float, a : Gsl_matrix_float*, beta : LibC::Float, c : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_ssyr2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Float, a : Gsl_matrix_float*, b : Gsl_matrix_float*, beta : LibC::Float, c : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_strmm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : LibC::Float, a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_strsm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : LibC::Float, a : Gsl_matrix_float*, b : Gsl_matrix_float*) : LibC::Int
  fun gsl_blas_dgemm(trans_a : CBLAS_TRANSPOSE_t, trans_b : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_matrix*, b : Gsl_matrix*, beta : LibC::Double, c : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dsymm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : LibC::Double, a : Gsl_matrix*, b : Gsl_matrix*, beta : LibC::Double, c : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dsyrk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_matrix*, beta : LibC::Double, c : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dsyr2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_matrix*, b : Gsl_matrix*, beta : LibC::Double, c : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dtrmm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : LibC::Double, a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_blas_dtrsm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : LibC::Double, a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_blas_cgemm(trans_a : CBLAS_TRANSPOSE_t, trans_b : CBLAS_TRANSPOSE_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*, beta : Gsl_complex_float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_csymm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*, beta : Gsl_complex_float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_csyrk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, beta : Gsl_complex_float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_csyr2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*, beta : Gsl_complex_float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_ctrmm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_ctrsm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_zgemm(trans_a : CBLAS_TRANSPOSE_t, trans_b : CBLAS_TRANSPOSE_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, beta : Gsl_complex, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zsymm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, beta : Gsl_complex, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zsyrk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, beta : Gsl_complex, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zsyr2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, beta : Gsl_complex, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_ztrmm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_ztrsm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, trans_a : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_chemm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*, beta : Gsl_complex_float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_cherk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Float, a : Gsl_matrix_complex_float*, beta : LibC::Float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_cher2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex_float, a : Gsl_matrix_complex_float*, b : Gsl_matrix_complex_float*, beta : LibC::Float, c : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_blas_zhemm(side : CBLAS_SIDE_t, uplo : CBLAS_UPLO_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, beta : Gsl_complex, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zherk(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_matrix_complex*, beta : LibC::Double, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_blas_zher2k(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, alpha : Gsl_complex, a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, beta : LibC::Double, c : Gsl_matrix_complex*) : LibC::Int
  fun gsl_log1p(x : LibC::Double) : LibC::Double
  fun gsl_expm1(x : LibC::Double) : LibC::Double
  fun gsl_hypot(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun gsl_hypot3(x : LibC::Double, y : LibC::Double, z : LibC::Double) : LibC::Double
  fun gsl_acosh(x : LibC::Double) : LibC::Double
  fun gsl_asinh(x : LibC::Double) : LibC::Double
  fun gsl_atanh(x : LibC::Double) : LibC::Double
  fun gsl_isnan(x : LibC::Double) : LibC::Int
  fun gsl_isinf(x : LibC::Double) : LibC::Int
  fun gsl_finite(x : LibC::Double) : LibC::Int
  fun gsl_nan : LibC::Double
  fun gsl_posinf : LibC::Double
  fun gsl_neginf : LibC::Double
  fun gsl_fdiv(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun gsl_coerce_double(x : LibC::Double) : LibC::Double
  fun gsl_coerce_float(x : LibC::Float) : LibC::Float
  # fun gsl_coerce_long_double(x : LibC::LongDouble) : LibC::LongDouble
  fun gsl_ldexp(x : LibC::Double, e : LibC::Int) : LibC::Double
  fun gsl_frexp(x : LibC::Double, e : LibC::Int*) : LibC::Double
  fun gsl_fcmp(x1 : LibC::Double, x2 : LibC::Double, epsilon : LibC::Double) : LibC::Int
  fun gsl_pow_2(x : LibC::Double) : LibC::Double
  fun gsl_pow_3(x : LibC::Double) : LibC::Double
  fun gsl_pow_4(x : LibC::Double) : LibC::Double
  fun gsl_pow_5(x : LibC::Double) : LibC::Double
  fun gsl_pow_6(x : LibC::Double) : LibC::Double
  fun gsl_pow_7(x : LibC::Double) : LibC::Double
  fun gsl_pow_8(x : LibC::Double) : LibC::Double
  fun gsl_pow_9(x : LibC::Double) : LibC::Double
  fun gsl_pow_int(x : LibC::Double, n : LibC::Int) : LibC::Double
  fun gsl_pow_uint(x : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_max(a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_min(a : LibC::Double, b : LibC::Double) : LibC::Double

  struct Gsl_function
    function : (LibC::Double, Void* -> LibC::Double)
    params : Void*
  end

  struct Gsl_function_fdf
    f : (LibC::Double, Void* -> LibC::Double)
    df : (LibC::Double, Void* -> LibC::Double)
    fdf : (LibC::Double, Void*, LibC::Double*, LibC::Double* -> Void)
    params : Void*
  end

  struct Gsl_function_vec
    function : (LibC::Double, LibC::Double*, Void* -> LibC::Int)
    params : Void*
  end

  fun gsl_bspline_alloc(k : LibC::SizeT, nbreak : LibC::SizeT) : Gsl_bspline_workspace*

  struct Gsl_bspline_workspace
    k : LibC::SizeT
    km1 : LibC::SizeT
    l : LibC::SizeT
    nbreak : LibC::SizeT
    n : LibC::SizeT
    knots : Gsl_vector*
    deltal : Gsl_vector*
    deltar : Gsl_vector*
    b : Gsl_vector*
    a : Gsl_matrix*
    d_b : Gsl_matrix*
  end

  fun gsl_bspline_free(w : Gsl_bspline_workspace*)
  fun gsl_bspline_ncoeffs(w : Gsl_bspline_workspace*) : LibC::SizeT
  fun gsl_bspline_order(w : Gsl_bspline_workspace*) : LibC::SizeT
  fun gsl_bspline_nbreak(w : Gsl_bspline_workspace*) : LibC::SizeT
  fun gsl_bspline_breakpoint(i : LibC::SizeT, w : Gsl_bspline_workspace*) : LibC::Double
  fun gsl_bspline_greville_abscissa(i : LibC::SizeT, w : Gsl_bspline_workspace*) : LibC::Double
  fun gsl_bspline_knots(breakpts : Gsl_vector*, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_bspline_knots_uniform(a : LibC::Double, b : LibC::Double, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_bspline_knots_greville(abscissae : Gsl_vector*, w : Gsl_bspline_workspace*, abserr : LibC::Double*) : LibC::Int
  fun gsl_bspline_eval(x : LibC::Double, b : Gsl_vector*, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_bspline_eval_nonzero(x : LibC::Double, bk : Gsl_vector*, istart : LibC::SizeT*, iend : LibC::SizeT*, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_bspline_deriv_eval(x : LibC::Double, nderiv : LibC::SizeT, d_b : Gsl_matrix*, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_bspline_deriv_eval_nonzero(x : LibC::Double, nderiv : LibC::SizeT, d_b : Gsl_matrix*, istart : LibC::SizeT*, iend : LibC::SizeT*, w : Gsl_bspline_workspace*) : LibC::Int
  fun gsl_cdf_ugaussian_P(x : LibC::Double) : LibC::Double
  fun gsl_cdf_ugaussian_Q(x : LibC::Double) : LibC::Double
  fun gsl_cdf_ugaussian_Pinv(p : LibC::Double) : LibC::Double
  fun gsl_cdf_ugaussian_Qinv(q : LibC::Double) : LibC::Double
  fun gsl_cdf_gaussian_P(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_gaussian_Q(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_gaussian_Pinv(p : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_gaussian_Qinv(q : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_gamma_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gamma_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gamma_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gamma_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_cauchy_P(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_cauchy_Q(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_cauchy_Pinv(p : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_cauchy_Qinv(q : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_laplace_P(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_laplace_Q(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_laplace_Pinv(p : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_laplace_Qinv(q : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_rayleigh_P(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_rayleigh_Q(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_rayleigh_Pinv(p : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_rayleigh_Qinv(q : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_chisq_P(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_chisq_Q(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_chisq_Pinv(p : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_chisq_Qinv(q : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_exponential_P(x : LibC::Double, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_exponential_Q(x : LibC::Double, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_exponential_Pinv(p : LibC::Double, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_exponential_Qinv(q : LibC::Double, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_exppow_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_exppow_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_tdist_P(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_tdist_Q(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_tdist_Pinv(p : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_tdist_Qinv(q : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_cdf_fdist_P(x : LibC::Double, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_cdf_fdist_Q(x : LibC::Double, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_cdf_fdist_Pinv(p : LibC::Double, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_cdf_fdist_Qinv(q : LibC::Double, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_cdf_beta_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_beta_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_beta_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_beta_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_flat_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_flat_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_flat_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_flat_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_lognormal_P(x : LibC::Double, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_lognormal_Q(x : LibC::Double, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_lognormal_Pinv(p : LibC::Double, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_lognormal_Qinv(q : LibC::Double, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel1_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel1_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel1_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel1_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel2_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel2_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel2_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_gumbel2_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_weibull_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_weibull_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_weibull_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_weibull_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_pareto_P(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_pareto_Q(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_pareto_Pinv(p : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_pareto_Qinv(q : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_cdf_logistic_P(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_logistic_Q(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_logistic_Pinv(p : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_logistic_Qinv(q : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_cdf_binomial_P(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_cdf_binomial_Q(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_cdf_poisson_P(k : LibC::UInt, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_poisson_Q(k : LibC::UInt, mu : LibC::Double) : LibC::Double
  fun gsl_cdf_geometric_P(k : LibC::UInt, p : LibC::Double) : LibC::Double
  fun gsl_cdf_geometric_Q(k : LibC::UInt, p : LibC::Double) : LibC::Double
  fun gsl_cdf_negative_binomial_P(k : LibC::UInt, p : LibC::Double, n : LibC::Double) : LibC::Double
  fun gsl_cdf_negative_binomial_Q(k : LibC::UInt, p : LibC::Double, n : LibC::Double) : LibC::Double
  fun gsl_cdf_pascal_P(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_cdf_pascal_Q(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_cdf_hypergeometric_P(k : LibC::UInt, n1 : LibC::UInt, n2 : LibC::UInt, t : LibC::UInt) : LibC::Double
  fun gsl_cdf_hypergeometric_Q(k : LibC::UInt, n1 : LibC::UInt, n2 : LibC::UInt, t : LibC::UInt) : LibC::Double

  struct Gsl_cheb_series
    c : LibC::Double*
    order : LibC::SizeT
    a : LibC::Double
    b : LibC::Double
    order_sp : LibC::SizeT
    f : LibC::Double*
  end

  fun gsl_cheb_alloc(order : LibC::SizeT) : Gsl_cheb_series*
  fun gsl_cheb_free(cs : Gsl_cheb_series*)
  fun gsl_cheb_init(cs : Gsl_cheb_series*, func : Gsl_function*, a : LibC::Double, b : LibC::Double) : LibC::Int
  fun gsl_cheb_order(cs : Gsl_cheb_series*) : LibC::SizeT
  fun gsl_cheb_size(cs : Gsl_cheb_series*) : LibC::SizeT
  fun gsl_cheb_coeffs(cs : Gsl_cheb_series*) : LibC::Double*
  fun gsl_cheb_eval(cs : Gsl_cheb_series*, x : LibC::Double) : LibC::Double
  fun gsl_cheb_eval_err(cs : Gsl_cheb_series*, x : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_cheb_eval_n(cs : Gsl_cheb_series*, order : LibC::SizeT, x : LibC::Double) : LibC::Double
  fun gsl_cheb_eval_n_err(cs : Gsl_cheb_series*, order : LibC::SizeT, x : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_cheb_eval_mode(cs : Gsl_cheb_series*, x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  alias Gsl_mode_t = LibC::UInt
  fun gsl_cheb_eval_mode_e(cs : Gsl_cheb_series*, x : LibC::Double, mode : Gsl_mode_t, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_cheb_calc_deriv(deriv : Gsl_cheb_series*, cs : Gsl_cheb_series*) : LibC::Int
  fun gsl_cheb_calc_integ(integ : Gsl_cheb_series*, cs : Gsl_cheb_series*) : LibC::Int

  struct Gsl_combination
    n : LibC::SizeT
    k : LibC::SizeT
    data : LibC::SizeT*
  end

  fun gsl_combination_alloc(n : LibC::SizeT, k : LibC::SizeT) : Gsl_combination*
  fun gsl_combination_calloc(n : LibC::SizeT, k : LibC::SizeT) : Gsl_combination*
  fun gsl_combination_init_first(c : Gsl_combination*)
  fun gsl_combination_init_last(c : Gsl_combination*)
  fun gsl_combination_free(c : Gsl_combination*)
  fun gsl_combination_memcpy(dest : Gsl_combination*, src : Gsl_combination*) : LibC::Int
  fun gsl_combination_fread(stream : File*, c : Gsl_combination*) : LibC::Int
  fun gsl_combination_fwrite(stream : File*, c : Gsl_combination*) : LibC::Int
  fun gsl_combination_fscanf(stream : File*, c : Gsl_combination*) : LibC::Int
  fun gsl_combination_fprintf(stream : File*, c : Gsl_combination*, format : LibC::Char*) : LibC::Int
  fun gsl_combination_n(c : Gsl_combination*) : LibC::SizeT
  fun gsl_combination_k(c : Gsl_combination*) : LibC::SizeT
  fun gsl_combination_data(c : Gsl_combination*) : LibC::SizeT*
  fun gsl_combination_valid(c : Gsl_combination*) : LibC::Int
  fun gsl_combination_next(c : Gsl_combination*) : LibC::Int
  fun gsl_combination_prev(c : Gsl_combination*) : LibC::Int
  fun gsl_combination_get(c : Gsl_combination*, i : LibC::SizeT) : LibC::SizeT
  fun gsl_complex_polar(r : LibC::Double, theta : LibC::Double) : Gsl_complex
  fun gsl_complex_rect(x : LibC::Double, y : LibC::Double) : Gsl_complex
  fun gsl_complex_arg(z : Gsl_complex) : LibC::Double
  fun gsl_complex_abs(z : Gsl_complex) : LibC::Double
  fun gsl_complex_abs2(z : Gsl_complex) : LibC::Double
  fun gsl_complex_logabs(z : Gsl_complex) : LibC::Double
  fun gsl_complex_add(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_sub(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_mul(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_div(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_add_real(a : Gsl_complex, x : LibC::Double) : Gsl_complex
  fun gsl_complex_sub_real(a : Gsl_complex, x : LibC::Double) : Gsl_complex
  fun gsl_complex_mul_real(a : Gsl_complex, x : LibC::Double) : Gsl_complex
  fun gsl_complex_div_real(a : Gsl_complex, x : LibC::Double) : Gsl_complex
  fun gsl_complex_add_imag(a : Gsl_complex, y : LibC::Double) : Gsl_complex
  fun gsl_complex_sub_imag(a : Gsl_complex, y : LibC::Double) : Gsl_complex
  fun gsl_complex_mul_imag(a : Gsl_complex, y : LibC::Double) : Gsl_complex
  fun gsl_complex_div_imag(a : Gsl_complex, y : LibC::Double) : Gsl_complex
  fun gsl_complex_conjugate(z : Gsl_complex) : Gsl_complex
  fun gsl_complex_inverse(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_negative(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_sqrt(z : Gsl_complex) : Gsl_complex
  fun gsl_complex_sqrt_real(x : LibC::Double) : Gsl_complex
  fun gsl_complex_pow(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_pow_real(a : Gsl_complex, b : LibC::Double) : Gsl_complex
  fun gsl_complex_exp(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_log(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_log10(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_log_b(a : Gsl_complex, b : Gsl_complex) : Gsl_complex
  fun gsl_complex_sin(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_cos(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_sec(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_csc(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_tan(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_cot(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arcsin(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arcsin_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arccos(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccos_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arcsec(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arcsec_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arccsc(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccsc_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arctan(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccot(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_sinh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_cosh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_sech(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_csch(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_tanh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_coth(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arcsinh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccosh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccosh_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arcsech(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arccsch(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arctanh(a : Gsl_complex) : Gsl_complex
  fun gsl_complex_arctanh_real(a : LibC::Double) : Gsl_complex
  fun gsl_complex_arccoth(a : Gsl_complex) : Gsl_complex
  fun gsl_deriv_central(f : Gsl_function*, x : LibC::Double, h : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_deriv_backward(f : Gsl_function*, x : LibC::Double, h : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_deriv_forward(f : Gsl_function*, x : LibC::Double, h : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_dft_complex_float_forward(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Float*) : LibC::Int
  fun gsl_dft_complex_float_backward(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Float*) : LibC::Int
  fun gsl_dft_complex_float_inverse(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Float*) : LibC::Int
  fun gsl_dft_complex_float_transform(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Float*, sign : Gsl_fft_direction) : LibC::Int
  enum Gsl_fft_direction
    Gsl_fft_forward  = -1
    Gsl_fft_backward =  1
  end
  fun gsl_dft_complex_forward(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Double*) : LibC::Int
  fun gsl_dft_complex_backward(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Double*) : LibC::Int
  fun gsl_dft_complex_inverse(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Double*) : LibC::Int
  fun gsl_dft_complex_transform(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, result : LibC::Double*, sign : Gsl_fft_direction) : LibC::Int

  struct Gsl_dht
    size : LibC::SizeT
    nu : LibC::Double
    xmax : LibC::Double
    kmax : LibC::Double
    j : LibC::Double*
    jjj : LibC::Double*
    j2 : LibC::Double*
  end

  fun gsl_dht_alloc(size : LibC::SizeT) : Gsl_dht*
  fun gsl_dht_new(size : LibC::SizeT, nu : LibC::Double, xmax : LibC::Double) : Gsl_dht*
  fun gsl_dht_init(t : Gsl_dht*, nu : LibC::Double, xmax : LibC::Double) : LibC::Int
  fun gsl_dht_x_sample(t : Gsl_dht*, n : LibC::Int) : LibC::Double
  fun gsl_dht_k_sample(t : Gsl_dht*, n : LibC::Int) : LibC::Double
  fun gsl_dht_free(t : Gsl_dht*)
  fun gsl_dht_apply(t : Gsl_dht*, f_in : LibC::Double*, f_out : LibC::Double*) : LibC::Int
  fun gsl_diff_central(f : Gsl_function*, x : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_diff_backward(f : Gsl_function*, x : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_diff_forward(f : Gsl_function*, x : LibC::Double, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_eigen_symm_alloc(n : LibC::SizeT) : Gsl_eigen_symm_workspace*

  struct Gsl_eigen_symm_workspace
    size : LibC::SizeT
    d : LibC::Double*
    sd : LibC::Double*
  end

  fun gsl_eigen_symm_free(w : Gsl_eigen_symm_workspace*)
  fun gsl_eigen_symm(a : Gsl_matrix*, eval : Gsl_vector*, w : Gsl_eigen_symm_workspace*) : LibC::Int
  fun gsl_eigen_symmv_alloc(n : LibC::SizeT) : Gsl_eigen_symmv_workspace*

  struct Gsl_eigen_symmv_workspace
    size : LibC::SizeT
    d : LibC::Double*
    sd : LibC::Double*
    gc : LibC::Double*
    gs : LibC::Double*
  end

  fun gsl_eigen_symmv_free(w : Gsl_eigen_symmv_workspace*)
  fun gsl_eigen_symmv(a : Gsl_matrix*, eval : Gsl_vector*, evec : Gsl_matrix*, w : Gsl_eigen_symmv_workspace*) : LibC::Int
  fun gsl_eigen_herm_alloc(n : LibC::SizeT) : Gsl_eigen_herm_workspace*

  struct Gsl_eigen_herm_workspace
    size : LibC::SizeT
    d : LibC::Double*
    sd : LibC::Double*
    tau : LibC::Double*
  end

  fun gsl_eigen_herm_free(w : Gsl_eigen_herm_workspace*)
  fun gsl_eigen_herm(a : Gsl_matrix_complex*, eval : Gsl_vector*, w : Gsl_eigen_herm_workspace*) : LibC::Int
  fun gsl_eigen_hermv_alloc(n : LibC::SizeT) : Gsl_eigen_hermv_workspace*

  struct Gsl_eigen_hermv_workspace
    size : LibC::SizeT
    d : LibC::Double*
    sd : LibC::Double*
    tau : LibC::Double*
    gc : LibC::Double*
    gs : LibC::Double*
  end

  fun gsl_eigen_hermv_free(w : Gsl_eigen_hermv_workspace*)
  fun gsl_eigen_hermv(a : Gsl_matrix_complex*, eval : Gsl_vector*, evec : Gsl_matrix_complex*, w : Gsl_eigen_hermv_workspace*) : LibC::Int
  fun gsl_eigen_francis_alloc : Gsl_eigen_francis_workspace*

  struct Gsl_eigen_francis_workspace
    size : LibC::SizeT
    max_iterations : LibC::SizeT
    n_iter : LibC::SizeT
    n_evals : LibC::SizeT
    compute_t : LibC::Int
    h : Gsl_matrix*
    z : Gsl_matrix*
  end

  fun gsl_eigen_francis_free(w : Gsl_eigen_francis_workspace*)
  fun gsl_eigen_francis_T(compute_t : LibC::Int, w : Gsl_eigen_francis_workspace*)
  fun gsl_eigen_francis(h : Gsl_matrix*, eval : Gsl_vector_complex*, w : Gsl_eigen_francis_workspace*) : LibC::Int
  fun gsl_eigen_francis_Z(h : Gsl_matrix*, eval : Gsl_vector_complex*, z : Gsl_matrix*, w : Gsl_eigen_francis_workspace*) : LibC::Int
  fun gsl_eigen_nonsymm_alloc(n : LibC::SizeT) : Gsl_eigen_nonsymm_workspace*

  struct Gsl_eigen_nonsymm_workspace
    size : LibC::SizeT
    diag : Gsl_vector*
    tau : Gsl_vector*
    z : Gsl_matrix*
    do_balance : LibC::Int
    n_evals : LibC::SizeT
    francis_workspace_p : Gsl_eigen_francis_workspace*
  end

  fun gsl_eigen_nonsymm_free(w : Gsl_eigen_nonsymm_workspace*)
  fun gsl_eigen_nonsymm_params(compute_t : LibC::Int, balance : LibC::Int, w : Gsl_eigen_nonsymm_workspace*)
  fun gsl_eigen_nonsymm(a : Gsl_matrix*, eval : Gsl_vector_complex*, w : Gsl_eigen_nonsymm_workspace*) : LibC::Int
  fun gsl_eigen_nonsymm_Z(a : Gsl_matrix*, eval : Gsl_vector_complex*, z : Gsl_matrix*, w : Gsl_eigen_nonsymm_workspace*) : LibC::Int
  fun gsl_eigen_nonsymmv_alloc(n : LibC::SizeT) : Gsl_eigen_nonsymmv_workspace*

  struct Gsl_eigen_nonsymmv_workspace
    size : LibC::SizeT
    work : Gsl_vector*
    work2 : Gsl_vector*
    work3 : Gsl_vector*
    z : Gsl_matrix*
    nonsymm_workspace_p : Gsl_eigen_nonsymm_workspace*
  end

  fun gsl_eigen_nonsymmv_free(w : Gsl_eigen_nonsymmv_workspace*)
  fun gsl_eigen_nonsymmv_params(balance : LibC::Int, w : Gsl_eigen_nonsymmv_workspace*)
  fun gsl_eigen_nonsymmv(a : Gsl_matrix*, eval : Gsl_vector_complex*, evec : Gsl_matrix_complex*, w : Gsl_eigen_nonsymmv_workspace*) : LibC::Int
  fun gsl_eigen_nonsymmv_Z(a : Gsl_matrix*, eval : Gsl_vector_complex*, evec : Gsl_matrix_complex*, z : Gsl_matrix*, w : Gsl_eigen_nonsymmv_workspace*) : LibC::Int
  fun gsl_eigen_gensymm_alloc(n : LibC::SizeT) : Gsl_eigen_gensymm_workspace*

  struct Gsl_eigen_gensymm_workspace
    size : LibC::SizeT
    symm_workspace_p : Gsl_eigen_symm_workspace*
  end

  fun gsl_eigen_gensymm_free(w : Gsl_eigen_gensymm_workspace*)
  fun gsl_eigen_gensymm(a : Gsl_matrix*, b : Gsl_matrix*, eval : Gsl_vector*, w : Gsl_eigen_gensymm_workspace*) : LibC::Int
  fun gsl_eigen_gensymm_standardize(a : Gsl_matrix*, b : Gsl_matrix*) : LibC::Int
  fun gsl_eigen_gensymmv_alloc(n : LibC::SizeT) : Gsl_eigen_gensymmv_workspace*

  struct Gsl_eigen_gensymmv_workspace
    size : LibC::SizeT
    symmv_workspace_p : Gsl_eigen_symmv_workspace*
  end

  fun gsl_eigen_gensymmv_free(w : Gsl_eigen_gensymmv_workspace*)
  fun gsl_eigen_gensymmv(a : Gsl_matrix*, b : Gsl_matrix*, eval : Gsl_vector*, evec : Gsl_matrix*, w : Gsl_eigen_gensymmv_workspace*) : LibC::Int
  fun gsl_eigen_genherm_alloc(n : LibC::SizeT) : Gsl_eigen_genherm_workspace*

  struct Gsl_eigen_genherm_workspace
    size : LibC::SizeT
    herm_workspace_p : Gsl_eigen_herm_workspace*
  end

  fun gsl_eigen_genherm_free(w : Gsl_eigen_genherm_workspace*)
  fun gsl_eigen_genherm(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, eval : Gsl_vector*, w : Gsl_eigen_genherm_workspace*) : LibC::Int
  fun gsl_eigen_genherm_standardize(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*) : LibC::Int
  fun gsl_eigen_genhermv_alloc(n : LibC::SizeT) : Gsl_eigen_genhermv_workspace*

  struct Gsl_eigen_genhermv_workspace
    size : LibC::SizeT
    hermv_workspace_p : Gsl_eigen_hermv_workspace*
  end

  fun gsl_eigen_genhermv_free(w : Gsl_eigen_genhermv_workspace*)
  fun gsl_eigen_genhermv(a : Gsl_matrix_complex*, b : Gsl_matrix_complex*, eval : Gsl_vector*, evec : Gsl_matrix_complex*, w : Gsl_eigen_genhermv_workspace*) : LibC::Int
  fun gsl_eigen_gen_alloc(n : LibC::SizeT) : Gsl_eigen_gen_workspace*

  struct Gsl_eigen_gen_workspace
    size : LibC::SizeT
    work : Gsl_vector*
    n_evals : LibC::SizeT
    max_iterations : LibC::SizeT
    n_iter : LibC::SizeT
    eshift : LibC::Double
    needtop : LibC::Int
    atol : LibC::Double
    btol : LibC::Double
    ascale : LibC::Double
    bscale : LibC::Double
    h : Gsl_matrix*
    r : Gsl_matrix*
    compute_s : LibC::Int
    compute_t : LibC::Int
    q : Gsl_matrix*
    z : Gsl_matrix*
  end

  fun gsl_eigen_gen_free(w : Gsl_eigen_gen_workspace*)
  fun gsl_eigen_gen_params(compute_s : LibC::Int, compute_t : LibC::Int, balance : LibC::Int, w : Gsl_eigen_gen_workspace*)
  fun gsl_eigen_gen(a : Gsl_matrix*, b : Gsl_matrix*, alpha : Gsl_vector_complex*, beta : Gsl_vector*, w : Gsl_eigen_gen_workspace*) : LibC::Int
  fun gsl_eigen_gen_QZ(a : Gsl_matrix*, b : Gsl_matrix*, alpha : Gsl_vector_complex*, beta : Gsl_vector*, q : Gsl_matrix*, z : Gsl_matrix*, w : Gsl_eigen_gen_workspace*) : LibC::Int
  fun gsl_eigen_genv_alloc(n : LibC::SizeT) : Gsl_eigen_genv_workspace*

  struct Gsl_eigen_genv_workspace
    size : LibC::SizeT
    work1 : Gsl_vector*
    work2 : Gsl_vector*
    work3 : Gsl_vector*
    work4 : Gsl_vector*
    work5 : Gsl_vector*
    work6 : Gsl_vector*
    q : Gsl_matrix*
    z : Gsl_matrix*
    gen_workspace_p : Gsl_eigen_gen_workspace*
  end

  fun gsl_eigen_genv_free(w : Gsl_eigen_genv_workspace*)
  fun gsl_eigen_genv(a : Gsl_matrix*, b : Gsl_matrix*, alpha : Gsl_vector_complex*, beta : Gsl_vector*, evec : Gsl_matrix_complex*, w : Gsl_eigen_genv_workspace*) : LibC::Int
  fun gsl_eigen_genv_QZ(a : Gsl_matrix*, b : Gsl_matrix*, alpha : Gsl_vector_complex*, beta : Gsl_vector*, evec : Gsl_matrix_complex*, q : Gsl_matrix*, z : Gsl_matrix*, w : Gsl_eigen_genv_workspace*) : LibC::Int
  fun gsl_eigen_symmv_sort(eval : Gsl_vector*, evec : Gsl_matrix*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  enum Gsl_eigen_sort_t
    GSL_EIGEN_SORT_VAL_ASC  = 0
    GSL_EIGEN_SORT_VAL_DESC = 1
    GSL_EIGEN_SORT_ABS_ASC  = 2
    GSL_EIGEN_SORT_ABS_DESC = 3
  end
  fun gsl_eigen_hermv_sort(eval : Gsl_vector*, evec : Gsl_matrix_complex*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  fun gsl_eigen_nonsymmv_sort(eval : Gsl_vector_complex*, evec : Gsl_matrix_complex*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  fun gsl_eigen_gensymmv_sort(eval : Gsl_vector*, evec : Gsl_matrix*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  fun gsl_eigen_genhermv_sort(eval : Gsl_vector*, evec : Gsl_matrix_complex*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  fun gsl_eigen_genv_sort(alpha : Gsl_vector_complex*, beta : Gsl_vector*, evec : Gsl_matrix_complex*, sort_type : Gsl_eigen_sort_t) : LibC::Int
  fun gsl_schur_gen_eigvals(a : Gsl_matrix*, b : Gsl_matrix*, wr1 : LibC::Double*, wr2 : LibC::Double*, wi : LibC::Double*, scale1 : LibC::Double*, scale2 : LibC::Double*) : LibC::Int
  fun gsl_schur_solve_equation(ca : LibC::Double, a : Gsl_matrix*, z : LibC::Double, d1 : LibC::Double, d2 : LibC::Double, b : Gsl_vector*, x : Gsl_vector*, s : LibC::Double*, xnorm : LibC::Double*, smin : LibC::Double) : LibC::Int
  fun gsl_schur_solve_equation_z(ca : LibC::Double, a : Gsl_matrix*, z : Gsl_complex*, d1 : LibC::Double, d2 : LibC::Double, b : Gsl_vector_complex*, x : Gsl_vector_complex*, s : LibC::Double*, xnorm : LibC::Double*, smin : LibC::Double) : LibC::Int
  fun gsl_eigen_jacobi(matrix : Gsl_matrix*, eval : Gsl_vector*, evec : Gsl_matrix*, max_rot : LibC::UInt, nrot : LibC::UInt*) : LibC::Int
  fun gsl_eigen_invert_jacobi(matrix : Gsl_matrix*, ainv : Gsl_matrix*, max_rot : LibC::UInt) : LibC::Int
  fun gsl_fft_complex_float_radix2_forward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  alias Gsl_complex_packed_array_float = LibC::Float*
  fun gsl_fft_complex_float_radix2_backward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_float_radix2_inverse(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_float_radix2_transform(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_complex_float_radix2_dif_forward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_float_radix2_dif_backward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_float_radix2_dif_inverse(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_float_radix2_dif_transform(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_complex_wavetable_float_alloc(n : LibC::SizeT) : Gsl_fft_complex_wavetable_float*

  struct Gsl_fft_complex_wavetable_float
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex_float[64]
    trig : Gsl_complex_float
  end

  fun gsl_fft_complex_wavetable_float_free(wavetable : Gsl_fft_complex_wavetable_float*)
  fun gsl_fft_complex_workspace_float_alloc(n : LibC::SizeT) : Gsl_fft_complex_workspace_float*

  struct Gsl_fft_complex_workspace_float
    n : LibC::SizeT
    scratch : LibC::Float*
  end

  fun gsl_fft_complex_workspace_float_free(workspace : Gsl_fft_complex_workspace_float*)
  fun gsl_fft_complex_float_memcpy(dest : Gsl_fft_complex_wavetable_float*, src : Gsl_fft_complex_wavetable_float*) : LibC::Int
  fun gsl_fft_complex_float_forward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable_float*, work : Gsl_fft_complex_workspace_float*) : LibC::Int
  fun gsl_fft_complex_float_backward(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable_float*, work : Gsl_fft_complex_workspace_float*) : LibC::Int
  fun gsl_fft_complex_float_inverse(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable_float*, work : Gsl_fft_complex_workspace_float*) : LibC::Int
  fun gsl_fft_complex_float_transform(data : Gsl_complex_packed_array_float, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable_float*, work : Gsl_fft_complex_workspace_float*, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_complex_radix2_forward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  alias Gsl_complex_packed_array = LibC::Double*
  fun gsl_fft_complex_radix2_backward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_radix2_inverse(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_radix2_transform(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_complex_radix2_dif_forward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_radix2_dif_backward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_radix2_dif_inverse(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_complex_radix2_dif_transform(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_complex_wavetable_alloc(n : LibC::SizeT) : Gsl_fft_complex_wavetable*

  struct Gsl_fft_complex_wavetable
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex*[64]
    trig : Gsl_complex*
  end

  fun gsl_fft_complex_wavetable_free(wavetable : Gsl_fft_complex_wavetable*)
  fun gsl_fft_complex_workspace_alloc(n : LibC::SizeT) : Gsl_fft_complex_workspace*

  struct Gsl_fft_complex_workspace
    n : LibC::SizeT
    scratch : LibC::Double*
  end

  fun gsl_fft_complex_workspace_free(workspace : Gsl_fft_complex_workspace*)
  fun gsl_fft_complex_memcpy(dest : Gsl_fft_complex_wavetable*, src : Gsl_fft_complex_wavetable*) : LibC::Int
  fun gsl_fft_complex_forward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable*, work : Gsl_fft_complex_workspace*) : LibC::Int
  fun gsl_fft_complex_backward(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable*, work : Gsl_fft_complex_workspace*) : LibC::Int
  fun gsl_fft_complex_inverse(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable*, work : Gsl_fft_complex_workspace*) : LibC::Int
  fun gsl_fft_complex_transform(data : Gsl_complex_packed_array, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_complex_wavetable*, work : Gsl_fft_complex_workspace*, sign : Gsl_fft_direction) : LibC::Int
  fun gsl_fft_real_float_radix2_transform(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_real_wavetable_float_alloc(n : LibC::SizeT) : Gsl_fft_real_wavetable_float*

  struct Gsl_fft_real_wavetable_float
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex_float[64]
    trig : Gsl_complex_float
  end

  fun gsl_fft_real_wavetable_float_free(wavetable : Gsl_fft_real_wavetable_float*)
  fun gsl_fft_real_workspace_float_alloc(n : LibC::SizeT) : Gsl_fft_real_workspace_float*

  struct Gsl_fft_real_workspace_float
    n : LibC::SizeT
    scratch : LibC::Float*
  end

  fun gsl_fft_real_workspace_float_free(workspace : Gsl_fft_real_workspace_float*)
  fun gsl_fft_real_float_transform(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_real_wavetable_float*, work : Gsl_fft_real_workspace_float*) : LibC::Int
  fun gsl_fft_real_float_unpack(real_float_coefficient : LibC::Float*, complex_coefficient : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_float_radix2_backward(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_float_radix2_inverse(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_float_radix2_transform(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_wavetable_float_alloc(n : LibC::SizeT) : Gsl_fft_halfcomplex_wavetable_float*

  struct Gsl_fft_halfcomplex_wavetable_float
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex_float[64]
    trig : Gsl_complex_float
  end

  fun gsl_fft_halfcomplex_wavetable_float_free(wavetable : Gsl_fft_halfcomplex_wavetable_float*)
  fun gsl_fft_halfcomplex_float_backward(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable_float*, work : Gsl_fft_real_workspace_float*) : LibC::Int
  fun gsl_fft_halfcomplex_float_inverse(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable_float*, work : Gsl_fft_real_workspace_float*) : LibC::Int
  fun gsl_fft_halfcomplex_float_transform(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable_float*, work : Gsl_fft_real_workspace_float*) : LibC::Int
  fun gsl_fft_halfcomplex_float_unpack(halfcomplex_coefficient : LibC::Float*, complex_coefficient : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_float_radix2_unpack(halfcomplex_coefficient : LibC::Float*, complex_coefficient : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_real_radix2_transform(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_real_wavetable_alloc(n : LibC::SizeT) : Gsl_fft_real_wavetable*

  struct Gsl_fft_real_wavetable
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex*[64]
    trig : Gsl_complex*
  end

  fun gsl_fft_real_wavetable_free(wavetable : Gsl_fft_real_wavetable*)
  fun gsl_fft_real_workspace_alloc(n : LibC::SizeT) : Gsl_fft_real_workspace*

  struct Gsl_fft_real_workspace
    n : LibC::SizeT
    scratch : LibC::Double*
  end

  fun gsl_fft_real_workspace_free(workspace : Gsl_fft_real_workspace*)
  fun gsl_fft_real_transform(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_real_wavetable*, work : Gsl_fft_real_workspace*) : LibC::Int
  fun gsl_fft_real_unpack(real_coefficient : LibC::Double*, complex_coefficient : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_radix2_backward(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_radix2_inverse(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_radix2_transform(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_wavetable_alloc(n : LibC::SizeT) : Gsl_fft_halfcomplex_wavetable*

  struct Gsl_fft_halfcomplex_wavetable
    n : LibC::SizeT
    nf : LibC::SizeT
    factor : LibC::SizeT[64]
    twiddle : Gsl_complex*[64]
    trig : Gsl_complex*
  end

  fun gsl_fft_halfcomplex_wavetable_free(wavetable : Gsl_fft_halfcomplex_wavetable*)
  fun gsl_fft_halfcomplex_backward(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable*, work : Gsl_fft_real_workspace*) : LibC::Int
  fun gsl_fft_halfcomplex_inverse(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable*, work : Gsl_fft_real_workspace*) : LibC::Int
  fun gsl_fft_halfcomplex_transform(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wavetable : Gsl_fft_halfcomplex_wavetable*, work : Gsl_fft_real_workspace*) : LibC::Int
  fun gsl_fft_halfcomplex_unpack(halfcomplex_coefficient : LibC::Double*, complex_coefficient : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fft_halfcomplex_radix2_unpack(halfcomplex_coefficient : LibC::Double*, complex_coefficient : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_fit_linear(x : LibC::Double*, xstride : LibC::SizeT, y : LibC::Double*, ystride : LibC::SizeT, n : LibC::SizeT, c0 : LibC::Double*, c1 : LibC::Double*, cov00 : LibC::Double*, cov01 : LibC::Double*, cov11 : LibC::Double*, sumsq : LibC::Double*) : LibC::Int
  fun gsl_fit_wlinear(x : LibC::Double*, xstride : LibC::SizeT, w : LibC::Double*, wstride : LibC::SizeT, y : LibC::Double*, ystride : LibC::SizeT, n : LibC::SizeT, c0 : LibC::Double*, c1 : LibC::Double*, cov00 : LibC::Double*, cov01 : LibC::Double*, cov11 : LibC::Double*, chisq : LibC::Double*) : LibC::Int
  fun gsl_fit_linear_est(x : LibC::Double, c0 : LibC::Double, c1 : LibC::Double, cov00 : LibC::Double, cov01 : LibC::Double, cov11 : LibC::Double, y : LibC::Double*, y_err : LibC::Double*) : LibC::Int
  fun gsl_fit_mul(x : LibC::Double*, xstride : LibC::SizeT, y : LibC::Double*, ystride : LibC::SizeT, n : LibC::SizeT, c1 : LibC::Double*, cov11 : LibC::Double*, sumsq : LibC::Double*) : LibC::Int
  fun gsl_fit_wmul(x : LibC::Double*, xstride : LibC::SizeT, w : LibC::Double*, wstride : LibC::SizeT, y : LibC::Double*, ystride : LibC::SizeT, n : LibC::SizeT, c1 : LibC::Double*, cov11 : LibC::Double*, sumsq : LibC::Double*) : LibC::Int
  fun gsl_fit_mul_est(x : LibC::Double, c1 : LibC::Double, cov11 : LibC::Double, y : LibC::Double*, y_err : LibC::Double*) : LibC::Int

  struct Gsl_permutation
    size : LibC::SizeT
    data : LibC::SizeT*
  end

  fun gsl_permutation_alloc(n : LibC::SizeT) : Gsl_permutation*
  fun gsl_permutation_calloc(n : LibC::SizeT) : Gsl_permutation*
  fun gsl_permutation_init(p : Gsl_permutation*)
  fun gsl_permutation_free(p : Gsl_permutation*)
  fun gsl_permutation_memcpy(dest : Gsl_permutation*, src : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_fread(stream : File*, p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_fwrite(stream : File*, p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_fscanf(stream : File*, p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_fprintf(stream : File*, p : Gsl_permutation*, format : LibC::Char*) : LibC::Int
  fun gsl_permutation_size(p : Gsl_permutation*) : LibC::SizeT
  fun gsl_permutation_data(p : Gsl_permutation*) : LibC::SizeT*
  fun gsl_permutation_swap(p : Gsl_permutation*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Int
  fun gsl_permutation_valid(p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_reverse(p : Gsl_permutation*)
  fun gsl_permutation_inverse(inv : Gsl_permutation*, p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_next(p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_prev(p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_mul(p : Gsl_permutation*, pa : Gsl_permutation*, pb : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_linear_to_canonical(q : Gsl_permutation*, p : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_canonical_to_linear(p : Gsl_permutation*, q : Gsl_permutation*) : LibC::Int
  fun gsl_permutation_inversions(p : Gsl_permutation*) : LibC::SizeT
  fun gsl_permutation_linear_cycles(p : Gsl_permutation*) : LibC::SizeT
  fun gsl_permutation_canonical_cycles(q : Gsl_permutation*) : LibC::SizeT
  fun gsl_permutation_get(p : Gsl_permutation*, i : LibC::SizeT) : LibC::SizeT
  fun gsl_heapsort(array : Void*, count : LibC::SizeT, size : LibC::SizeT, compare : Gsl_comparison_fn_t)
  alias Gsl_comparison_fn_t = (Void*, Void* -> LibC::Int)
  fun gsl_heapsort_index(p : LibC::SizeT*, array : Void*, count : LibC::SizeT, size : LibC::SizeT, compare : Gsl_comparison_fn_t) : LibC::Int
  fun gsl_histogram2d_alloc(nx : LibC::SizeT, ny : LibC::SizeT) : Gsl_histogram2d*

  struct Gsl_histogram2d
    nx : LibC::SizeT
    ny : LibC::SizeT
    xrange : LibC::Double*
    yrange : LibC::Double*
    bin : LibC::Double*
  end

  fun gsl_histogram2d_calloc(nx : LibC::SizeT, ny : LibC::SizeT) : Gsl_histogram2d*
  fun gsl_histogram2d_calloc_uniform(nx : LibC::SizeT, ny : LibC::SizeT, xmin : LibC::Double, xmax : LibC::Double, ymin : LibC::Double, ymax : LibC::Double) : Gsl_histogram2d*
  fun gsl_histogram2d_free(h : Gsl_histogram2d*)
  fun gsl_histogram2d_increment(h : Gsl_histogram2d*, x : LibC::Double, y : LibC::Double) : LibC::Int
  fun gsl_histogram2d_accumulate(h : Gsl_histogram2d*, x : LibC::Double, y : LibC::Double, weight : LibC::Double) : LibC::Int
  fun gsl_histogram2d_find(h : Gsl_histogram2d*, x : LibC::Double, y : LibC::Double, i : LibC::SizeT*, j : LibC::SizeT*) : LibC::Int
  fun gsl_histogram2d_get(h : Gsl_histogram2d*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double
  fun gsl_histogram2d_get_xrange(h : Gsl_histogram2d*, i : LibC::SizeT, xlower : LibC::Double*, xupper : LibC::Double*) : LibC::Int
  fun gsl_histogram2d_get_yrange(h : Gsl_histogram2d*, j : LibC::SizeT, ylower : LibC::Double*, yupper : LibC::Double*) : LibC::Int
  fun gsl_histogram2d_xmax(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_xmin(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_nx(h : Gsl_histogram2d*) : LibC::SizeT
  fun gsl_histogram2d_ymax(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_ymin(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_ny(h : Gsl_histogram2d*) : LibC::SizeT
  fun gsl_histogram2d_reset(h : Gsl_histogram2d*)
  fun gsl_histogram2d_calloc_range(nx : LibC::SizeT, ny : LibC::SizeT, xrange : LibC::Double*, yrange : LibC::Double*) : Gsl_histogram2d*
  fun gsl_histogram2d_set_ranges_uniform(h : Gsl_histogram2d*, xmin : LibC::Double, xmax : LibC::Double, ymin : LibC::Double, ymax : LibC::Double) : LibC::Int
  fun gsl_histogram2d_set_ranges(h : Gsl_histogram2d*, xrange : LibC::Double*, xsize : LibC::SizeT, yrange : LibC::Double*, ysize : LibC::SizeT) : LibC::Int
  fun gsl_histogram2d_memcpy(dest : Gsl_histogram2d*, source : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_clone(source : Gsl_histogram2d*) : Gsl_histogram2d*
  fun gsl_histogram2d_max_val(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_max_bin(h : Gsl_histogram2d*, i : LibC::SizeT*, j : LibC::SizeT*)
  fun gsl_histogram2d_min_val(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_min_bin(h : Gsl_histogram2d*, i : LibC::SizeT*, j : LibC::SizeT*)
  fun gsl_histogram2d_xmean(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_ymean(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_xsigma(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_ysigma(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_cov(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_sum(h : Gsl_histogram2d*) : LibC::Double
  fun gsl_histogram2d_equal_bins_p(h1 : Gsl_histogram2d*, h2 : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_add(h1 : Gsl_histogram2d*, h2 : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_sub(h1 : Gsl_histogram2d*, h2 : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_mul(h1 : Gsl_histogram2d*, h2 : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_div(h1 : Gsl_histogram2d*, h2 : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_scale(h : Gsl_histogram2d*, scale : LibC::Double) : LibC::Int
  fun gsl_histogram2d_shift(h : Gsl_histogram2d*, shift : LibC::Double) : LibC::Int
  fun gsl_histogram2d_fwrite(stream : File*, h : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_fread(stream : File*, h : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_fprintf(stream : File*, h : Gsl_histogram2d*, range_format : LibC::Char*, bin_format : LibC::Char*) : LibC::Int
  fun gsl_histogram2d_fscanf(stream : File*, h : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_pdf_alloc(nx : LibC::SizeT, ny : LibC::SizeT) : Gsl_histogram2d_pdf*

  struct Gsl_histogram2d_pdf
    nx : LibC::SizeT
    ny : LibC::SizeT
    xrange : LibC::Double*
    yrange : LibC::Double*
    sum : LibC::Double*
  end

  fun gsl_histogram2d_pdf_init(p : Gsl_histogram2d_pdf*, h : Gsl_histogram2d*) : LibC::Int
  fun gsl_histogram2d_pdf_free(p : Gsl_histogram2d_pdf*)
  fun gsl_histogram2d_pdf_sample(p : Gsl_histogram2d_pdf*, r1 : LibC::Double, r2 : LibC::Double, x : LibC::Double*, y : LibC::Double*) : LibC::Int
  fun gsl_histogram_alloc(n : LibC::SizeT) : Gsl_histogram*

  struct Gsl_histogram
    n : LibC::SizeT
    range : LibC::Double*
    bin : LibC::Double*
  end

  fun gsl_histogram_calloc(n : LibC::SizeT) : Gsl_histogram*
  fun gsl_histogram_calloc_uniform(n : LibC::SizeT, xmin : LibC::Double, xmax : LibC::Double) : Gsl_histogram*
  fun gsl_histogram_free(h : Gsl_histogram*)
  fun gsl_histogram_increment(h : Gsl_histogram*, x : LibC::Double) : LibC::Int
  fun gsl_histogram_accumulate(h : Gsl_histogram*, x : LibC::Double, weight : LibC::Double) : LibC::Int
  fun gsl_histogram_find(h : Gsl_histogram*, x : LibC::Double, i : LibC::SizeT*) : LibC::Int
  fun gsl_histogram_get(h : Gsl_histogram*, i : LibC::SizeT) : LibC::Double
  fun gsl_histogram_get_range(h : Gsl_histogram*, i : LibC::SizeT, lower : LibC::Double*, upper : LibC::Double*) : LibC::Int
  fun gsl_histogram_max(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_min(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_bins(h : Gsl_histogram*) : LibC::SizeT
  fun gsl_histogram_reset(h : Gsl_histogram*)
  fun gsl_histogram_calloc_range(n : LibC::SizeT, range : LibC::Double*) : Gsl_histogram*
  fun gsl_histogram_set_ranges(h : Gsl_histogram*, range : LibC::Double*, size : LibC::SizeT) : LibC::Int
  fun gsl_histogram_set_ranges_uniform(h : Gsl_histogram*, xmin : LibC::Double, xmax : LibC::Double) : LibC::Int
  fun gsl_histogram_memcpy(dest : Gsl_histogram*, source : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_clone(source : Gsl_histogram*) : Gsl_histogram*
  fun gsl_histogram_max_val(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_max_bin(h : Gsl_histogram*) : LibC::SizeT
  fun gsl_histogram_min_val(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_min_bin(h : Gsl_histogram*) : LibC::SizeT
  fun gsl_histogram_equal_bins_p(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_add(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_sub(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_mul(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_div(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_scale(h : Gsl_histogram*, scale : LibC::Double) : LibC::Int
  fun gsl_histogram_shift(h : Gsl_histogram*, shift : LibC::Double) : LibC::Int
  fun gsl_histogram_sigma(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_mean(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_sum(h : Gsl_histogram*) : LibC::Double
  fun gsl_histogram_fwrite(stream : File*, h : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_fread(stream : File*, h : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_fprintf(stream : File*, h : Gsl_histogram*, range_format : LibC::Char*, bin_format : LibC::Char*) : LibC::Int
  fun gsl_histogram_fscanf(stream : File*, h : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_pdf_alloc(n : LibC::SizeT) : Gsl_histogram_pdf*

  struct Gsl_histogram_pdf
    n : LibC::SizeT
    range : LibC::Double*
    sum : LibC::Double*
  end

  fun gsl_histogram_pdf_init(p : Gsl_histogram_pdf*, h : Gsl_histogram*) : LibC::Int
  fun gsl_histogram_pdf_free(p : Gsl_histogram_pdf*)
  fun gsl_histogram_pdf_sample(p : Gsl_histogram_pdf*, r : LibC::Double) : LibC::Double
  fun gsl_ieee_printf_float(x : LibC::Float*)
  fun gsl_ieee_printf_double(x : LibC::Double*)
  fun gsl_ieee_fprintf_float(stream : File*, x : LibC::Float*)
  fun gsl_ieee_fprintf_double(stream : File*, x : LibC::Double*)
  fun gsl_ieee_float_to_rep(x : LibC::Float*, r : Gsl_ieee_float_rep*)

  struct Gsl_ieee_float_rep
    sign : LibC::Int
    mantissa : LibC::Char[24]
    exponent : LibC::Int
    type : LibC::Int
  end

  fun gsl_ieee_double_to_rep(x : LibC::Double*, r : Gsl_ieee_double_rep*)

  struct Gsl_ieee_double_rep
    sign : LibC::Int
    mantissa : LibC::Char[53]
    exponent : LibC::Int
    type : LibC::Int
  end

  fun gsl_ieee_env_setup
  fun gsl_ieee_read_mode_string(description : LibC::Char*, precision : LibC::Int*, rounding : LibC::Int*, exception_mask : LibC::Int*) : LibC::Int
  fun gsl_ieee_set_mode(precision : LibC::Int, rounding : LibC::Int, exception_mask : LibC::Int) : LibC::Int
  fun gsl_integration_workspace_alloc(n : LibC::SizeT) : Gsl_integration_workspace*

  struct Gsl_integration_workspace
    limit : LibC::SizeT
    size : LibC::SizeT
    nrmax : LibC::SizeT
    i : LibC::SizeT
    maximum_level : LibC::SizeT
    alist : LibC::Double*
    blist : LibC::Double*
    rlist : LibC::Double*
    elist : LibC::Double*
    order : LibC::SizeT*
    level : LibC::SizeT*
  end

  fun gsl_integration_workspace_free(w : Gsl_integration_workspace*)
  fun gsl_integration_qaws_table_alloc(alpha : LibC::Double, beta : LibC::Double, mu : LibC::Int, nu : LibC::Int) : Gsl_integration_qaws_table*

  struct Gsl_integration_qaws_table
    alpha : LibC::Double
    beta : LibC::Double
    mu : LibC::Int
    nu : LibC::Int
    ri : LibC::Double[25]
    rj : LibC::Double[25]
    rg : LibC::Double[25]
    rh : LibC::Double[25]
  end

  fun gsl_integration_qaws_table_set(t : Gsl_integration_qaws_table*, alpha : LibC::Double, beta : LibC::Double, mu : LibC::Int, nu : LibC::Int) : LibC::Int
  fun gsl_integration_qaws_table_free(t : Gsl_integration_qaws_table*)
  fun gsl_integration_qawo_table_alloc(omega : LibC::Double, l : LibC::Double, sine : Gsl_integration_qawo_enum, n : LibC::SizeT) : Gsl_integration_qawo_table*
  enum Gsl_integration_qawo_enum
    GSL_INTEG_COSINE = 0
    GSL_INTEG_SINE   = 1
  end

  struct Gsl_integration_qawo_table
    n : LibC::SizeT
    omega : LibC::Double
    l : LibC::Double
    par : LibC::Double
    sine : Gsl_integration_qawo_enum
    chebmo : LibC::Double*
  end

  fun gsl_integration_qawo_table_set(t : Gsl_integration_qawo_table*, omega : LibC::Double, l : LibC::Double, sine : Gsl_integration_qawo_enum) : LibC::Int
  fun gsl_integration_qawo_table_set_length(t : Gsl_integration_qawo_table*, l : LibC::Double) : LibC::Int
  fun gsl_integration_qawo_table_free(t : Gsl_integration_qawo_table*)
  fun gsl_integration_qk15(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qk21(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qk31(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qk41(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qk51(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qk61(f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qcheb(f : Gsl_function*, a : LibC::Double, b : LibC::Double, cheb12 : LibC::Double*, cheb24 : LibC::Double*)
  fun gsl_integration_qk(n : LibC::Int, xgk : LibC::Double*, wg : LibC::Double*, wgk : LibC::Double*, fv1 : LibC::Double*, fv2 : LibC::Double*, f : Gsl_function*, a : LibC::Double, b : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, resabs : LibC::Double*, resasc : LibC::Double*)
  fun gsl_integration_qng(f : Gsl_function*, a : LibC::Double, b : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, result : LibC::Double*, abserr : LibC::Double*, neval : LibC::SizeT*) : LibC::Int
  fun gsl_integration_qag(f : Gsl_function*, a : LibC::Double, b : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, key : LibC::Int, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qagi(f : Gsl_function*, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qagiu(f : Gsl_function*, a : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qagil(f : Gsl_function*, b : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qags(f : Gsl_function*, a : LibC::Double, b : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qagp(f : Gsl_function*, pts : LibC::Double*, npts : LibC::SizeT, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qawc(f : Gsl_function*, a : LibC::Double, b : LibC::Double, c : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qaws(f : Gsl_function*, a : LibC::Double, b : LibC::Double, t : Gsl_integration_qaws_table*, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qawo(f : Gsl_function*, a : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, wf : Gsl_integration_qawo_table*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_qawf(f : Gsl_function*, a : LibC::Double, epsabs : LibC::Double, limit : LibC::SizeT, workspace : Gsl_integration_workspace*, cycle_workspace : Gsl_integration_workspace*, wf : Gsl_integration_qawo_table*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_integration_glfixed_table_alloc(n : LibC::SizeT) : Gsl_integration_glfixed_table*

  struct Gsl_integration_glfixed_table
    n : LibC::SizeT
    x : LibC::Double*
    w : LibC::Double*
    precomputed : LibC::Int
  end

  fun gsl_integration_glfixed_table_free(t : Gsl_integration_glfixed_table*)
  fun gsl_integration_glfixed(f : Gsl_function*, a : LibC::Double, b : LibC::Double, t : Gsl_integration_glfixed_table*) : LibC::Double
  fun gsl_integration_glfixed_point(a : LibC::Double, b : LibC::Double, i : LibC::SizeT, xi : LibC::Double*, wi : LibC::Double*, t : Gsl_integration_glfixed_table*) : LibC::Int
  fun gsl_integration_cquad_workspace_alloc(n : LibC::SizeT) : Gsl_integration_cquad_workspace*

  struct Gsl_integration_cquad_workspace
    size : LibC::SizeT
    ivals : Gsl_integration_cquad_ival*
    heap : LibC::SizeT*
  end

  struct Gsl_integration_cquad_ival
    a : LibC::Double
    b : LibC::Double
    c : LibC::Double[64]
    fx : LibC::Double[33]
    igral : LibC::Double
    err : LibC::Double
    depth : LibC::Int
    rdepth : LibC::Int
    ndiv : LibC::Int
  end

  fun gsl_integration_cquad_workspace_free(w : Gsl_integration_cquad_workspace*)
  fun gsl_integration_cquad(f : Gsl_function*, a : LibC::Double, b : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, ws : Gsl_integration_cquad_workspace*, result : LibC::Double*, abserr : LibC::Double*, nevals : LibC::SizeT*) : LibC::Int

  struct Gsl_integration_fixed_type
    check : (LibC::SizeT, Gsl_integration_fixed_params* -> LibC::Int)
    init : (LibC::SizeT, LibC::Double*, LibC::Double*, Gsl_integration_fixed_params* -> LibC::Int)
  end

  struct Gsl_integration_fixed_params
    alpha : LibC::Double
    beta : LibC::Double
    a : LibC::Double
    b : LibC::Double
    zemu : LibC::Double
    shft : LibC::Double
    slp : LibC::Double
    al : LibC::Double
    be : LibC::Double
  end

  fun gsl_integration_fixed_alloc(type : Gsl_integration_fixed_type*, n : LibC::SizeT, a : LibC::Double, b : LibC::Double, alpha : LibC::Double, beta : LibC::Double) : Gsl_integration_fixed_workspace*

  struct Gsl_integration_fixed_workspace
    n : LibC::SizeT
    weights : LibC::Double*
    x : LibC::Double*
    diag : LibC::Double*
    subdiag : LibC::Double*
    type : Gsl_integration_fixed_type*
  end

  fun gsl_integration_fixed_free(w : Gsl_integration_fixed_workspace*)
  fun gsl_integration_fixed_n(w : Gsl_integration_fixed_workspace*) : LibC::SizeT
  fun gsl_integration_fixed_nodes(w : Gsl_integration_fixed_workspace*) : LibC::Double*
  fun gsl_integration_fixed_weights(w : Gsl_integration_fixed_workspace*) : LibC::Double*
  fun gsl_integration_fixed(func : Gsl_function*, result : LibC::Double*, w : Gsl_integration_fixed_workspace*) : LibC::Int

  struct Gsl_interp_type
    name : LibC::Char*
    min_size : LibC::UInt
    alloc : (LibC::SizeT -> Void*)
    init : (Void*, LibC::Double*, LibC::Double*, LibC::SizeT -> LibC::Int)
    eval : (Void*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::Double, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv : (Void*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::Double, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv2 : (Void*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::Double, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_integ : (Void*, LibC::Double*, LibC::Double*, LibC::SizeT, Gsl_interp_accel*, LibC::Double, LibC::Double, LibC::Double* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_interp_accel
    cache : LibC::SizeT
    miss_count : LibC::SizeT
    hit_count : LibC::SizeT
  end

  fun gsl_interp_accel_alloc : Gsl_interp_accel*
  fun gsl_interp_accel_reset(a : Gsl_interp_accel*) : LibC::Int
  fun gsl_interp_accel_free(a : Gsl_interp_accel*)
  fun gsl_interp_alloc(t : Gsl_interp_type*, n : LibC::SizeT) : Gsl_interp*

  struct Gsl_interp
    type : Gsl_interp_type*
    xmin : LibC::Double
    xmax : LibC::Double
    size : LibC::SizeT
    state : Void*
  end

  fun gsl_interp_init(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, size : LibC::SizeT) : LibC::Int
  fun gsl_interp_name(interp : Gsl_interp*) : LibC::Char*
  fun gsl_interp_min_size(interp : Gsl_interp*) : LibC::UInt
  fun gsl_interp_type_min_size(t : Gsl_interp_type*) : LibC::UInt
  fun gsl_interp_eval_e(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*, y : LibC::Double*) : LibC::Int
  fun gsl_interp_eval(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp_eval_deriv_e(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*, d : LibC::Double*) : LibC::Int
  fun gsl_interp_eval_deriv(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp_eval_deriv2_e(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*, d2 : LibC::Double*) : LibC::Int
  fun gsl_interp_eval_deriv2(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp_eval_integ_e(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, a : LibC::Double, b : LibC::Double, acc : Gsl_interp_accel*, result : LibC::Double*) : LibC::Int
  fun gsl_interp_eval_integ(obj : Gsl_interp*, xa : LibC::Double*, ya : LibC::Double*, a : LibC::Double, b : LibC::Double, acc : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp_free(interp : Gsl_interp*)
  fun gsl_interp_bsearch(x_array : LibC::Double*, x : LibC::Double, index_lo : LibC::SizeT, index_hi : LibC::SizeT) : LibC::SizeT
  fun gsl_interp_accel_find(a : Gsl_interp_accel*, x_array : LibC::Double*, size : LibC::SizeT, x : LibC::Double) : LibC::SizeT

  struct Gsl_interp2d_type
    name : LibC::Char*
    min_size : LibC::UInt
    alloc : (LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT -> LibC::Int)
    eval : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv_x : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv_y : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv_xx : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv_xy : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    eval_deriv_yy : (Void*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::SizeT, LibC::SizeT, LibC::Double, LibC::Double, Gsl_interp_accel*, Gsl_interp_accel*, LibC::Double* -> LibC::Int)
    free : (Void* -> Void)
  end

  fun gsl_interp2d_alloc(t : Gsl_interp2d_type*, xsize : LibC::SizeT, ysize : LibC::SizeT) : Gsl_interp2d*

  struct Gsl_interp2d
    type : Gsl_interp2d_type*
    xmin : LibC::Double
    xmax : LibC::Double
    ymin : LibC::Double
    ymax : LibC::Double
    xsize : LibC::SizeT
    ysize : LibC::SizeT
    state : Void*
  end

  fun gsl_interp2d_name(interp : Gsl_interp2d*) : LibC::Char*
  fun gsl_interp2d_min_size(interp : Gsl_interp2d*) : LibC::SizeT
  fun gsl_interp2d_type_min_size(t : Gsl_interp2d_type*) : LibC::SizeT
  fun gsl_interp2d_set(interp : Gsl_interp2d*, zarr : LibC::Double*, i : LibC::SizeT, j : LibC::SizeT, z : LibC::Double) : LibC::Int
  fun gsl_interp2d_get(interp : Gsl_interp2d*, zarr : LibC::Double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double
  fun gsl_interp2d_idx(interp : Gsl_interp2d*, i : LibC::SizeT, j : LibC::SizeT) : LibC::SizeT
  fun gsl_interp2d_init(interp : Gsl_interp2d*, xa : LibC::Double*, ya : LibC::Double*, za : LibC::Double*, xsize : LibC::SizeT, ysize : LibC::SizeT) : LibC::Int
  fun gsl_interp2d_free(interp : Gsl_interp2d*)
  fun gsl_interp2d_eval(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_extrap(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_e_extrap(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_deriv_x(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_deriv_x_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_deriv_y(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_deriv_y_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_deriv_xx(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_deriv_xx_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_deriv_yy(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_deriv_yy_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_interp2d_eval_deriv_xy(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_interp2d_eval_deriv_xy_e(interp : Gsl_interp2d*, xarr : LibC::Double*, yarr : LibC::Double*, zarr : LibC::Double*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_linalg_matmult(a : Gsl_matrix*, b : Gsl_matrix*, c : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_matmult_mod(a : Gsl_matrix*, mod_a : Gsl_linalg_matrix_mod_t, b : Gsl_matrix*, mod_b : Gsl_linalg_matrix_mod_t, c : Gsl_matrix*) : LibC::Int
  enum Gsl_linalg_matrix_mod_t
    GSL_LINALG_MOD_NONE      = 0
    GSL_LINALG_MOD_TRANSPOSE = 1
    GSL_LINALG_MOD_CONJUGATE = 2
  end
  fun gsl_linalg_exponential_ss(a : Gsl_matrix*, e_a : Gsl_matrix*, mode : Gsl_mode_t) : LibC::Int
  fun gsl_linalg_householder_transform(v : Gsl_vector*) : LibC::Double
  fun gsl_linalg_complex_householder_transform(v : Gsl_vector_complex*) : Gsl_complex
  fun gsl_linalg_householder_hm(tau : LibC::Double, v : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_householder_mh(tau : LibC::Double, v : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_householder_hv(tau : LibC::Double, v : Gsl_vector*, w : Gsl_vector*) : LibC::Int
  fun gsl_linalg_householder_hm1(tau : LibC::Double, a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_complex_householder_hm(tau : Gsl_complex, v : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_linalg_complex_householder_mh(tau : Gsl_complex, v : Gsl_vector_complex*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_linalg_complex_householder_hv(tau : Gsl_complex, v : Gsl_vector_complex*, w : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_hessenberg_decomp(a : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_linalg_hessenberg_unpack(h : Gsl_matrix*, tau : Gsl_vector*, u : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_hessenberg_unpack_accum(h : Gsl_matrix*, tau : Gsl_vector*, u : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_hessenberg_set_zero(h : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_hessenberg_submatrix(m : Gsl_matrix*, a : Gsl_matrix*, top : LibC::SizeT, tau : Gsl_vector*) : LibC::Int
  fun gsl_linalg_hesstri_decomp(a : Gsl_matrix*, b : Gsl_matrix*, u : Gsl_matrix*, v : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_SV_decomp(a : Gsl_matrix*, v : Gsl_matrix*, s : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_SV_decomp_mod(a : Gsl_matrix*, x : Gsl_matrix*, v : Gsl_matrix*, s : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_SV_decomp_jacobi(a : Gsl_matrix*, q : Gsl_matrix*, s : Gsl_vector*) : LibC::Int
  fun gsl_linalg_SV_solve(u : Gsl_matrix*, q : Gsl_matrix*, s : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_SV_leverage(u : Gsl_matrix*, h : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LU_decomp(a : Gsl_matrix*, p : Gsl_permutation*, signum : LibC::Int*) : LibC::Int
  fun gsl_linalg_LU_solve(lu : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LU_svx(lu : Gsl_matrix*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LU_refine(a : Gsl_matrix*, lu : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LU_invert(lu : Gsl_matrix*, p : Gsl_permutation*, inverse : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_LU_det(lu : Gsl_matrix*, signum : LibC::Int) : LibC::Double
  fun gsl_linalg_LU_lndet(lu : Gsl_matrix*) : LibC::Double
  fun gsl_linalg_LU_sgndet(lu : Gsl_matrix*, signum : LibC::Int) : LibC::Int
  fun gsl_linalg_complex_LU_decomp(a : Gsl_matrix_complex*, p : Gsl_permutation*, signum : LibC::Int*) : LibC::Int
  fun gsl_linalg_complex_LU_solve(lu : Gsl_matrix_complex*, p : Gsl_permutation*, b : Gsl_vector_complex*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_complex_LU_svx(lu : Gsl_matrix_complex*, p : Gsl_permutation*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_complex_LU_refine(a : Gsl_matrix_complex*, lu : Gsl_matrix_complex*, p : Gsl_permutation*, b : Gsl_vector_complex*, x : Gsl_vector_complex*, work : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_complex_LU_invert(lu : Gsl_matrix_complex*, p : Gsl_permutation*, inverse : Gsl_matrix_complex*) : LibC::Int
  fun gsl_linalg_complex_LU_det(lu : Gsl_matrix_complex*, signum : LibC::Int) : Gsl_complex
  fun gsl_linalg_complex_LU_lndet(lu : Gsl_matrix_complex*) : LibC::Double
  fun gsl_linalg_complex_LU_sgndet(lu : Gsl_matrix_complex*, signum : LibC::Int) : Gsl_complex
  fun gsl_linalg_QR_decomp(a : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_solve(qr : Gsl_matrix*, tau : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_svx(qr : Gsl_matrix*, tau : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_lssolve(qr : Gsl_matrix*, tau : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*, residual : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_QRsolve(q : Gsl_matrix*, r : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_Rsolve(qr : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_Rsvx(qr : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_update(q : Gsl_matrix*, r : Gsl_matrix*, w : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_QTvec(qr : Gsl_matrix*, tau : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_Qvec(qr : Gsl_matrix*, tau : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QR_QTmat(qr : Gsl_matrix*, tau : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_QR_matQ(qr : Gsl_matrix*, tau : Gsl_vector*, a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_QR_unpack(qr : Gsl_matrix*, tau : Gsl_vector*, q : Gsl_matrix*, r : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_R_solve(r : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_R_svx(r : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_decomp(a : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, signum : LibC::Int*, norm : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_decomp2(a : Gsl_matrix*, q : Gsl_matrix*, r : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, signum : LibC::Int*, norm : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_solve(qr : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_lssolve(qr : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*, residual : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_lssolve2(qr : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, b : Gsl_vector*, rank : LibC::SizeT, x : Gsl_vector*, residual : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_svx(qr : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_QRsolve(q : Gsl_matrix*, r : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_Rsolve(qr : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_Rsvx(qr : Gsl_matrix*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_update(q : Gsl_matrix*, r : Gsl_matrix*, p : Gsl_permutation*, u : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_QRPT_rank(qr : Gsl_matrix*, tol : LibC::Double) : LibC::SizeT
  fun gsl_linalg_QRPT_rcond(qr : Gsl_matrix*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_COD_decomp(a : Gsl_matrix*, tau_q : Gsl_vector*, tau_z : Gsl_vector*, p : Gsl_permutation*, rank : LibC::SizeT*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_COD_decomp_e(a : Gsl_matrix*, tau_q : Gsl_vector*, tau_z : Gsl_vector*, p : Gsl_permutation*, tol : LibC::Double, rank : LibC::SizeT*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_COD_lssolve(qrzt : Gsl_matrix*, tau_q : Gsl_vector*, tau_z : Gsl_vector*, perm : Gsl_permutation*, rank : LibC::SizeT, b : Gsl_vector*, x : Gsl_vector*, residual : Gsl_vector*) : LibC::Int
  fun gsl_linalg_COD_lssolve2(lambda : LibC::Double, qrzt : Gsl_matrix*, tau_q : Gsl_vector*, tau_z : Gsl_vector*, perm : Gsl_permutation*, rank : LibC::SizeT, b : Gsl_vector*, x : Gsl_vector*, residual : Gsl_vector*, s : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_COD_unpack(qrzt : Gsl_matrix*, tau_q : Gsl_vector*, tau_z : Gsl_vector*, rank : LibC::SizeT, q : Gsl_matrix*, r : Gsl_matrix*, z : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_COD_matZ(qrzt : Gsl_matrix*, tau_z : Gsl_vector*, rank : LibC::SizeT, a : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_decomp(a : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_solve_T(lq : Gsl_matrix*, tau : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_svx_T(lq : Gsl_matrix*, tau : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_lssolve_T(lq : Gsl_matrix*, tau : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*, residual : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_Lsolve_T(lq : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_Lsvx_T(lq : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_L_solve_T(l : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_vecQ(lq : Gsl_matrix*, tau : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_vecQT(lq : Gsl_matrix*, tau : Gsl_vector*, v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_unpack(lq : Gsl_matrix*, tau : Gsl_vector*, q : Gsl_matrix*, l : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_LQ_update(q : Gsl_matrix*, r : Gsl_matrix*, v : Gsl_vector*, w : Gsl_vector*) : LibC::Int
  fun gsl_linalg_LQ_LQsolve(q : Gsl_matrix*, l : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_decomp(a : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, signum : LibC::Int*, norm : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_decomp2(a : Gsl_matrix*, q : Gsl_matrix*, r : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, signum : LibC::Int*, norm : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_solve_T(qr : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_svx_T(lq : Gsl_matrix*, tau : Gsl_vector*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_LQsolve_T(q : Gsl_matrix*, l : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_Lsolve_T(lq : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_Lsvx_T(lq : Gsl_matrix*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_PTLQ_update(q : Gsl_matrix*, l : Gsl_matrix*, p : Gsl_permutation*, v : Gsl_vector*, w : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_decomp(a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_cholesky_decomp1(a : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_cholesky_solve(cholesky : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_svx(cholesky : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_invert(cholesky : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_cholesky_decomp_unit(a : Gsl_matrix*, d : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_scale(a : Gsl_matrix*, s : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_scale_apply(a : Gsl_matrix*, s : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_decomp2(a : Gsl_matrix*, s : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_svx2(llt : Gsl_matrix*, s : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_solve2(llt : Gsl_matrix*, s : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_cholesky_rcond(llt : Gsl_matrix*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_complex_cholesky_decomp(a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_linalg_complex_cholesky_solve(cholesky : Gsl_matrix_complex*, b : Gsl_vector_complex*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_complex_cholesky_svx(cholesky : Gsl_matrix_complex*, x : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_complex_cholesky_invert(cholesky : Gsl_matrix_complex*) : LibC::Int
  fun gsl_linalg_pcholesky_decomp(a : Gsl_matrix*, p : Gsl_permutation*) : LibC::Int
  fun gsl_linalg_pcholesky_solve(ldlt : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_pcholesky_svx(ldlt : Gsl_matrix*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_pcholesky_decomp2(a : Gsl_matrix*, p : Gsl_permutation*, s : Gsl_vector*) : LibC::Int
  fun gsl_linalg_pcholesky_solve2(ldlt : Gsl_matrix*, p : Gsl_permutation*, s : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_pcholesky_svx2(ldlt : Gsl_matrix*, p : Gsl_permutation*, s : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_pcholesky_invert(ldlt : Gsl_matrix*, p : Gsl_permutation*, ainv : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_pcholesky_rcond(ldlt : Gsl_matrix*, p : Gsl_permutation*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_mcholesky_decomp(a : Gsl_matrix*, p : Gsl_permutation*, e : Gsl_vector*) : LibC::Int
  fun gsl_linalg_mcholesky_solve(ldlt : Gsl_matrix*, p : Gsl_permutation*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_mcholesky_svx(ldlt : Gsl_matrix*, p : Gsl_permutation*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_mcholesky_rcond(ldlt : Gsl_matrix*, p : Gsl_permutation*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_mcholesky_invert(ldlt : Gsl_matrix*, p : Gsl_permutation*, ainv : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_symmtd_decomp(a : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_linalg_symmtd_unpack(a : Gsl_matrix*, tau : Gsl_vector*, q : Gsl_matrix*, diag : Gsl_vector*, subdiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_symmtd_unpack_T(a : Gsl_matrix*, diag : Gsl_vector*, subdiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_hermtd_decomp(a : Gsl_matrix_complex*, tau : Gsl_vector_complex*) : LibC::Int
  fun gsl_linalg_hermtd_unpack(a : Gsl_matrix_complex*, tau : Gsl_vector_complex*, u : Gsl_matrix_complex*, diag : Gsl_vector*, sudiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_hermtd_unpack_T(a : Gsl_matrix_complex*, diag : Gsl_vector*, subdiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_HH_solve(a : Gsl_matrix*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_HH_svx(a : Gsl_matrix*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_solve_symm_tridiag(diag : Gsl_vector*, offdiag : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_solve_tridiag(diag : Gsl_vector*, abovediag : Gsl_vector*, belowdiag : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_solve_symm_cyc_tridiag(diag : Gsl_vector*, offdiag : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_solve_cyc_tridiag(diag : Gsl_vector*, abovediag : Gsl_vector*, belowdiag : Gsl_vector*, b : Gsl_vector*, x : Gsl_vector*) : LibC::Int
  fun gsl_linalg_bidiag_decomp(a : Gsl_matrix*, tau_u : Gsl_vector*, tau_v : Gsl_vector*) : LibC::Int
  fun gsl_linalg_bidiag_unpack(a : Gsl_matrix*, tau_u : Gsl_vector*, u : Gsl_matrix*, tau_v : Gsl_vector*, v : Gsl_matrix*, diag : Gsl_vector*, superdiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_bidiag_unpack2(a : Gsl_matrix*, tau_u : Gsl_vector*, tau_v : Gsl_vector*, v : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_bidiag_unpack_B(a : Gsl_matrix*, diag : Gsl_vector*, superdiag : Gsl_vector*) : LibC::Int
  fun gsl_linalg_balance_matrix(a : Gsl_matrix*, d : Gsl_vector*) : LibC::Int
  fun gsl_linalg_balance_accum(a : Gsl_matrix*, d : Gsl_vector*) : LibC::Int
  fun gsl_linalg_balance_columns(a : Gsl_matrix*, d : Gsl_vector*) : LibC::Int
  fun gsl_linalg_tri_upper_rcond(a : Gsl_matrix*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_tri_lower_rcond(a : Gsl_matrix*, rcond : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_invnorm1(n : LibC::SizeT, ainvx : (CBLAS_TRANSPOSE_t, Gsl_vector*, Void* -> LibC::Int), params : Void*, ainvnorm : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_linalg_tri_upper_invert(t : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_tri_lower_invert(t : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_tri_upper_unit_invert(t : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_tri_lower_unit_invert(t : Gsl_matrix*) : LibC::Int
  fun gsl_linalg_givens(a : LibC::Double, b : LibC::Double, c : LibC::Double*, s : LibC::Double*)
  fun gsl_linalg_givens_gv(v : Gsl_vector*, i : LibC::SizeT, j : LibC::SizeT, c : LibC::Double, s : LibC::Double)
  fun gsl_message(message : LibC::Char*, file : LibC::Char*, line : LibC::Int, mask : LibC::UInt)
  fun gsl_min_fminimizer_alloc(t : Gsl_min_fminimizer_type*) : Gsl_min_fminimizer*

  struct Gsl_min_fminimizer_type
    name : LibC::Char*
    size : LibC::SizeT
    set : (Void*, Gsl_function*, LibC::Double, LibC::Double, LibC::Double, LibC::Double, LibC::Double, LibC::Double -> LibC::Int)
    iterate : (Void*, Gsl_function*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double* -> LibC::Int)
  end

  struct Gsl_min_fminimizer
    type : Gsl_min_fminimizer_type*
    function : Gsl_function*
    x_minimum : LibC::Double
    x_lower : LibC::Double
    x_upper : LibC::Double
    f_minimum : LibC::Double
    f_lower : LibC::Double
    f_upper : LibC::Double
    state : Void*
  end

  fun gsl_min_fminimizer_free(s : Gsl_min_fminimizer*)
  fun gsl_min_fminimizer_set(s : Gsl_min_fminimizer*, f : Gsl_function*, x_minimum : LibC::Double, x_lower : LibC::Double, x_upper : LibC::Double) : LibC::Int
  fun gsl_min_fminimizer_set_with_values(s : Gsl_min_fminimizer*, f : Gsl_function*, x_minimum : LibC::Double, f_minimum : LibC::Double, x_lower : LibC::Double, f_lower : LibC::Double, x_upper : LibC::Double, f_upper : LibC::Double) : LibC::Int
  @[Raises]
  fun gsl_min_fminimizer_iterate(s : Gsl_min_fminimizer*) : LibC::Int
  fun gsl_min_fminimizer_name(s : Gsl_min_fminimizer*) : LibC::Char*
  fun gsl_min_fminimizer_x_minimum(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_x_lower(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_x_upper(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_f_minimum(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_f_lower(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_f_upper(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_fminimizer_minimum(s : Gsl_min_fminimizer*) : LibC::Double
  fun gsl_min_test_interval(x_lower : LibC::Double, x_upper : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_min_find_bracket(f : Gsl_function*, x_minimum : LibC::Double*, f_minimum : LibC::Double*, x_lower : LibC::Double*, f_lower : LibC::Double*, x_upper : LibC::Double*, f_upper : LibC::Double*, eval_max : LibC::SizeT) : LibC::Int

  struct Gsl_monte_function
    f : (LibC::Double*, LibC::SizeT, Void* -> LibC::Double)
    dim : LibC::SizeT
    params : Void*
  end

  struct Gsl_rng_type
    name : LibC::Char*
    max : LibC::ULong
    min : LibC::ULong
    size : LibC::SizeT
    set : (Void*, LibC::ULong -> Void)
    get : (Void* -> LibC::ULong)
    get_double : (Void* -> LibC::Double)
  end

  fun gsl_rng_types_setup : Gsl_rng_type**
  fun gsl_rng_alloc(t : Gsl_rng_type*) : Gsl_rng*

  struct Gsl_rng
    type : Gsl_rng_type*
    state : Void*
  end

  fun gsl_rng_memcpy(dest : Gsl_rng*, src : Gsl_rng*) : LibC::Int
  fun gsl_rng_clone(r : Gsl_rng*) : Gsl_rng*
  fun gsl_rng_free(r : Gsl_rng*)
  fun gsl_rng_set(r : Gsl_rng*, seed : LibC::ULong)
  fun gsl_rng_max(r : Gsl_rng*) : LibC::ULong
  fun gsl_rng_min(r : Gsl_rng*) : LibC::ULong
  fun gsl_rng_name(r : Gsl_rng*) : LibC::Char*
  fun gsl_rng_fread(stream : File*, r : Gsl_rng*) : LibC::Int
  fun gsl_rng_fwrite(stream : File*, r : Gsl_rng*) : LibC::Int
  fun gsl_rng_size(r : Gsl_rng*) : LibC::SizeT
  fun gsl_rng_state(r : Gsl_rng*) : Void*
  fun gsl_rng_print_state(r : Gsl_rng*)
  fun gsl_rng_env_setup : Gsl_rng_type*
  fun gsl_rng_get(r : Gsl_rng*) : LibC::ULong
  fun gsl_rng_uniform(r : Gsl_rng*) : LibC::Double
  fun gsl_rng_uniform_pos(r : Gsl_rng*) : LibC::Double
  fun gsl_rng_uniform_int(r : Gsl_rng*, n : LibC::ULong) : LibC::ULong
  fun gsl_monte_plain_integrate(f : Gsl_monte_function*, xl : LibC::Double*, xu : LibC::Double*, dim : LibC::SizeT, calls : LibC::SizeT, r : Gsl_rng*, state : Gsl_monte_plain_state*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int

  struct Gsl_monte_plain_state
    dim : LibC::SizeT
    x : LibC::Double*
  end

  fun gsl_monte_plain_alloc(dim : LibC::SizeT) : Gsl_monte_plain_state*
  fun gsl_monte_plain_init(state : Gsl_monte_plain_state*) : LibC::Int
  fun gsl_monte_plain_free(state : Gsl_monte_plain_state*)
  fun gsl_monte_miser_integrate(f : Gsl_monte_function*, xl : LibC::Double*, xh : LibC::Double*, dim : LibC::SizeT, calls : LibC::SizeT, r : Gsl_rng*, state : Gsl_monte_miser_state*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int

  struct Gsl_monte_miser_state
    min_calls : LibC::SizeT
    min_calls_per_bisection : LibC::SizeT
    dither : LibC::Double
    estimate_frac : LibC::Double
    alpha : LibC::Double
    dim : LibC::SizeT
    estimate_style : LibC::Int
    depth : LibC::Int
    verbose : LibC::Int
    x : LibC::Double*
    xmid : LibC::Double*
    sigma_l : LibC::Double*
    sigma_r : LibC::Double*
    fmax_l : LibC::Double*
    fmax_r : LibC::Double*
    fmin_l : LibC::Double*
    fmin_r : LibC::Double*
    fsum_l : LibC::Double*
    fsum_r : LibC::Double*
    fsum2_l : LibC::Double*
    fsum2_r : LibC::Double*
    hits_l : LibC::SizeT*
    hits_r : LibC::SizeT*
  end

  fun gsl_monte_miser_alloc(dim : LibC::SizeT) : Gsl_monte_miser_state*
  fun gsl_monte_miser_init(state : Gsl_monte_miser_state*) : LibC::Int
  fun gsl_monte_miser_free(state : Gsl_monte_miser_state*)
  fun gsl_monte_miser_params_get(state : Gsl_monte_miser_state*, params : Gsl_monte_miser_params*)

  struct Gsl_monte_miser_params
    estimate_frac : LibC::Double
    min_calls : LibC::SizeT
    min_calls_per_bisection : LibC::SizeT
    alpha : LibC::Double
    dither : LibC::Double
  end

  fun gsl_monte_miser_params_set(state : Gsl_monte_miser_state*, params : Gsl_monte_miser_params*)
  fun gsl_monte_vegas_integrate(f : Gsl_monte_function*, xl : LibC::Double*, xu : LibC::Double*, dim : LibC::SizeT, calls : LibC::SizeT, r : Gsl_rng*, state : Gsl_monte_vegas_state*, result : LibC::Double*, abserr : LibC::Double*) : LibC::Int

  struct Gsl_monte_vegas_state
    dim : LibC::SizeT
    bins_max : LibC::SizeT
    bins : LibC::UInt
    boxes : LibC::UInt
    xi : LibC::Double*
    xin : LibC::Double*
    delx : LibC::Double*
    weight : LibC::Double*
    vol : LibC::Double
    x : LibC::Double*
    bin : LibC::Int*
    box : LibC::Int*
    d : LibC::Double*
    alpha : LibC::Double
    mode : LibC::Int
    verbose : LibC::Int
    iterations : LibC::UInt
    stage : LibC::Int
    jac : LibC::Double
    wtd_int_sum : LibC::Double
    sum_wgts : LibC::Double
    chi_sum : LibC::Double
    chisq : LibC::Double
    result : LibC::Double
    sigma : LibC::Double
    it_start : LibC::UInt
    it_num : LibC::UInt
    samples : LibC::UInt
    calls_per_box : LibC::UInt
    ostream : File*
  end

  fun gsl_monte_vegas_alloc(dim : LibC::SizeT) : Gsl_monte_vegas_state*
  fun gsl_monte_vegas_init(state : Gsl_monte_vegas_state*) : LibC::Int
  fun gsl_monte_vegas_free(state : Gsl_monte_vegas_state*)
  fun gsl_monte_vegas_chisq(state : Gsl_monte_vegas_state*) : LibC::Double
  fun gsl_monte_vegas_runval(state : Gsl_monte_vegas_state*, result : LibC::Double*, sigma : LibC::Double*)
  fun gsl_monte_vegas_params_get(state : Gsl_monte_vegas_state*, params : Gsl_monte_vegas_params*)

  struct Gsl_monte_vegas_params
    alpha : LibC::Double
    iterations : LibC::SizeT
    stage : LibC::Int
    mode : LibC::Int
    verbose : LibC::Int
    ostream : File*
  end

  fun gsl_monte_vegas_params_set(state : Gsl_monte_vegas_state*, params : Gsl_monte_vegas_params*)
  fun gsl_multifit_linear_alloc(n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_linear_workspace*

  struct Gsl_multifit_linear_workspace
    nmax : LibC::SizeT
    pmax : LibC::SizeT
    n : LibC::SizeT
    p : LibC::SizeT
    a : Gsl_matrix*
    q : Gsl_matrix*
    qsi : Gsl_matrix*
    s : Gsl_vector*
    t : Gsl_vector*
    xt : Gsl_vector*
    d : Gsl_vector*
    rcond : LibC::Double
  end

  fun gsl_multifit_linear_free(w : Gsl_multifit_linear_workspace*)
  fun gsl_multifit_linear(x : Gsl_matrix*, y : Gsl_vector*, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_tsvd(x : Gsl_matrix*, y : Gsl_vector*, tol : LibC::Double, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, rank : LibC::SizeT*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_svd(x : Gsl_matrix*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_bsvd(x : Gsl_matrix*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_rank(tol : LibC::Double, work : Gsl_multifit_linear_workspace*) : LibC::SizeT
  fun gsl_multifit_linear_solve(lambda : LibC::Double, x : Gsl_matrix*, y : Gsl_vector*, c : Gsl_vector*, rnorm : LibC::Double*, snorm : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_applyW(x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, wx : Gsl_matrix*, wy : Gsl_vector*) : LibC::Int
  fun gsl_multifit_linear_stdform1(l : Gsl_vector*, x : Gsl_matrix*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_wstdform1(l : Gsl_vector*, x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_L_decomp(l : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_multifit_linear_stdform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, m : Gsl_matrix*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_wstdform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, m : Gsl_matrix*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_genform1(l : Gsl_vector*, cs : Gsl_vector*, c : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_genform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, y : Gsl_vector*, cs : Gsl_vector*, m : Gsl_matrix*, c : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_wgenform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, cs : Gsl_vector*, m : Gsl_matrix*, c : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_lreg(smin : LibC::Double, smax : LibC::Double, reg_param : Gsl_vector*) : LibC::Int
  fun gsl_multifit_linear_lcurve(y : Gsl_vector*, reg_param : Gsl_vector*, rho : Gsl_vector*, eta : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_lcorner(rho : Gsl_vector*, eta : Gsl_vector*, idx : LibC::SizeT*) : LibC::Int
  fun gsl_multifit_linear_lcorner2(reg_param : Gsl_vector*, eta : Gsl_vector*, idx : LibC::SizeT*) : LibC::Int
  fun gsl_multifit_linear_Lk(p : LibC::SizeT, k : LibC::SizeT, l : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_linear_Lsobolev(p : LibC::SizeT, kmax : LibC::SizeT, alpha : Gsl_vector*, l : Gsl_matrix*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_wlinear(x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_wlinear_tsvd(x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, tol : LibC::Double, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, rank : LibC::SizeT*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_wlinear_svd(x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, tol : LibC::Double, rank : LibC::SizeT*, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_wlinear_usvd(x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, tol : LibC::Double, rank : LibC::SizeT*, c : Gsl_vector*, cov : Gsl_matrix*, chisq : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_est(x : Gsl_vector*, c : Gsl_vector*, cov : Gsl_matrix*, y : LibC::Double*, y_err : LibC::Double*) : LibC::Int
  fun gsl_multifit_linear_rcond(w : Gsl_multifit_linear_workspace*) : LibC::Double
  fun gsl_multifit_linear_residuals(x : Gsl_matrix*, y : Gsl_vector*, c : Gsl_vector*, r : Gsl_vector*) : LibC::Int
  fun gsl_multifit_linear_gcv_init(y : Gsl_vector*, reg_param : Gsl_vector*, u_ty : Gsl_vector*, delta0 : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_gcv_curve(reg_param : Gsl_vector*, u_ty : Gsl_vector*, delta0 : LibC::Double, g : Gsl_vector*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_gcv_min(reg_param : Gsl_vector*, u_ty : Gsl_vector*, g : Gsl_vector*, delta0 : LibC::Double, lambda : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int
  fun gsl_multifit_linear_gcv_calc(lambda : LibC::Double, u_ty : Gsl_vector*, delta0 : LibC::Double, work : Gsl_multifit_linear_workspace*) : LibC::Double
  fun gsl_multifit_linear_gcv(y : Gsl_vector*, reg_param : Gsl_vector*, g : Gsl_vector*, lambda : LibC::Double*, g_lambda : LibC::Double*, work : Gsl_multifit_linear_workspace*) : LibC::Int

  struct Gsl_multifit_robust_type
    name : LibC::Char*
    wfun : (Gsl_vector*, Gsl_vector* -> LibC::Int)
    psi_deriv : (Gsl_vector*, Gsl_vector* -> LibC::Int)
    tuning_default : LibC::Double
  end

  fun gsl_multifit_robust_alloc(t : Gsl_multifit_robust_type*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_robust_workspace*

  struct Gsl_multifit_robust_workspace
    n : LibC::SizeT
    p : LibC::SizeT
    numit : LibC::SizeT
    maxiter : LibC::SizeT
    type : Gsl_multifit_robust_type*
    tune : LibC::Double
    r : Gsl_vector*
    weights : Gsl_vector*
    c_prev : Gsl_vector*
    resfac : Gsl_vector*
    psi : Gsl_vector*
    dpsi : Gsl_vector*
    qsi : Gsl_matrix*
    d : Gsl_vector*
    workn : Gsl_vector*
    stats : Gsl_multifit_robust_stats
    multifit_p : Gsl_multifit_linear_workspace*
  end

  struct Gsl_multifit_robust_stats
    sigma_ols : LibC::Double
    sigma_mad : LibC::Double
    sigma_rob : LibC::Double
    sigma : LibC::Double
    rsq : LibC::Double
    adj_rsq : LibC::Double
    rmse : LibC::Double
    sse : LibC::Double
    dof : LibC::SizeT
    numit : LibC::SizeT
    weights : Gsl_vector*
    r : Gsl_vector*
  end

  fun gsl_multifit_robust_free(w : Gsl_multifit_robust_workspace*)
  fun gsl_multifit_robust_tune(tune : LibC::Double, w : Gsl_multifit_robust_workspace*) : LibC::Int
  fun gsl_multifit_robust_maxiter(maxiter : LibC::SizeT, w : Gsl_multifit_robust_workspace*) : LibC::Int
  fun gsl_multifit_robust_name(w : Gsl_multifit_robust_workspace*) : LibC::Char*
  fun gsl_multifit_robust_statistics(w : Gsl_multifit_robust_workspace*) : Gsl_multifit_robust_stats
  fun gsl_multifit_robust_weights(r : Gsl_vector*, wts : Gsl_vector*, w : Gsl_multifit_robust_workspace*) : LibC::Int
  fun gsl_multifit_robust(x : Gsl_matrix*, y : Gsl_vector*, c : Gsl_vector*, cov : Gsl_matrix*, w : Gsl_multifit_robust_workspace*) : LibC::Int
  fun gsl_multifit_robust_est(x : Gsl_vector*, c : Gsl_vector*, cov : Gsl_matrix*, y : LibC::Double*, y_err : LibC::Double*) : LibC::Int
  fun gsl_multifit_robust_residuals(x : Gsl_matrix*, y : Gsl_vector*, c : Gsl_vector*, r : Gsl_vector*, w : Gsl_multifit_robust_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_alloc(t : Gsl_multifit_nlinear_type*, params : Gsl_multifit_nlinear_parameters*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_nlinear_workspace*

  struct Gsl_multifit_nlinear_type
    name : LibC::Char*
    alloc : (Gsl_multifit_nlinear_parameters*, LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Gsl_vector*, Gsl_multifit_nlinear_fdf*, Gsl_vector*, Gsl_vector*, Gsl_matrix*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_vector*, Gsl_multifit_nlinear_fdf*, Gsl_vector*, Gsl_vector*, Gsl_matrix*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    rcond : (LibC::Double*, Void* -> LibC::Int)
    avratio : (Void* -> LibC::Double)
    free : (Void* -> Void)
  end

  struct Gsl_multifit_nlinear_parameters
    trs : Gsl_multifit_nlinear_trs*
    scale : Gsl_multifit_nlinear_scale*
    solver : Gsl_multifit_nlinear_solver*
    fdtype : Gsl_multifit_nlinear_fdtype
    factor_up : LibC::Double
    factor_down : LibC::Double
    avmax : LibC::Double
    h_df : LibC::Double
    h_fvv : LibC::Double
  end

  struct Gsl_multifit_nlinear_trs
    name : LibC::Char*
    alloc : (Void*, LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Void* -> LibC::Int)
    preloop : (Void*, Void* -> LibC::Int)
    step : (Void*, LibC::Double, Gsl_vector*, Void* -> LibC::Int)
    preduction : (Void*, Gsl_vector*, LibC::Double*, Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multifit_nlinear_scale
    name : LibC::Char*
    init : (Gsl_matrix*, Gsl_vector* -> LibC::Int)
    update : (Gsl_matrix*, Gsl_vector* -> LibC::Int)
  end

  struct Gsl_multifit_nlinear_solver
    name : LibC::Char*
    alloc : (LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Void* -> LibC::Int)
    presolve : (LibC::Double, Void*, Void* -> LibC::Int)
    solve : (Gsl_vector*, Gsl_vector*, Void*, Void* -> LibC::Int)
    rcond : (LibC::Double*, Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  enum Gsl_multifit_nlinear_fdtype
    GSL_MULTIFIT_NLINEAR_FWDIFF  = 0
    GSL_MULTIFIT_NLINEAR_CTRDIFF = 1
  end

  struct Gsl_multifit_nlinear_fdf
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    df : (Gsl_vector*, Void*, Gsl_matrix* -> LibC::Int)
    fvv : (Gsl_vector*, Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    n : LibC::SizeT
    p : LibC::SizeT
    params : Void*
    nevalf : LibC::SizeT
    nevaldf : LibC::SizeT
    nevalfvv : LibC::SizeT
  end

  struct Gsl_multifit_nlinear_workspace
    type : Gsl_multifit_nlinear_type*
    fdf : Gsl_multifit_nlinear_fdf*
    x : Gsl_vector*
    f : Gsl_vector*
    dx : Gsl_vector*
    g : Gsl_vector*
    j : Gsl_matrix*
    sqrt_wts_work : Gsl_vector*
    sqrt_wts : Gsl_vector*
    niter : LibC::SizeT
    params : Gsl_multifit_nlinear_parameters
    state : Void*
  end

  fun gsl_multifit_nlinear_free(w : Gsl_multifit_nlinear_workspace*)
  fun gsl_multifit_nlinear_default_parameters : Gsl_multifit_nlinear_parameters
  fun gsl_multifit_nlinear_init(x : Gsl_vector*, fdf : Gsl_multifit_nlinear_fdf*, w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_winit(x : Gsl_vector*, wts : Gsl_vector*, fdf : Gsl_multifit_nlinear_fdf*, w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_iterate(w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_avratio(w : Gsl_multifit_nlinear_workspace*) : LibC::Double
  fun gsl_multifit_nlinear_driver(maxiter : LibC::SizeT, xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, callback : (LibC::SizeT, Void*, Gsl_multifit_nlinear_workspace* -> Void), callback_params : Void*, info : LibC::Int*, w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_jac(w : Gsl_multifit_nlinear_workspace*) : Gsl_matrix*
  fun gsl_multifit_nlinear_name(w : Gsl_multifit_nlinear_workspace*) : LibC::Char*
  fun gsl_multifit_nlinear_position(w : Gsl_multifit_nlinear_workspace*) : Gsl_vector*
  fun gsl_multifit_nlinear_residual(w : Gsl_multifit_nlinear_workspace*) : Gsl_vector*
  fun gsl_multifit_nlinear_niter(w : Gsl_multifit_nlinear_workspace*) : LibC::SizeT
  fun gsl_multifit_nlinear_rcond(rcond : LibC::Double*, w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_trs_name(w : Gsl_multifit_nlinear_workspace*) : LibC::Char*
  fun gsl_multifit_nlinear_eval_f(fdf : Gsl_multifit_nlinear_fdf*, x : Gsl_vector*, swts : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_multifit_nlinear_eval_df(x : Gsl_vector*, f : Gsl_vector*, swts : Gsl_vector*, h : LibC::Double, fdtype : Gsl_multifit_nlinear_fdtype, fdf : Gsl_multifit_nlinear_fdf*, df : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_multifit_nlinear_eval_fvv(h : LibC::Double, x : Gsl_vector*, v : Gsl_vector*, f : Gsl_vector*, j : Gsl_matrix*, swts : Gsl_vector*, fdf : Gsl_multifit_nlinear_fdf*, yvv : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_multifit_nlinear_covar(j : Gsl_matrix*, epsrel : LibC::Double, covar : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_nlinear_test(xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, info : LibC::Int*, w : Gsl_multifit_nlinear_workspace*) : LibC::Int
  fun gsl_multifit_nlinear_df(h : LibC::Double, fdtype : Gsl_multifit_nlinear_fdtype, x : Gsl_vector*, wts : Gsl_vector*, fdf : Gsl_multifit_nlinear_fdf*, f : Gsl_vector*, j : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_multifit_nlinear_fdfvv(h : LibC::Double, x : Gsl_vector*, v : Gsl_vector*, f : Gsl_vector*, j : Gsl_matrix*, swts : Gsl_vector*, fdf : Gsl_multifit_nlinear_fdf*, fvv : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_multifit_gradient(j : Gsl_matrix*, f : Gsl_vector*, g : Gsl_vector*) : LibC::Int
  fun gsl_multifit_covar(j : Gsl_matrix*, epsrel : LibC::Double, covar : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_covar_QRPT(r : Gsl_matrix*, perm : Gsl_permutation*, epsrel : LibC::Double, covar : Gsl_matrix*) : LibC::Int

  struct Gsl_multifit_function
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    n : LibC::SizeT
    p : LibC::SizeT
    params : Void*
  end

  fun gsl_multifit_fsolver_alloc(t : Gsl_multifit_fsolver_type*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_fsolver*

  struct Gsl_multifit_fsolver_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_multifit_function*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_multifit_function*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multifit_fsolver
    type : Gsl_multifit_fsolver_type*
    function : Gsl_multifit_function*
    x : Gsl_vector*
    f : Gsl_vector*
    dx : Gsl_vector*
    state : Void*
  end

  fun gsl_multifit_fsolver_free(s : Gsl_multifit_fsolver*)
  fun gsl_multifit_fsolver_set(s : Gsl_multifit_fsolver*, f : Gsl_multifit_function*, x : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fsolver_iterate(s : Gsl_multifit_fsolver*) : LibC::Int
  fun gsl_multifit_fsolver_driver(s : Gsl_multifit_fsolver*, maxiter : LibC::SizeT, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_multifit_fsolver_name(s : Gsl_multifit_fsolver*) : LibC::Char*
  fun gsl_multifit_fsolver_position(s : Gsl_multifit_fsolver*) : Gsl_vector*

  struct Gsl_multifit_function_fdf
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    df : (Gsl_vector*, Void*, Gsl_matrix* -> LibC::Int)
    fdf : (Gsl_vector*, Void*, Gsl_vector*, Gsl_matrix* -> LibC::Int)
    n : LibC::SizeT
    p : LibC::SizeT
    params : Void*
    nevalf : LibC::SizeT
    nevaldf : LibC::SizeT
  end

  fun gsl_multifit_fdfsolver_alloc(t : Gsl_multifit_fdfsolver_type*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_fdfsolver*

  struct Gsl_multifit_fdfsolver_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_vector*, Gsl_multifit_function_fdf*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_vector*, Gsl_multifit_function_fdf*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    gradient : (Void*, Gsl_vector* -> LibC::Int)
    jac : (Void*, Gsl_matrix* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multifit_fdfsolver
    type : Gsl_multifit_fdfsolver_type*
    fdf : Gsl_multifit_function_fdf*
    x : Gsl_vector*
    f : Gsl_vector*
    dx : Gsl_vector*
    g : Gsl_vector*
    sqrt_wts : Gsl_vector*
    niter : LibC::SizeT
    state : Void*
  end

  fun gsl_multifit_fdfsolver_set(s : Gsl_multifit_fdfsolver*, fdf : Gsl_multifit_function_fdf*, x : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfsolver_wset(s : Gsl_multifit_fdfsolver*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, wts : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfsolver_iterate(s : Gsl_multifit_fdfsolver*) : LibC::Int
  fun gsl_multifit_fdfsolver_driver(s : Gsl_multifit_fdfsolver*, maxiter : LibC::SizeT, xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, info : LibC::Int*) : LibC::Int
  fun gsl_multifit_fdfsolver_jac(s : Gsl_multifit_fdfsolver*, j : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_fdfsolver_free(s : Gsl_multifit_fdfsolver*)
  fun gsl_multifit_fdfsolver_name(s : Gsl_multifit_fdfsolver*) : LibC::Char*
  fun gsl_multifit_fdfsolver_position(s : Gsl_multifit_fdfsolver*) : Gsl_vector*
  fun gsl_multifit_fdfsolver_residual(s : Gsl_multifit_fdfsolver*) : Gsl_vector*
  fun gsl_multifit_fdfsolver_niter(s : Gsl_multifit_fdfsolver*) : LibC::SizeT
  fun gsl_multifit_eval_wf(fdf : Gsl_multifit_function_fdf*, x : Gsl_vector*, wts : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_multifit_eval_wdf(fdf : Gsl_multifit_function_fdf*, x : Gsl_vector*, wts : Gsl_vector*, dy : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_fdfsolver_test(s : Gsl_multifit_fdfsolver*, xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, info : LibC::Int*) : LibC::Int
  fun gsl_multifit_test_delta(dx : Gsl_vector*, x : Gsl_vector*, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_multifit_test_gradient(g : Gsl_vector*, epsabs : LibC::Double) : LibC::Int
  fun gsl_multifit_fdfsolver_dif_df(x : Gsl_vector*, wts : Gsl_vector*, fdf : Gsl_multifit_function_fdf*, f : Gsl_vector*, j : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_fdfsolver_dif_fdf(x : Gsl_vector*, fdf : Gsl_multifit_function_fdf*, f : Gsl_vector*, j : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_fdfridge_alloc(t : Gsl_multifit_fdfsolver_type*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multifit_fdfridge*

  struct Gsl_multifit_fdfridge
    n : LibC::SizeT
    p : LibC::SizeT
    lambda : LibC::Double
    l_diag : Gsl_vector*
    l : Gsl_matrix*
    f : Gsl_vector*
    wts : Gsl_vector*
    s : Gsl_multifit_fdfsolver*
    fdf : Gsl_multifit_function_fdf*
    fdftik : Gsl_multifit_function_fdf
  end

  fun gsl_multifit_fdfridge_free(work : Gsl_multifit_fdfridge*)
  fun gsl_multifit_fdfridge_name(w : Gsl_multifit_fdfridge*) : LibC::Char*
  fun gsl_multifit_fdfridge_position(w : Gsl_multifit_fdfridge*) : Gsl_vector*
  fun gsl_multifit_fdfridge_residual(w : Gsl_multifit_fdfridge*) : Gsl_vector*
  fun gsl_multifit_fdfridge_niter(w : Gsl_multifit_fdfridge*) : LibC::SizeT
  fun gsl_multifit_fdfridge_set(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, lambda : LibC::Double) : LibC::Int
  fun gsl_multifit_fdfridge_wset(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, lambda : LibC::Double, wts : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfridge_set2(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, lambda : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfridge_wset2(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, lambda : Gsl_vector*, wts : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfridge_set3(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, l : Gsl_matrix*) : LibC::Int
  fun gsl_multifit_fdfridge_wset3(w : Gsl_multifit_fdfridge*, f : Gsl_multifit_function_fdf*, x : Gsl_vector*, l : Gsl_matrix*, wts : Gsl_vector*) : LibC::Int
  fun gsl_multifit_fdfridge_iterate(w : Gsl_multifit_fdfridge*) : LibC::Int
  fun gsl_multifit_fdfridge_driver(w : Gsl_multifit_fdfridge*, maxiter : LibC::SizeT, xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, info : LibC::Int*) : LibC::Int

  struct Gsl_multilarge_linear_type
    name : LibC::Char*
    alloc : (LibC::SizeT -> Void*)
    reset : (Void* -> LibC::Int)
    accumulate : (Gsl_matrix*, Gsl_vector*, Void* -> LibC::Int)
    solve : (LibC::Double, Gsl_vector*, LibC::Double*, LibC::Double*, Void* -> LibC::Int)
    rcond : (LibC::Double*, Void* -> LibC::Int)
    lcurve : (Gsl_vector*, Gsl_vector*, Gsl_vector*, Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  fun gsl_multilarge_linear_alloc(t : Gsl_multilarge_linear_type*, p : LibC::SizeT) : Gsl_multilarge_linear_workspace*

  struct Gsl_multilarge_linear_workspace
    type : Gsl_multilarge_linear_type*
    state : Void*
    p : LibC::SizeT
  end

  fun gsl_multilarge_linear_free(w : Gsl_multilarge_linear_workspace*)
  fun gsl_multilarge_linear_name(w : Gsl_multilarge_linear_workspace*) : LibC::Char*
  fun gsl_multilarge_linear_reset(w : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_accumulate(x : Gsl_matrix*, y : Gsl_vector*, w : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_solve(lambda : LibC::Double, c : Gsl_vector*, rnorm : LibC::Double*, snorm : LibC::Double*, w : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_rcond(rcond : LibC::Double*, w : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_lcurve(reg_param : Gsl_vector*, rho : Gsl_vector*, eta : Gsl_vector*, w : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_wstdform1(l : Gsl_vector*, x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_stdform1(l : Gsl_vector*, x : Gsl_matrix*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_L_decomp(l : Gsl_matrix*, tau : Gsl_vector*) : LibC::Int
  fun gsl_multilarge_linear_wstdform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, w : Gsl_vector*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_stdform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, x : Gsl_matrix*, y : Gsl_vector*, xs : Gsl_matrix*, ys : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_genform1(l : Gsl_vector*, cs : Gsl_vector*, c : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_linear_genform2(lqr : Gsl_matrix*, ltau : Gsl_vector*, cs : Gsl_vector*, c : Gsl_vector*, work : Gsl_multilarge_linear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_alloc(t : Gsl_multilarge_nlinear_type*, params : Gsl_multilarge_nlinear_parameters*, n : LibC::SizeT, p : LibC::SizeT) : Gsl_multilarge_nlinear_workspace*

  struct Gsl_multilarge_nlinear_type
    name : LibC::Char*
    alloc : (Gsl_multilarge_nlinear_parameters*, LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Gsl_vector*, Gsl_multilarge_nlinear_fdf*, Gsl_vector*, Gsl_vector*, Gsl_vector*, Gsl_matrix* -> LibC::Int)
    iterate : (Void*, Gsl_vector*, Gsl_multilarge_nlinear_fdf*, Gsl_vector*, Gsl_vector*, Gsl_vector*, Gsl_matrix*, Gsl_vector* -> LibC::Int)
    rcond : (LibC::Double*, Gsl_matrix*, Void* -> LibC::Int)
    covar : (Gsl_matrix*, Gsl_matrix*, Void* -> LibC::Int)
    avratio : (Void* -> LibC::Double)
    free : (Void* -> Void)
  end

  struct Gsl_multilarge_nlinear_parameters
    trs : Gsl_multilarge_nlinear_trs*
    scale : Gsl_multilarge_nlinear_scale*
    solver : Gsl_multilarge_nlinear_solver*
    fdtype : Gsl_multilarge_nlinear_fdtype
    factor_up : LibC::Double
    factor_down : LibC::Double
    avmax : LibC::Double
    h_df : LibC::Double
    h_fvv : LibC::Double
    max_iter : LibC::SizeT
    tol : LibC::Double
  end

  struct Gsl_multilarge_nlinear_trs
    name : LibC::Char*
    alloc : (Void*, LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Void* -> LibC::Int)
    preloop : (Void*, Void* -> LibC::Int)
    step : (Void*, LibC::Double, Gsl_vector*, Void* -> LibC::Int)
    preduction : (Void*, Gsl_vector*, LibC::Double*, Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multilarge_nlinear_scale
    name : LibC::Char*
    init : (Gsl_matrix*, Gsl_vector* -> LibC::Int)
    update : (Gsl_matrix*, Gsl_vector* -> LibC::Int)
  end

  struct Gsl_multilarge_nlinear_solver
    name : LibC::Char*
    alloc : (LibC::SizeT, LibC::SizeT -> Void*)
    init : (Void*, Void* -> LibC::Int)
    presolve : (LibC::Double, Void*, Void* -> LibC::Int)
    solve : (Gsl_vector*, Gsl_vector*, Void*, Void* -> LibC::Int)
    rcond : (LibC::Double*, Gsl_matrix*, Void* -> LibC::Int)
    covar : (Gsl_matrix*, Gsl_matrix*, Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  enum Gsl_multilarge_nlinear_fdtype
    GSL_MULTILARGE_NLINEAR_FWDIFF  = 0
    GSL_MULTILARGE_NLINEAR_CTRDIFF = 1
  end

  struct Gsl_multilarge_nlinear_fdf
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    df : (CBLAS_TRANSPOSE_t, Gsl_vector*, Gsl_vector*, Void*, Gsl_vector*, Gsl_matrix* -> LibC::Int)
    fvv : (Gsl_vector*, Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    n : LibC::SizeT
    p : LibC::SizeT
    params : Void*
    nevalf : LibC::SizeT
    nevaldfu : LibC::SizeT
    nevaldf2 : LibC::SizeT
    nevalfvv : LibC::SizeT
  end

  struct Gsl_multilarge_nlinear_workspace
    type : Gsl_multilarge_nlinear_type*
    fdf : Gsl_multilarge_nlinear_fdf*
    x : Gsl_vector*
    f : Gsl_vector*
    dx : Gsl_vector*
    g : Gsl_vector*
    jtj : Gsl_matrix*
    sqrt_wts_work : Gsl_vector*
    sqrt_wts : Gsl_vector*
    n : LibC::SizeT
    p : LibC::SizeT
    niter : LibC::SizeT
    params : Gsl_multilarge_nlinear_parameters
    state : Void*
  end

  fun gsl_multilarge_nlinear_free(w : Gsl_multilarge_nlinear_workspace*)
  fun gsl_multilarge_nlinear_default_parameters : Gsl_multilarge_nlinear_parameters
  fun gsl_multilarge_nlinear_init(x : Gsl_vector*, fdf : Gsl_multilarge_nlinear_fdf*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_winit(x : Gsl_vector*, wts : Gsl_vector*, fdf : Gsl_multilarge_nlinear_fdf*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_iterate(w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_avratio(w : Gsl_multilarge_nlinear_workspace*) : LibC::Double
  fun gsl_multilarge_nlinear_rcond(rcond : LibC::Double*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_covar(covar : Gsl_matrix*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_driver(maxiter : LibC::SizeT, xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, callback : (LibC::SizeT, Void*, Gsl_multilarge_nlinear_workspace* -> Void), callback_params : Void*, info : LibC::Int*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_name(w : Gsl_multilarge_nlinear_workspace*) : LibC::Char*
  fun gsl_multilarge_nlinear_position(w : Gsl_multilarge_nlinear_workspace*) : Gsl_vector*
  fun gsl_multilarge_nlinear_residual(w : Gsl_multilarge_nlinear_workspace*) : Gsl_vector*
  fun gsl_multilarge_nlinear_step(w : Gsl_multilarge_nlinear_workspace*) : Gsl_vector*
  fun gsl_multilarge_nlinear_niter(w : Gsl_multilarge_nlinear_workspace*) : LibC::SizeT
  fun gsl_multilarge_nlinear_trs_name(w : Gsl_multilarge_nlinear_workspace*) : LibC::Char*
  fun gsl_multilarge_nlinear_eval_f(fdf : Gsl_multilarge_nlinear_fdf*, x : Gsl_vector*, swts : Gsl_vector*, y : Gsl_vector*) : LibC::Int
  fun gsl_multilarge_nlinear_eval_df(trans_j : CBLAS_TRANSPOSE_t, x : Gsl_vector*, f : Gsl_vector*, u : Gsl_vector*, swts : Gsl_vector*, h : LibC::Double, fdtype : Gsl_multilarge_nlinear_fdtype, fdf : Gsl_multilarge_nlinear_fdf*, v : Gsl_vector*, jtj : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_multilarge_nlinear_eval_fvv(h : LibC::Double, x : Gsl_vector*, v : Gsl_vector*, f : Gsl_vector*, swts : Gsl_vector*, fdf : Gsl_multilarge_nlinear_fdf*, yvv : Gsl_vector*, work : Gsl_vector*) : LibC::Int
  fun gsl_multilarge_nlinear_test(xtol : LibC::Double, gtol : LibC::Double, ftol : LibC::Double, info : LibC::Int*, w : Gsl_multilarge_nlinear_workspace*) : LibC::Int
  fun gsl_multilarge_nlinear_df(h : LibC::Double, fdtype : Gsl_multilarge_nlinear_fdtype, x : Gsl_vector*, wts : Gsl_vector*, fdf : Gsl_multilarge_nlinear_fdf*, f : Gsl_vector*, j : Gsl_matrix*, work : Gsl_vector*) : LibC::Int
  fun gsl_multilarge_nlinear_fdfvv(h : LibC::Double, x : Gsl_vector*, v : Gsl_vector*, f : Gsl_vector*, j : Gsl_matrix*, swts : Gsl_vector*, fdf : Gsl_multilarge_nlinear_fdf*, fvv : Gsl_vector*, work : Gsl_vector*) : LibC::Int

  struct Gsl_multimin_function
    f : (Gsl_vector*, Void* -> LibC::Double)
    n : LibC::SizeT
    params : Void*
  end

  struct Gsl_multimin_function_fdf
    f : (Gsl_vector*, Void* -> LibC::Double)
    df : (Gsl_vector*, Void*, Gsl_vector* -> Void)
    fdf : (Gsl_vector*, Void*, LibC::Double*, Gsl_vector* -> Void)
    n : LibC::SizeT
    params : Void*
  end

  fun gsl_multimin_diff(f : Gsl_multimin_function*, x : Gsl_vector*, g : Gsl_vector*) : LibC::Int
  fun gsl_multimin_fminimizer_alloc(t : Gsl_multimin_fminimizer_type*, n : LibC::SizeT) : Gsl_multimin_fminimizer*

  struct Gsl_multimin_fminimizer_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_multimin_function*, Gsl_vector*, LibC::Double*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_multimin_function*, Gsl_vector*, LibC::Double*, LibC::Double* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multimin_fminimizer
    type : Gsl_multimin_fminimizer_type*
    f : Gsl_multimin_function*
    fval : LibC::Double
    x : Gsl_vector*
    size : LibC::Double
    state : Void*
  end

  fun gsl_multimin_fminimizer_set(s : Gsl_multimin_fminimizer*, f : Gsl_multimin_function*, x : Gsl_vector*, step_size : Gsl_vector*) : LibC::Int
  fun gsl_multimin_fminimizer_free(s : Gsl_multimin_fminimizer*)
  fun gsl_multimin_fminimizer_name(s : Gsl_multimin_fminimizer*) : LibC::Char*
  fun gsl_multimin_fminimizer_iterate(s : Gsl_multimin_fminimizer*) : LibC::Int
  fun gsl_multimin_fminimizer_x(s : Gsl_multimin_fminimizer*) : Gsl_vector*
  fun gsl_multimin_fminimizer_minimum(s : Gsl_multimin_fminimizer*) : LibC::Double
  fun gsl_multimin_fminimizer_size(s : Gsl_multimin_fminimizer*) : LibC::Double
  fun gsl_multimin_test_gradient(g : Gsl_vector*, epsabs : LibC::Double) : LibC::Int
  fun gsl_multimin_test_size(size : LibC::Double, epsabs : LibC::Double) : LibC::Int
  fun gsl_multimin_fdfminimizer_alloc(t : Gsl_multimin_fdfminimizer_type*, n : LibC::SizeT) : Gsl_multimin_fdfminimizer*

  struct Gsl_multimin_fdfminimizer_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_multimin_function_fdf*, Gsl_vector*, LibC::Double*, Gsl_vector*, LibC::Double, LibC::Double -> LibC::Int)
    iterate : (Void*, Gsl_multimin_function_fdf*, Gsl_vector*, LibC::Double*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    restart : (Void* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multimin_fdfminimizer
    type : Gsl_multimin_fdfminimizer_type*
    fdf : Gsl_multimin_function_fdf*
    f : LibC::Double
    x : Gsl_vector*
    gradient : Gsl_vector*
    dx : Gsl_vector*
    state : Void*
  end

  fun gsl_multimin_fdfminimizer_set(s : Gsl_multimin_fdfminimizer*, fdf : Gsl_multimin_function_fdf*, x : Gsl_vector*, step_size : LibC::Double, tol : LibC::Double) : LibC::Int
  fun gsl_multimin_fdfminimizer_free(s : Gsl_multimin_fdfminimizer*)
  fun gsl_multimin_fdfminimizer_name(s : Gsl_multimin_fdfminimizer*) : LibC::Char*
  fun gsl_multimin_fdfminimizer_iterate(s : Gsl_multimin_fdfminimizer*) : LibC::Int
  fun gsl_multimin_fdfminimizer_restart(s : Gsl_multimin_fdfminimizer*) : LibC::Int
  fun gsl_multimin_fdfminimizer_x(s : Gsl_multimin_fdfminimizer*) : Gsl_vector*
  fun gsl_multimin_fdfminimizer_dx(s : Gsl_multimin_fdfminimizer*) : Gsl_vector*
  fun gsl_multimin_fdfminimizer_gradient(s : Gsl_multimin_fdfminimizer*) : Gsl_vector*
  fun gsl_multimin_fdfminimizer_minimum(s : Gsl_multimin_fdfminimizer*) : LibC::Double

  struct Gsl_multiroot_function
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    n : LibC::SizeT
    params : Void*
  end

  fun gsl_multiroot_fdjacobian(f : Gsl_multiroot_function*, x : Gsl_vector*, f : Gsl_vector*, epsrel : LibC::Double, jacobian : Gsl_matrix*) : LibC::Int
  fun gsl_multiroot_fsolver_alloc(t : Gsl_multiroot_fsolver_type*, n : LibC::SizeT) : Gsl_multiroot_fsolver*

  struct Gsl_multiroot_fsolver_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_multiroot_function*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_multiroot_function*, Gsl_vector*, Gsl_vector*, Gsl_vector* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multiroot_fsolver
    type : Gsl_multiroot_fsolver_type*
    function : Gsl_multiroot_function*
    x : Gsl_vector*
    f : Gsl_vector*
    dx : Gsl_vector*
    state : Void*
  end

  fun gsl_multiroot_fsolver_free(s : Gsl_multiroot_fsolver*)
  fun gsl_multiroot_fsolver_set(s : Gsl_multiroot_fsolver*, f : Gsl_multiroot_function*, x : Gsl_vector*) : LibC::Int
  fun gsl_multiroot_fsolver_iterate(s : Gsl_multiroot_fsolver*) : LibC::Int
  fun gsl_multiroot_fsolver_name(s : Gsl_multiroot_fsolver*) : LibC::Char*
  fun gsl_multiroot_fsolver_root(s : Gsl_multiroot_fsolver*) : Gsl_vector*
  fun gsl_multiroot_fsolver_dx(s : Gsl_multiroot_fsolver*) : Gsl_vector*
  fun gsl_multiroot_fsolver_f(s : Gsl_multiroot_fsolver*) : Gsl_vector*

  struct Gsl_multiroot_function_fdf
    f : (Gsl_vector*, Void*, Gsl_vector* -> LibC::Int)
    df : (Gsl_vector*, Void*, Gsl_matrix* -> LibC::Int)
    fdf : (Gsl_vector*, Void*, Gsl_vector*, Gsl_matrix* -> LibC::Int)
    n : LibC::SizeT
    params : Void*
  end

  fun gsl_multiroot_fdfsolver_alloc(t : Gsl_multiroot_fdf_solver_type*, n : LibC::SizeT) : Gsl_multiroot_fdf_solver*

  struct Gsl_multiroot_fdf_solver_type
    name : LibC::Char*
    size : LibC::SizeT
    alloc : (Void*, LibC::SizeT -> LibC::Int)
    set : (Void*, Gsl_multiroot_function_fdf*, Gsl_vector*, Gsl_vector*, Gsl_matrix*, Gsl_vector* -> LibC::Int)
    iterate : (Void*, Gsl_multiroot_function_fdf*, Gsl_vector*, Gsl_vector*, Gsl_matrix*, Gsl_vector* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_multiroot_fdf_solver
    type : Gsl_multiroot_fdf_solver_type*
    fdf : Gsl_multiroot_function_fdf*
    x : Gsl_vector*
    f : Gsl_vector*
    j : Gsl_matrix*
    dx : Gsl_vector*
    state : Void*
  end

  fun gsl_multiroot_fdfsolver_set(s : Gsl_multiroot_fdf_solver*, fdf : Gsl_multiroot_function_fdf*, x : Gsl_vector*) : LibC::Int
  fun gsl_multiroot_fdfsolver_iterate(s : Gsl_multiroot_fdf_solver*) : LibC::Int
  fun gsl_multiroot_fdfsolver_free(s : Gsl_multiroot_fdf_solver*)
  fun gsl_multiroot_fdfsolver_name(s : Gsl_multiroot_fdf_solver*) : LibC::Char*
  fun gsl_multiroot_fdfsolver_root(s : Gsl_multiroot_fdf_solver*) : Gsl_vector*
  fun gsl_multiroot_fdfsolver_dx(s : Gsl_multiroot_fdf_solver*) : Gsl_vector*
  fun gsl_multiroot_fdfsolver_f(s : Gsl_multiroot_fdf_solver*) : Gsl_vector*
  fun gsl_multiroot_test_delta(dx : Gsl_vector*, x : Gsl_vector*, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_multiroot_test_residual(f : Gsl_vector*, epsabs : LibC::Double) : LibC::Int

  struct Gsl_multiset
    n : LibC::SizeT
    k : LibC::SizeT
    data : LibC::SizeT*
  end

  fun gsl_multiset_alloc(n : LibC::SizeT, k : LibC::SizeT) : Gsl_multiset*
  fun gsl_multiset_calloc(n : LibC::SizeT, k : LibC::SizeT) : Gsl_multiset*
  fun gsl_multiset_init_first(c : Gsl_multiset*)
  fun gsl_multiset_init_last(c : Gsl_multiset*)
  fun gsl_multiset_free(c : Gsl_multiset*)
  fun gsl_multiset_memcpy(dest : Gsl_multiset*, src : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_fread(stream : File*, c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_fwrite(stream : File*, c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_fscanf(stream : File*, c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_fprintf(stream : File*, c : Gsl_multiset*, format : LibC::Char*) : LibC::Int
  fun gsl_multiset_n(c : Gsl_multiset*) : LibC::SizeT
  fun gsl_multiset_k(c : Gsl_multiset*) : LibC::SizeT
  fun gsl_multiset_data(c : Gsl_multiset*) : LibC::SizeT*
  fun gsl_multiset_valid(c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_next(c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_prev(c : Gsl_multiset*) : LibC::Int
  fun gsl_multiset_get(c : Gsl_multiset*, i : LibC::SizeT) : LibC::SizeT
  fun gsl_ntuple_open(filename : LibC::Char*, ntuple_data : Void*, size : LibC::SizeT) : Gsl_ntuple*

  struct Gsl_ntuple
    file : File*
    ntuple_data : Void*
    size : LibC::SizeT
  end

  fun gsl_ntuple_create(filename : LibC::Char*, ntuple_data : Void*, size : LibC::SizeT) : Gsl_ntuple*
  fun gsl_ntuple_write(ntuple : Gsl_ntuple*) : LibC::Int
  fun gsl_ntuple_read(ntuple : Gsl_ntuple*) : LibC::Int
  fun gsl_ntuple_bookdata(ntuple : Gsl_ntuple*) : LibC::Int
  fun gsl_ntuple_project(h : Gsl_histogram*, ntuple : Gsl_ntuple*, value_func : Gsl_ntuple_value_fn*, select_func : Gsl_ntuple_select_fn*) : LibC::Int

  struct Gsl_ntuple_value_fn
    function : (Void*, Void* -> LibC::Double)
    params : Void*
  end

  struct Gsl_ntuple_select_fn
    function : (Void*, Void* -> LibC::Int)
    params : Void*
  end

  fun gsl_ntuple_close(ntuple : Gsl_ntuple*) : LibC::Int

  struct Gsl_odeiv2_step
    type : Gsl_odeiv2_step_type*
    dimension : LibC::SizeT
    state : Void*
  end

  struct Gsl_odeiv2_step_type
    name : LibC::Char*
    can_use_dydt_in : LibC::Int
    gives_exact_dydt_out : LibC::Int
    alloc : (LibC::SizeT -> Void*)
    apply : (Void*, LibC::SizeT, LibC::Double, LibC::Double, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double*, Gsl_odeiv2_system* -> LibC::Int)
    set_driver : (Void*, Gsl_odeiv2_driver* -> LibC::Int)
    reset : (Void*, LibC::SizeT -> LibC::Int)
    order : (Void* -> LibC::UInt)
    free : (Void* -> Void)
  end

  struct Gsl_odeiv2_system
    function : (LibC::Double, LibC::Double*, LibC::Double*, Void* -> LibC::Int)
    jacobian : (LibC::Double, LibC::Double*, LibC::Double*, LibC::Double*, Void* -> LibC::Int)
    dimension : LibC::SizeT
    params : Void*
  end

  struct Gsl_odeiv2_driver
    sys : Gsl_odeiv2_system*
    s : Gsl_odeiv2_step*
    c : Gsl_odeiv2_control*
    e : Gsl_odeiv2_evolve*
    h : LibC::Double
    hmin : LibC::Double
    hmax : LibC::Double
    n : LibC::ULong
    nmax : LibC::ULong
  end

  struct Gsl_odeiv2_control
    type : Gsl_odeiv2_control_type*
    state : Void*
  end

  struct Gsl_odeiv2_control_type
    name : LibC::Char*
    alloc : (-> Void*)
    init : (Void*, LibC::Double, LibC::Double, LibC::Double, LibC::Double -> LibC::Int)
    hadjust : (Void*, LibC::SizeT, LibC::UInt, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double* -> LibC::Int)
    errlevel : (Void*, LibC::Double, LibC::Double, LibC::Double, LibC::SizeT, LibC::Double* -> LibC::Int)
    set_driver : (Void*, Gsl_odeiv2_driver* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_odeiv2_evolve
    dimension : LibC::SizeT
    y0 : LibC::Double*
    yerr : LibC::Double*
    dydt_in : LibC::Double*
    dydt_out : LibC::Double*
    last_step : LibC::Double
    count : LibC::ULong
    failed_steps : LibC::ULong
    driver : Gsl_odeiv2_driver*
  end

  fun gsl_odeiv2_step_alloc(t : Gsl_odeiv2_step_type*, dim : LibC::SizeT) : Gsl_odeiv2_step*
  fun gsl_odeiv2_step_reset(s : Gsl_odeiv2_step*) : LibC::Int
  fun gsl_odeiv2_step_free(s : Gsl_odeiv2_step*)
  fun gsl_odeiv2_step_name(s : Gsl_odeiv2_step*) : LibC::Char*
  fun gsl_odeiv2_step_order(s : Gsl_odeiv2_step*) : LibC::UInt
  fun gsl_odeiv2_step_apply(s : Gsl_odeiv2_step*, t : LibC::Double, h : LibC::Double, y : LibC::Double*, yerr : LibC::Double*, dydt_in : LibC::Double*, dydt_out : LibC::Double*, dydt : Gsl_odeiv2_system*) : LibC::Int
  fun gsl_odeiv2_step_set_driver(s : Gsl_odeiv2_step*, d : Gsl_odeiv2_driver*) : LibC::Int
  fun gsl_odeiv2_control_alloc(t : Gsl_odeiv2_control_type*) : Gsl_odeiv2_control*
  fun gsl_odeiv2_control_init(c : Gsl_odeiv2_control*, eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double) : LibC::Int
  fun gsl_odeiv2_control_free(c : Gsl_odeiv2_control*)
  fun gsl_odeiv2_control_hadjust(c : Gsl_odeiv2_control*, s : Gsl_odeiv2_step*, y : LibC::Double*, yerr : LibC::Double*, dydt : LibC::Double*, h : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_control_name(c : Gsl_odeiv2_control*) : LibC::Char*
  fun gsl_odeiv2_control_errlevel(c : Gsl_odeiv2_control*, y : LibC::Double, dydt : LibC::Double, h : LibC::Double, ind : LibC::SizeT, errlev : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_control_set_driver(c : Gsl_odeiv2_control*, d : Gsl_odeiv2_driver*) : LibC::Int
  fun gsl_odeiv2_control_standard_new(eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double) : Gsl_odeiv2_control*
  fun gsl_odeiv2_control_y_new(eps_abs : LibC::Double, eps_rel : LibC::Double) : Gsl_odeiv2_control*
  fun gsl_odeiv2_control_yp_new(eps_abs : LibC::Double, eps_rel : LibC::Double) : Gsl_odeiv2_control*
  fun gsl_odeiv2_control_scaled_new(eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double, scale_abs : LibC::Double*, dim : LibC::SizeT) : Gsl_odeiv2_control*
  fun gsl_odeiv2_evolve_alloc(dim : LibC::SizeT) : Gsl_odeiv2_evolve*
  fun gsl_odeiv2_evolve_apply(e : Gsl_odeiv2_evolve*, con : Gsl_odeiv2_control*, step : Gsl_odeiv2_step*, dydt : Gsl_odeiv2_system*, t : LibC::Double*, t1 : LibC::Double, h : LibC::Double*, y : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_evolve_apply_fixed_step(e : Gsl_odeiv2_evolve*, con : Gsl_odeiv2_control*, step : Gsl_odeiv2_step*, dydt : Gsl_odeiv2_system*, t : LibC::Double*, h0 : LibC::Double, y : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_evolve_reset(e : Gsl_odeiv2_evolve*) : LibC::Int
  fun gsl_odeiv2_evolve_free(e : Gsl_odeiv2_evolve*)
  fun gsl_odeiv2_evolve_set_driver(e : Gsl_odeiv2_evolve*, d : Gsl_odeiv2_driver*) : LibC::Int
  fun gsl_odeiv2_driver_alloc_y_new(sys : Gsl_odeiv2_system*, t : Gsl_odeiv2_step_type*, hstart : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double) : Gsl_odeiv2_driver*
  fun gsl_odeiv2_driver_alloc_yp_new(sys : Gsl_odeiv2_system*, t : Gsl_odeiv2_step_type*, hstart : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double) : Gsl_odeiv2_driver*
  fun gsl_odeiv2_driver_alloc_scaled_new(sys : Gsl_odeiv2_system*, t : Gsl_odeiv2_step_type*, hstart : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double, scale_abs : LibC::Double*) : Gsl_odeiv2_driver*
  fun gsl_odeiv2_driver_alloc_standard_new(sys : Gsl_odeiv2_system*, t : Gsl_odeiv2_step_type*, hstart : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double) : Gsl_odeiv2_driver*
  fun gsl_odeiv2_driver_set_hmin(d : Gsl_odeiv2_driver*, hmin : LibC::Double) : LibC::Int
  fun gsl_odeiv2_driver_set_hmax(d : Gsl_odeiv2_driver*, hmax : LibC::Double) : LibC::Int
  fun gsl_odeiv2_driver_set_nmax(d : Gsl_odeiv2_driver*, nmax : LibC::ULong) : LibC::Int
  fun gsl_odeiv2_driver_apply(d : Gsl_odeiv2_driver*, t : LibC::Double*, t1 : LibC::Double, y : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_driver_apply_fixed_step(d : Gsl_odeiv2_driver*, t : LibC::Double*, h : LibC::Double, n : LibC::ULong, y : LibC::Double*) : LibC::Int
  fun gsl_odeiv2_driver_reset(d : Gsl_odeiv2_driver*) : LibC::Int
  fun gsl_odeiv2_driver_reset_hstart(d : Gsl_odeiv2_driver*, hstart : LibC::Double) : LibC::Int
  fun gsl_odeiv2_driver_free(state : Gsl_odeiv2_driver*)

  struct Gsl_odeiv_step_type
    name : LibC::Char*
    can_use_dydt_in : LibC::Int
    gives_exact_dydt_out : LibC::Int
    alloc : (LibC::SizeT -> Void*)
    apply : (Void*, LibC::SizeT, LibC::Double, LibC::Double, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double*, Gsl_odeiv_system* -> LibC::Int)
    reset : (Void*, LibC::SizeT -> LibC::Int)
    order : (Void* -> LibC::UInt)
    free : (Void* -> Void)
  end

  struct Gsl_odeiv_system
    function : (LibC::Double, LibC::Double*, LibC::Double*, Void* -> LibC::Int)
    jacobian : (LibC::Double, LibC::Double*, LibC::Double*, LibC::Double*, Void* -> LibC::Int)
    dimension : LibC::SizeT
    params : Void*
  end

  fun gsl_odeiv_step_alloc(t : Gsl_odeiv_step_type*, dim : LibC::SizeT) : Gsl_odeiv_step*

  struct Gsl_odeiv_step
    type : Gsl_odeiv_step_type*
    dimension : LibC::SizeT
    state : Void*
  end

  fun gsl_odeiv_step_reset(s : Gsl_odeiv_step*) : LibC::Int
  fun gsl_odeiv_step_free(s : Gsl_odeiv_step*)
  fun gsl_odeiv_step_name(s : Gsl_odeiv_step*) : LibC::Char*
  fun gsl_odeiv_step_order(s : Gsl_odeiv_step*) : LibC::UInt
  fun gsl_odeiv_step_apply(s : Gsl_odeiv_step*, t : LibC::Double, h : LibC::Double, y : LibC::Double*, yerr : LibC::Double*, dydt_in : LibC::Double*, dydt_out : LibC::Double*, dydt : Gsl_odeiv_system*) : LibC::Int
  fun gsl_odeiv_control_alloc(t : Gsl_odeiv_control_type*) : Gsl_odeiv_control*

  struct Gsl_odeiv_control_type
    name : LibC::Char*
    alloc : (-> Void*)
    init : (Void*, LibC::Double, LibC::Double, LibC::Double, LibC::Double -> LibC::Int)
    hadjust : (Void*, LibC::SizeT, LibC::UInt, LibC::Double*, LibC::Double*, LibC::Double*, LibC::Double* -> LibC::Int)
    free : (Void* -> Void)
  end

  struct Gsl_odeiv_control
    type : Gsl_odeiv_control_type*
    state : Void*
  end

  fun gsl_odeiv_control_init(c : Gsl_odeiv_control*, eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double) : LibC::Int
  fun gsl_odeiv_control_free(c : Gsl_odeiv_control*)
  fun gsl_odeiv_control_hadjust(c : Gsl_odeiv_control*, s : Gsl_odeiv_step*, y : LibC::Double*, yerr : LibC::Double*, dydt : LibC::Double*, h : LibC::Double*) : LibC::Int
  fun gsl_odeiv_control_name(c : Gsl_odeiv_control*) : LibC::Char*
  fun gsl_odeiv_control_standard_new(eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double) : Gsl_odeiv_control*
  fun gsl_odeiv_control_y_new(eps_abs : LibC::Double, eps_rel : LibC::Double) : Gsl_odeiv_control*
  fun gsl_odeiv_control_yp_new(eps_abs : LibC::Double, eps_rel : LibC::Double) : Gsl_odeiv_control*
  fun gsl_odeiv_control_scaled_new(eps_abs : LibC::Double, eps_rel : LibC::Double, a_y : LibC::Double, a_dydt : LibC::Double, scale_abs : LibC::Double*, dim : LibC::SizeT) : Gsl_odeiv_control*
  fun gsl_odeiv_evolve_alloc(dim : LibC::SizeT) : Gsl_odeiv_evolve*

  struct Gsl_odeiv_evolve
    dimension : LibC::SizeT
    y0 : LibC::Double*
    yerr : LibC::Double*
    dydt_in : LibC::Double*
    dydt_out : LibC::Double*
    last_step : LibC::Double
    count : LibC::ULong
    failed_steps : LibC::ULong
  end

  fun gsl_odeiv_evolve_apply(e : Gsl_odeiv_evolve*, con : Gsl_odeiv_control*, step : Gsl_odeiv_step*, dydt : Gsl_odeiv_system*, t : LibC::Double*, t1 : LibC::Double, h : LibC::Double*, y : LibC::Double*) : LibC::Int
  fun gsl_odeiv_evolve_reset(e : Gsl_odeiv_evolve*) : LibC::Int
  fun gsl_odeiv_evolve_free(e : Gsl_odeiv_evolve*)
  fun gsl_permute_char(p : LibC::SizeT*, data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_char_inverse(p : LibC::SizeT*, data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_complex(p : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_complex_inverse(p : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_complex_float(p : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_complex_float_inverse(p : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute(p : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_inverse(p : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_float(p : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_float_inverse(p : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_permute_complex_long_double(p : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_permute_complex_long_double_inverse(p : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_permute_long_double(p : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_permute_long_double_inverse(p : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_ulong(p : LibC::SizeT*, data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_ulong_inverse(p : LibC::SizeT*, data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_long(p : LibC::SizeT*, data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_long_inverse(p : LibC::SizeT*, data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_uint(p : LibC::SizeT*, data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_uint_inverse(p : LibC::SizeT*, data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_int(p : LibC::SizeT*, data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_int_inverse(p : LibC::SizeT*, data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_ushort(p : LibC::SizeT*, data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_ushort_inverse(p : LibC::SizeT*, data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_short(p : LibC::SizeT*, data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_short_inverse(p : LibC::SizeT*, data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_uchar(p : LibC::SizeT*, data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_uchar_inverse(p : LibC::SizeT*, data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_permute_matrix_char(p : Gsl_permutation*, a : Gsl_matrix_char*) : LibC::Int
  fun gsl_permute_matrix_complex(p : Gsl_permutation*, a : Gsl_matrix_complex*) : LibC::Int
  fun gsl_permute_matrix_complex_float(p : Gsl_permutation*, a : Gsl_matrix_complex_float*) : LibC::Int
  fun gsl_permute_matrix(p : Gsl_permutation*, a : Gsl_matrix*) : LibC::Int
  fun gsl_permute_matrix_float(p : Gsl_permutation*, a : Gsl_matrix_float*) : LibC::Int
  # fun gsl_permute_matrix_complex_long_double(p : Gsl_permutation*, a : Gsl_matrix_complex_long_double*) : LibC::Int
  # fun gsl_permute_matrix_long_double(p : Gsl_permutation*, a : Gsl_matrix_long_double*) : LibC::Int
  fun gsl_permute_matrix_ulong(p : Gsl_permutation*, a : Gsl_matrix_ulong*) : LibC::Int
  fun gsl_permute_matrix_long(p : Gsl_permutation*, a : Gsl_matrix_long*) : LibC::Int
  fun gsl_permute_matrix_uint(p : Gsl_permutation*, a : Gsl_matrix_uint*) : LibC::Int
  fun gsl_permute_matrix_int(p : Gsl_permutation*, a : Gsl_matrix_int*) : LibC::Int
  fun gsl_permute_matrix_ushort(p : Gsl_permutation*, a : Gsl_matrix_ushort*) : LibC::Int
  fun gsl_permute_matrix_short(p : Gsl_permutation*, a : Gsl_matrix_short*) : LibC::Int
  fun gsl_permute_matrix_uchar(p : Gsl_permutation*, a : Gsl_matrix_uchar*) : LibC::Int
  fun gsl_permute_vector_char(p : Gsl_permutation*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_permute_vector_char_inverse(p : Gsl_permutation*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_permute_vector_complex(p : Gsl_permutation*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_permute_vector_complex_inverse(p : Gsl_permutation*, v : Gsl_vector_complex*) : LibC::Int
  fun gsl_permute_vector_complex_float(p : Gsl_permutation*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_permute_vector_complex_float_inverse(p : Gsl_permutation*, v : Gsl_vector_complex_float*) : LibC::Int
  fun gsl_permute_vector(p : Gsl_permutation*, v : Gsl_vector*) : LibC::Int
  fun gsl_permute_vector_inverse(p : Gsl_permutation*, v : Gsl_vector*) : LibC::Int
  fun gsl_permute_vector_float(p : Gsl_permutation*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_permute_vector_float_inverse(p : Gsl_permutation*, v : Gsl_vector_float*) : LibC::Int
  # fun gsl_permute_vector_complex_long_double(p : Gsl_permutation*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_permute_vector_complex_long_double_inverse(p : Gsl_permutation*, v : Gsl_vector_complex_long_double*) : LibC::Int
  # fun gsl_permute_vector_long_double(p : Gsl_permutation*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_permute_vector_long_double_inverse(p : Gsl_permutation*, v : Gsl_vector_long_double*) : LibC::Int
  fun gsl_permute_vector_ulong(p : Gsl_permutation*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_permute_vector_ulong_inverse(p : Gsl_permutation*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_permute_vector_long(p : Gsl_permutation*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_permute_vector_long_inverse(p : Gsl_permutation*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_permute_vector_uint(p : Gsl_permutation*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_permute_vector_uint_inverse(p : Gsl_permutation*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_permute_vector_int(p : Gsl_permutation*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_permute_vector_int_inverse(p : Gsl_permutation*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_permute_vector_ushort(p : Gsl_permutation*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_permute_vector_ushort_inverse(p : Gsl_permutation*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_permute_vector_short(p : Gsl_permutation*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_permute_vector_short_inverse(p : Gsl_permutation*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_permute_vector_uchar(p : Gsl_permutation*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_permute_vector_uchar_inverse(p : Gsl_permutation*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_poly_eval(c : LibC::Double*, len : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_poly_complex_eval(c : LibC::Double*, len : LibC::Int, z : Gsl_complex) : Gsl_complex
  fun gsl_complex_poly_complex_eval(c : Gsl_complex*, len : LibC::Int, z : Gsl_complex) : Gsl_complex
  fun gsl_poly_eval_derivs(c : LibC::Double*, lenc : LibC::SizeT, x : LibC::Double, res : LibC::Double*, lenres : LibC::SizeT) : LibC::Int
  fun gsl_poly_dd_init(dd : LibC::Double*, x : LibC::Double*, y : LibC::Double*, size : LibC::SizeT) : LibC::Int
  fun gsl_poly_dd_eval(dd : LibC::Double*, xa : LibC::Double*, size : LibC::SizeT, x : LibC::Double) : LibC::Double
  fun gsl_poly_dd_taylor(c : LibC::Double*, xp : LibC::Double, dd : LibC::Double*, x : LibC::Double*, size : LibC::SizeT, w : LibC::Double*) : LibC::Int
  fun gsl_poly_dd_hermite_init(dd : LibC::Double*, z : LibC::Double*, xa : LibC::Double*, ya : LibC::Double*, dya : LibC::Double*, size : LibC::SizeT) : LibC::Int
  fun gsl_poly_solve_quadratic(a : LibC::Double, b : LibC::Double, c : LibC::Double, x0 : LibC::Double*, x1 : LibC::Double*) : LibC::Int
  fun gsl_poly_complex_solve_quadratic(a : LibC::Double, b : LibC::Double, c : LibC::Double, z0 : Gsl_complex*, z1 : Gsl_complex*) : LibC::Int
  fun gsl_poly_solve_cubic(a : LibC::Double, b : LibC::Double, c : LibC::Double, x0 : LibC::Double*, x1 : LibC::Double*, x2 : LibC::Double*) : LibC::Int
  fun gsl_poly_complex_solve_cubic(a : LibC::Double, b : LibC::Double, c : LibC::Double, z0 : Gsl_complex*, z1 : Gsl_complex*, z2 : Gsl_complex*) : LibC::Int
  fun gsl_poly_complex_workspace_alloc(n : LibC::SizeT) : Gsl_poly_complex_workspace*

  struct Gsl_poly_complex_workspace
    nc : LibC::SizeT
    matrix : LibC::Double*
  end

  fun gsl_poly_complex_workspace_free(w : Gsl_poly_complex_workspace*)
  fun gsl_poly_complex_solve(a : LibC::Double*, n : LibC::SizeT, w : Gsl_poly_complex_workspace*, z : Gsl_complex_packed_ptr) : LibC::Int
  alias Gsl_complex_packed_ptr = LibC::Double*

  struct Gsl_qrng_type
    name : LibC::Char*
    max_dimension : LibC::UInt
    state_size : (LibC::UInt -> LibC::SizeT)
    init_state : (Void*, LibC::UInt -> LibC::Int)
    get : (Void*, LibC::UInt, LibC::Double* -> LibC::Int)
  end

  fun gsl_qrng_alloc(t : Gsl_qrng_type*, dimension : LibC::UInt) : Gsl_qrng*

  struct Gsl_qrng
    type : Gsl_qrng_type*
    dimension : LibC::UInt
    state_size : LibC::SizeT
    state : Void*
  end

  fun gsl_qrng_memcpy(dest : Gsl_qrng*, src : Gsl_qrng*) : LibC::Int
  fun gsl_qrng_clone(q : Gsl_qrng*) : Gsl_qrng*
  fun gsl_qrng_free(q : Gsl_qrng*)
  fun gsl_qrng_init(q : Gsl_qrng*)
  fun gsl_qrng_name(q : Gsl_qrng*) : LibC::Char*
  fun gsl_qrng_size(q : Gsl_qrng*) : LibC::SizeT
  fun gsl_qrng_state(q : Gsl_qrng*) : Void*
  fun gsl_qrng_get(q : Gsl_qrng*, x : LibC::Double*) : LibC::Int
  fun gsl_ran_bernoulli(r : Gsl_rng*, p : LibC::Double) : LibC::UInt
  fun gsl_ran_bernoulli_pdf(k : LibC::UInt, p : LibC::Double) : LibC::Double
  fun gsl_ran_beta(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_beta_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_binomial(r : Gsl_rng*, p : LibC::Double, n : LibC::UInt) : LibC::UInt
  fun gsl_ran_binomial_knuth(r : Gsl_rng*, p : LibC::Double, n : LibC::UInt) : LibC::UInt
  fun gsl_ran_binomial_tpe(r : Gsl_rng*, p : LibC::Double, n : LibC::UInt) : LibC::UInt
  fun gsl_ran_binomial_pdf(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_ran_exponential(r : Gsl_rng*, mu : LibC::Double) : LibC::Double
  fun gsl_ran_exponential_pdf(x : LibC::Double, mu : LibC::Double) : LibC::Double
  fun gsl_ran_exppow(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_exppow_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_cauchy(r : Gsl_rng*, a : LibC::Double) : LibC::Double
  fun gsl_ran_cauchy_pdf(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_ran_chisq(r : Gsl_rng*, nu : LibC::Double) : LibC::Double
  fun gsl_ran_chisq_pdf(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_ran_dirichlet(r : Gsl_rng*, k : LibC::SizeT, alpha : LibC::Double*, theta : LibC::Double*)
  fun gsl_ran_dirichlet_pdf(k : LibC::SizeT, alpha : LibC::Double*, theta : LibC::Double*) : LibC::Double
  fun gsl_ran_dirichlet_lnpdf(k : LibC::SizeT, alpha : LibC::Double*, theta : LibC::Double*) : LibC::Double
  fun gsl_ran_erlang(r : Gsl_rng*, a : LibC::Double, n : LibC::Double) : LibC::Double
  fun gsl_ran_erlang_pdf(x : LibC::Double, a : LibC::Double, n : LibC::Double) : LibC::Double
  fun gsl_ran_fdist(r : Gsl_rng*, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_ran_fdist_pdf(x : LibC::Double, nu1 : LibC::Double, nu2 : LibC::Double) : LibC::Double
  fun gsl_ran_flat(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_flat_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gamma(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gamma_int(r : Gsl_rng*, a : LibC::UInt) : LibC::Double
  fun gsl_ran_gamma_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gamma_mt(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gamma_knuth(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian(r : Gsl_rng*, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian_ratio_method(r : Gsl_rng*, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian_ziggurat(r : Gsl_rng*, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian_pdf(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_ugaussian(r : Gsl_rng*) : LibC::Double
  fun gsl_ran_ugaussian_ratio_method(r : Gsl_rng*) : LibC::Double
  fun gsl_ran_ugaussian_pdf(x : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian_tail(r : Gsl_rng*, a : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_gaussian_tail_pdf(x : LibC::Double, a : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_ugaussian_tail(r : Gsl_rng*, a : LibC::Double) : LibC::Double
  fun gsl_ran_ugaussian_tail_pdf(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_ran_bivariate_gaussian(r : Gsl_rng*, sigma_x : LibC::Double, sigma_y : LibC::Double, rho : LibC::Double, x : LibC::Double*, y : LibC::Double*)
  fun gsl_ran_bivariate_gaussian_pdf(x : LibC::Double, y : LibC::Double, sigma_x : LibC::Double, sigma_y : LibC::Double, rho : LibC::Double) : LibC::Double
  fun gsl_ran_multivariate_gaussian(r : Gsl_rng*, mu : Gsl_vector*, l : Gsl_matrix*, result : Gsl_vector*) : LibC::Int
  fun gsl_ran_multivariate_gaussian_log_pdf(x : Gsl_vector*, mu : Gsl_vector*, l : Gsl_matrix*, result : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_ran_multivariate_gaussian_pdf(x : Gsl_vector*, mu : Gsl_vector*, l : Gsl_matrix*, result : LibC::Double*, work : Gsl_vector*) : LibC::Int
  fun gsl_ran_multivariate_gaussian_mean(x : Gsl_matrix*, mu_hat : Gsl_vector*) : LibC::Int
  fun gsl_ran_multivariate_gaussian_vcov(x : Gsl_matrix*, sigma_hat : Gsl_matrix*) : LibC::Int
  fun gsl_ran_landau(r : Gsl_rng*) : LibC::Double
  fun gsl_ran_landau_pdf(x : LibC::Double) : LibC::Double
  fun gsl_ran_geometric(r : Gsl_rng*, p : LibC::Double) : LibC::UInt
  fun gsl_ran_geometric_pdf(k : LibC::UInt, p : LibC::Double) : LibC::Double
  fun gsl_ran_hypergeometric(r : Gsl_rng*, n1 : LibC::UInt, n2 : LibC::UInt, t : LibC::UInt) : LibC::UInt
  fun gsl_ran_hypergeometric_pdf(k : LibC::UInt, n1 : LibC::UInt, n2 : LibC::UInt, t : LibC::UInt) : LibC::Double
  fun gsl_ran_gumbel1(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gumbel1_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gumbel2(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_gumbel2_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_logistic(r : Gsl_rng*, a : LibC::Double) : LibC::Double
  fun gsl_ran_logistic_pdf(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_ran_lognormal(r : Gsl_rng*, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_lognormal_pdf(x : LibC::Double, zeta : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_logarithmic(r : Gsl_rng*, p : LibC::Double) : LibC::UInt
  fun gsl_ran_logarithmic_pdf(k : LibC::UInt, p : LibC::Double) : LibC::Double
  fun gsl_ran_multinomial(r : Gsl_rng*, k : LibC::SizeT, n : LibC::UInt, p : LibC::Double*, n : LibC::UInt*)
  fun gsl_ran_multinomial_pdf(k : LibC::SizeT, p : LibC::Double*, n : LibC::UInt*) : LibC::Double
  fun gsl_ran_multinomial_lnpdf(k : LibC::SizeT, p : LibC::Double*, n : LibC::UInt*) : LibC::Double
  fun gsl_ran_negative_binomial(r : Gsl_rng*, p : LibC::Double, n : LibC::Double) : LibC::UInt
  fun gsl_ran_negative_binomial_pdf(k : LibC::UInt, p : LibC::Double, n : LibC::Double) : LibC::Double
  fun gsl_ran_pascal(r : Gsl_rng*, p : LibC::Double, n : LibC::UInt) : LibC::UInt
  fun gsl_ran_pascal_pdf(k : LibC::UInt, p : LibC::Double, n : LibC::UInt) : LibC::Double
  fun gsl_ran_pareto(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_pareto_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_poisson(r : Gsl_rng*, mu : LibC::Double) : LibC::UInt
  fun gsl_ran_poisson_array(r : Gsl_rng*, n : LibC::SizeT, array : LibC::UInt*, mu : LibC::Double)
  fun gsl_ran_poisson_pdf(k : LibC::UInt, mu : LibC::Double) : LibC::Double
  fun gsl_ran_rayleigh(r : Gsl_rng*, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_rayleigh_pdf(x : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_rayleigh_tail(r : Gsl_rng*, a : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_rayleigh_tail_pdf(x : LibC::Double, a : LibC::Double, sigma : LibC::Double) : LibC::Double
  fun gsl_ran_tdist(r : Gsl_rng*, nu : LibC::Double) : LibC::Double
  fun gsl_ran_tdist_pdf(x : LibC::Double, nu : LibC::Double) : LibC::Double
  fun gsl_ran_laplace(r : Gsl_rng*, a : LibC::Double) : LibC::Double
  fun gsl_ran_laplace_pdf(x : LibC::Double, a : LibC::Double) : LibC::Double
  fun gsl_ran_levy(r : Gsl_rng*, c : LibC::Double, alpha : LibC::Double) : LibC::Double
  fun gsl_ran_levy_skew(r : Gsl_rng*, c : LibC::Double, alpha : LibC::Double, beta : LibC::Double) : LibC::Double
  fun gsl_ran_weibull(r : Gsl_rng*, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_weibull_pdf(x : LibC::Double, a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_ran_dir_2d(r : Gsl_rng*, x : LibC::Double*, y : LibC::Double*)
  fun gsl_ran_dir_2d_trig_method(r : Gsl_rng*, x : LibC::Double*, y : LibC::Double*)
  fun gsl_ran_dir_3d(r : Gsl_rng*, x : LibC::Double*, y : LibC::Double*, z : LibC::Double*)
  fun gsl_ran_dir_nd(r : Gsl_rng*, n : LibC::SizeT, x : LibC::Double*)
  fun gsl_ran_shuffle(r : Gsl_rng*, base : Void*, nmembm : LibC::SizeT, size : LibC::SizeT)
  fun gsl_ran_choose(r : Gsl_rng*, dest : Void*, k : LibC::SizeT, src : Void*, n : LibC::SizeT, size : LibC::SizeT) : LibC::Int
  fun gsl_ran_sample(r : Gsl_rng*, dest : Void*, k : LibC::SizeT, src : Void*, n : LibC::SizeT, size : LibC::SizeT)
  fun gsl_ran_discrete_preproc(k : LibC::SizeT, p : LibC::Double*) : Gsl_ran_discrete_t*

  struct Gsl_ran_discrete_t
    k : LibC::SizeT
    a : LibC::SizeT*
    f : LibC::Double*
  end

  fun gsl_ran_discrete_free(g : Gsl_ran_discrete_t*)
  fun gsl_ran_discrete(r : Gsl_rng*, g : Gsl_ran_discrete_t*) : LibC::SizeT
  fun gsl_ran_discrete_pdf(k : LibC::SizeT, g : Gsl_ran_discrete_t*) : LibC::Double
  fun gsl_root_fsolver_alloc(t : Gsl_root_fsolver_type*) : Gsl_root_fsolver*

  struct Gsl_root_fsolver_type
    name : LibC::Char*
    size : LibC::SizeT
    set : (Void*, Gsl_function*, LibC::Double*, LibC::Double, LibC::Double -> LibC::Int)
    iterate : (Void*, Gsl_function*, LibC::Double*, LibC::Double*, LibC::Double* -> LibC::Int)
  end

  struct Gsl_root_fsolver
    type : Gsl_root_fsolver_type*
    function : Gsl_function*
    root : LibC::Double
    x_lower : LibC::Double
    x_upper : LibC::Double
    state : Void*
  end

  fun gsl_root_fsolver_free(s : Gsl_root_fsolver*)
  fun gsl_root_fsolver_set(s : Gsl_root_fsolver*, f : Gsl_function*, x_lower : LibC::Double, x_upper : LibC::Double) : LibC::Int
  fun gsl_root_fsolver_iterate(s : Gsl_root_fsolver*) : LibC::Int
  fun gsl_root_fsolver_name(s : Gsl_root_fsolver*) : LibC::Char*
  fun gsl_root_fsolver_root(s : Gsl_root_fsolver*) : LibC::Double
  fun gsl_root_fsolver_x_lower(s : Gsl_root_fsolver*) : LibC::Double
  fun gsl_root_fsolver_x_upper(s : Gsl_root_fsolver*) : LibC::Double
  fun gsl_root_fdfsolver_alloc(t : Gsl_root_fdfsolver_type*) : Gsl_root_fdfsolver*

  struct Gsl_root_fdfsolver_type
    name : LibC::Char*
    size : LibC::SizeT
    set : (Void*, Gsl_function_fdf*, LibC::Double* -> LibC::Int)
    iterate : (Void*, Gsl_function_fdf*, LibC::Double* -> LibC::Int)
  end

  struct Gsl_root_fdfsolver
    type : Gsl_root_fdfsolver_type*
    fdf : Gsl_function_fdf*
    root : LibC::Double
    state : Void*
  end

  fun gsl_root_fdfsolver_set(s : Gsl_root_fdfsolver*, fdf : Gsl_function_fdf*, root : LibC::Double) : LibC::Int
  fun gsl_root_fdfsolver_iterate(s : Gsl_root_fdfsolver*) : LibC::Int
  fun gsl_root_fdfsolver_free(s : Gsl_root_fdfsolver*)
  fun gsl_root_fdfsolver_name(s : Gsl_root_fdfsolver*) : LibC::Char*
  fun gsl_root_fdfsolver_root(s : Gsl_root_fdfsolver*) : LibC::Double
  fun gsl_root_test_interval(x_lower : LibC::Double, x_upper : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_root_test_residual(f : LibC::Double, epsabs : LibC::Double) : LibC::Int
  fun gsl_root_test_delta(x1 : LibC::Double, x0 : LibC::Double, epsabs : LibC::Double, epsrel : LibC::Double) : LibC::Int
  fun gsl_rstat_quantile_alloc(p : LibC::Double) : Gsl_rstat_quantile_workspace*

  struct Gsl_rstat_quantile_workspace
    p : LibC::Double
    q : LibC::Double[5]
    npos : LibC::Int[5]
    np : LibC::Double[5]
    dnp : LibC::Double[5]
    n : LibC::SizeT
  end

  fun gsl_rstat_quantile_free(w : Gsl_rstat_quantile_workspace*)
  fun gsl_rstat_quantile_reset(w : Gsl_rstat_quantile_workspace*) : LibC::Int
  fun gsl_rstat_quantile_add(x : LibC::Double, w : Gsl_rstat_quantile_workspace*) : LibC::Int
  fun gsl_rstat_quantile_get(w : Gsl_rstat_quantile_workspace*) : LibC::Double
  fun gsl_rstat_alloc : Gsl_rstat_workspace*

  struct Gsl_rstat_workspace
    min : LibC::Double
    max : LibC::Double
    mean : LibC::Double
    m2 : LibC::Double
    m3 : LibC::Double
    m4 : LibC::Double
    n : LibC::SizeT
    median_workspace_p : Gsl_rstat_quantile_workspace*
  end

  fun gsl_rstat_free(w : Gsl_rstat_workspace*)
  fun gsl_rstat_n(w : Gsl_rstat_workspace*) : LibC::SizeT
  fun gsl_rstat_add(x : LibC::Double, w : Gsl_rstat_workspace*) : LibC::Int
  fun gsl_rstat_min(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_max(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_mean(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_variance(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_sd(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_rms(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_sd_mean(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_median(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_skew(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_kurtosis(w : Gsl_rstat_workspace*) : LibC::Double
  fun gsl_rstat_reset(w : Gsl_rstat_workspace*) : LibC::Int

  struct Gsl_sf_result
    val : LibC::Double
    err : LibC::Double
  end

  struct Gsl_sf_result_e10
    val : LibC::Double
    err : LibC::Double
    e10 : LibC::Int
  end

  fun gsl_sf_result_smash_e(re : Gsl_sf_result_e10*, r : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Ai_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Ai(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Bi_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Bi(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Ai_scaled_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Ai_scaled(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Bi_scaled_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Bi_scaled(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Ai_deriv_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Ai_deriv(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Bi_deriv_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Bi_deriv(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Ai_deriv_scaled_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Ai_deriv_scaled(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_Bi_deriv_scaled_e(x : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_Bi_deriv_scaled(x : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_airy_zero_Ai_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_zero_Ai(s : LibC::UInt) : LibC::Double
  fun gsl_sf_airy_zero_Bi_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_zero_Bi(s : LibC::UInt) : LibC::Double
  fun gsl_sf_airy_zero_Ai_deriv_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_zero_Ai_deriv(s : LibC::UInt) : LibC::Double
  fun gsl_sf_airy_zero_Bi_deriv_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_airy_zero_Bi_deriv(s : LibC::UInt) : LibC::Double
  fun gsl_sf_bessel_J0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_J0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_J1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_J1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Jn_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Jn(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Jn_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_Y0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Y0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Y1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Y1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Yn_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Yn(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Yn_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_I0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_I0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_I1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_I1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_In_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_In(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_In_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_I0_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_I0_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_I1_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_I1_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_In_scaled_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_In_scaled(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_In_scaled_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_K0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_K0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_K1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_K1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Kn_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Kn(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Kn_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_K0_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_K0_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_K1_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_K1_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Kn_scaled_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Kn_scaled(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Kn_scaled_array(nmin : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_j0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_j0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_j1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_j1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_j2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_j2(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_jl_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_jl(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_jl_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_jl_steed_array(lmax : LibC::Int, x : LibC::Double, jl_x_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_y0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_y0(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_y1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_y1(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_y2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_y2(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_yl_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_yl(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_yl_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_i0_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_i0_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_i1_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_i1_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_i2_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_i2_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_il_scaled_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_il_scaled(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_il_scaled_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_k0_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_k0_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_k1_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_k1_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_k2_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_k2_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_kl_scaled_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_kl_scaled(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_kl_scaled_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_Jnu_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Jnu(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Ynu_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Ynu(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_sequence_Jnu_e(nu : LibC::Double, mode : Gsl_mode_t, size : LibC::SizeT, v : LibC::Double*) : LibC::Int
  fun gsl_sf_bessel_Inu_scaled_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Inu_scaled(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Inu_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Inu(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Knu_scaled_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Knu_scaled(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_Knu_scaled_e10_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_bessel_Knu_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_Knu(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_lnKnu_e(nu : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_lnKnu(nu : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_bessel_zero_J0_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_zero_J0(s : LibC::UInt) : LibC::Double
  fun gsl_sf_bessel_zero_J1_e(s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_zero_J1(s : LibC::UInt) : LibC::Double
  fun gsl_sf_bessel_zero_Jnu_e(nu : LibC::Double, s : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_bessel_zero_Jnu(nu : LibC::Double, s : LibC::UInt) : LibC::Double
  fun gsl_sf_clausen_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_clausen(x : LibC::Double) : LibC::Double
  fun gsl_sf_hydrogenicR_1_e(z : LibC::Double, r : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hydrogenicR_1(z : LibC::Double, r : LibC::Double) : LibC::Double
  fun gsl_sf_hydrogenicR_e(n : LibC::Int, l : LibC::Int, z : LibC::Double, r : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hydrogenicR(n : LibC::Int, l : LibC::Int, z : LibC::Double, r : LibC::Double) : LibC::Double
  fun gsl_sf_coulomb_wave_FG_e(eta : LibC::Double, x : LibC::Double, lam_f : LibC::Double, k_lam_g : LibC::Int, f : Gsl_sf_result*, fp : Gsl_sf_result*, g : Gsl_sf_result*, gp : Gsl_sf_result*, exp_f : LibC::Double*, exp_g : LibC::Double*) : LibC::Int
  fun gsl_sf_coulomb_wave_F_array(lam_min : LibC::Double, kmax : LibC::Int, eta : LibC::Double, x : LibC::Double, fc_array : LibC::Double*, f_exponent : LibC::Double*) : LibC::Int
  fun gsl_sf_coulomb_wave_FG_array(lam_min : LibC::Double, kmax : LibC::Int, eta : LibC::Double, x : LibC::Double, fc_array : LibC::Double*, gc_array : LibC::Double*, f_exponent : LibC::Double*, g_exponent : LibC::Double*) : LibC::Int
  fun gsl_sf_coulomb_wave_FGp_array(lam_min : LibC::Double, kmax : LibC::Int, eta : LibC::Double, x : LibC::Double, fc_array : LibC::Double*, fcp_array : LibC::Double*, gc_array : LibC::Double*, gcp_array : LibC::Double*, f_exponent : LibC::Double*, g_exponent : LibC::Double*) : LibC::Int
  fun gsl_sf_coulomb_wave_sphF_array(lam_min : LibC::Double, kmax : LibC::Int, eta : LibC::Double, x : LibC::Double, fc_array : LibC::Double*, f_exponent : LibC::Double*) : LibC::Int
  fun gsl_sf_coulomb_CL_e(l : LibC::Double, eta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coulomb_CL_array(lmin : LibC::Double, kmax : LibC::Int, eta : LibC::Double, cl : LibC::Double*) : LibC::Int
  fun gsl_sf_coupling_3j_e(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_ma : LibC::Int, two_mb : LibC::Int, two_mc : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coupling_3j(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_ma : LibC::Int, two_mb : LibC::Int, two_mc : LibC::Int) : LibC::Double
  fun gsl_sf_coupling_6j_e(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coupling_6j(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int) : LibC::Double
  fun gsl_sf_coupling_RacahW_e(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coupling_RacahW(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int) : LibC::Double
  fun gsl_sf_coupling_9j_e(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int, two_jg : LibC::Int, two_jh : LibC::Int, two_ji : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coupling_9j(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int, two_jg : LibC::Int, two_jh : LibC::Int, two_ji : LibC::Int) : LibC::Double
  fun gsl_sf_coupling_6j_INCORRECT_e(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_coupling_6j_INCORRECT(two_ja : LibC::Int, two_jb : LibC::Int, two_jc : LibC::Int, two_jd : LibC::Int, two_je : LibC::Int, two_jf : LibC::Int) : LibC::Double
  fun gsl_sf_dawson_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_dawson(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_1(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_2(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_3_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_3(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_4_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_4(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_5_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_5(x : LibC::Double) : LibC::Double
  fun gsl_sf_debye_6_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_debye_6(x : LibC::Double) : LibC::Double
  fun gsl_sf_dilog_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_dilog(x : LibC::Double) : LibC::Double
  fun gsl_sf_complex_dilog_xy_e(x : LibC::Double, y : LibC::Double, result_re : Gsl_sf_result*, result_im : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_complex_dilog_e(r : LibC::Double, theta : LibC::Double, result_re : Gsl_sf_result*, result_im : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_complex_spence_xy_e(x : LibC::Double, y : LibC::Double, real_sp : Gsl_sf_result*, imag_sp : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_multiply_e(x : LibC::Double, y : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_multiply(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun gsl_sf_multiply_err_e(x : LibC::Double, dx : LibC::Double, y : LibC::Double, dy : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_Kcomp_e(k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_Kcomp(k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_Ecomp_e(k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_Ecomp(k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_Pcomp_e(k : LibC::Double, n : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_Pcomp(k : LibC::Double, n : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_Dcomp_e(k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_Dcomp(k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_F_e(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_F(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_E_e(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_E(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_P_e(phi : LibC::Double, k : LibC::Double, n : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_P(phi : LibC::Double, k : LibC::Double, n : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_D_e(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_D(phi : LibC::Double, k : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_RC_e(x : LibC::Double, y : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_RC(x : LibC::Double, y : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_RD_e(x : LibC::Double, y : LibC::Double, z : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_RD(x : LibC::Double, y : LibC::Double, z : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_RF_e(x : LibC::Double, y : LibC::Double, z : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_RF(x : LibC::Double, y : LibC::Double, z : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_ellint_RJ_e(x : LibC::Double, y : LibC::Double, z : LibC::Double, p : LibC::Double, mode : Gsl_mode_t, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_ellint_RJ(x : LibC::Double, y : LibC::Double, z : LibC::Double, p : LibC::Double, mode : Gsl_mode_t) : LibC::Double
  fun gsl_sf_elljac_e(u : LibC::Double, m : LibC::Double, sn : LibC::Double*, cn : LibC::Double*, dn : LibC::Double*) : LibC::Int
  fun gsl_sf_erfc_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_erfc(x : LibC::Double) : LibC::Double
  fun gsl_sf_log_erfc_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log_erfc(x : LibC::Double) : LibC::Double
  fun gsl_sf_erf_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_erf(x : LibC::Double) : LibC::Double
  fun gsl_sf_erf_Z_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_erf_Q_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_erf_Z(x : LibC::Double) : LibC::Double
  fun gsl_sf_erf_Q(x : LibC::Double) : LibC::Double
  fun gsl_sf_hazard_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hazard(x : LibC::Double) : LibC::Double
  fun gsl_sf_exp_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exp(x : LibC::Double) : LibC::Double
  fun gsl_sf_exp_e10_e(x : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_exp_mult_e(x : LibC::Double, y : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exp_mult(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun gsl_sf_exp_mult_e10_e(x : LibC::Double, y : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_expm1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expm1(x : LibC::Double) : LibC::Double
  fun gsl_sf_exprel_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exprel(x : LibC::Double) : LibC::Double
  fun gsl_sf_exprel_2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exprel_2(x : LibC::Double) : LibC::Double
  fun gsl_sf_exprel_n_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exprel_n(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_exprel_n_CF_e(n : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exp_err_e(x : LibC::Double, dx : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exp_err_e10_e(x : LibC::Double, dx : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_exp_mult_err_e(x : LibC::Double, dx : LibC::Double, y : LibC::Double, dy : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_exp_mult_err_e10_e(x : LibC::Double, dx : LibC::Double, y : LibC::Double, dy : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_expint_E1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_E1(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_E2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_E2(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_En_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_En(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_E1_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_E1_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_E2_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_E2_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_En_scaled_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_En_scaled(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_Ei_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_Ei(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_Ei_scaled_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_Ei_scaled(x : LibC::Double) : LibC::Double
  fun gsl_sf_Shi_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_Shi(x : LibC::Double) : LibC::Double
  fun gsl_sf_Chi_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_Chi(x : LibC::Double) : LibC::Double
  fun gsl_sf_expint_3_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_expint_3(x : LibC::Double) : LibC::Double
  fun gsl_sf_Si_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_Si(x : LibC::Double) : LibC::Double
  fun gsl_sf_Ci_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_Ci(x : LibC::Double) : LibC::Double
  fun gsl_sf_atanint_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_atanint(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_m1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_m1(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_0(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_1(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_2(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_int_e(j : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_int(j : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_mhalf_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_mhalf(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_half_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_half(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_3half_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_3half(x : LibC::Double) : LibC::Double
  fun gsl_sf_fermi_dirac_inc_0_e(x : LibC::Double, b : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fermi_dirac_inc_0(x : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_sf_lngamma_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lngamma(x : LibC::Double) : LibC::Double
  fun gsl_sf_lngamma_sgn_e(x : LibC::Double, result_lg : Gsl_sf_result*, sgn : LibC::Double*) : LibC::Int
  fun gsl_sf_gamma_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gamma(x : LibC::Double) : LibC::Double
  fun gsl_sf_gammastar_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gammastar(x : LibC::Double) : LibC::Double
  fun gsl_sf_gammainv_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gammainv(x : LibC::Double) : LibC::Double
  fun gsl_sf_lngamma_complex_e(zr : LibC::Double, zi : LibC::Double, lnr : Gsl_sf_result*, arg : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_taylorcoeff_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_taylorcoeff(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_fact_e(n : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_fact(n : LibC::UInt) : LibC::Double
  fun gsl_sf_doublefact_e(n : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_doublefact(n : LibC::UInt) : LibC::Double
  fun gsl_sf_lnfact_e(n : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lnfact(n : LibC::UInt) : LibC::Double
  fun gsl_sf_lndoublefact_e(n : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lndoublefact(n : LibC::UInt) : LibC::Double
  fun gsl_sf_lnchoose_e(n : LibC::UInt, m : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lnchoose(n : LibC::UInt, m : LibC::UInt) : LibC::Double
  fun gsl_sf_choose_e(n : LibC::UInt, m : LibC::UInt, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_choose(n : LibC::UInt, m : LibC::UInt) : LibC::Double
  fun gsl_sf_lnpoch_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lnpoch(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_lnpoch_sgn_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*, sgn : LibC::Double*) : LibC::Int
  fun gsl_sf_poch_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_poch(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_pochrel_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_pochrel(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gamma_inc_Q_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gamma_inc_Q(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gamma_inc_P_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gamma_inc_P(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gamma_inc_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gamma_inc(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_lnbeta_e(a : LibC::Double, b : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lnbeta(a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_sf_lnbeta_sgn_e(x : LibC::Double, y : LibC::Double, result : Gsl_sf_result*, sgn : LibC::Double*) : LibC::Int
  fun gsl_sf_beta_e(a : LibC::Double, b : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_beta(a : LibC::Double, b : LibC::Double) : LibC::Double
  fun gsl_sf_beta_inc_e(a : LibC::Double, b : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_beta_inc(a : LibC::Double, b : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gegenpoly_1_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gegenpoly_2_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gegenpoly_3_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gegenpoly_1(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gegenpoly_2(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gegenpoly_3(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gegenpoly_n_e(n : LibC::Int, lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_gegenpoly_n(n : LibC::Int, lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_gegenpoly_array(nmax : LibC::Int, lambda : LibC::Double, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_prob_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_prob(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_prob_der_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_prob_der(m : LibC::Int, n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_phys_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_phys(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_phys_der_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_phys_der(m : LibC::Int, n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_func_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_func(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_prob_array(nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_prob_array_der(m : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_prob_der_array(mmax : LibC::Int, n : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_prob_series_e(n : LibC::Int, x : LibC::Double, a : LibC::Double*, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_prob_series(n : LibC::Int, x : LibC::Double, a : LibC::Double*) : LibC::Double
  fun gsl_sf_hermite_phys_array(nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_phys_array_der(m : LibC::Int, nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_phys_der_array(mmax : LibC::Int, n : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_phys_series_e(n : LibC::Int, x : LibC::Double, a : LibC::Double*, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_phys_series(n : LibC::Int, x : LibC::Double, a : LibC::Double*) : LibC::Double
  fun gsl_sf_hermite_func_array(nmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_hermite_func_series_e(n : LibC::Int, x : LibC::Double, a : LibC::Double*, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_func_series(n : LibC::Int, x : LibC::Double, a : LibC::Double*) : LibC::Double
  fun gsl_sf_hermite_func_der_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_func_der(m : LibC::Int, n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hermite_prob_zero_e(n : LibC::Int, s : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_prob_zero(n : LibC::Int, s : LibC::Int) : LibC::Double
  fun gsl_sf_hermite_phys_zero_e(n : LibC::Int, s : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_phys_zero(n : LibC::Int, s : LibC::Int) : LibC::Double
  fun gsl_sf_hermite_func_zero_e(n : LibC::Int, s : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hermite_func_zero(n : LibC::Int, s : LibC::Int) : LibC::Double
  fun gsl_sf_hyperg_0F1_e(c : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_0F1(c : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_1F1_int_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_1F1_int(m : LibC::Int, n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_1F1_e(a : LibC::Double, b : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_1F1(a : LibC::Double, b : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_U_int_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_U_int(m : LibC::Int, n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_U_int_e10_e(m : LibC::Int, n : LibC::Int, x : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_hyperg_U_e(a : LibC::Double, b : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_U(a : LibC::Double, b : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_U_e10_e(a : LibC::Double, b : LibC::Double, x : LibC::Double, result : Gsl_sf_result_e10*) : LibC::Int
  fun gsl_sf_hyperg_2F1_e(a : LibC::Double, b : LibC::Double, c : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_2F1(a : LibC::Double, b : LibC::Double, c : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_2F1_conj_e(a_r : LibC::Double, a_i : LibC::Double, c : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_2F1_conj(a_r : LibC::Double, a_i : LibC::Double, c : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_2F1_renorm_e(a : LibC::Double, b : LibC::Double, c : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_2F1_renorm(a : LibC::Double, b : LibC::Double, c : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_2F1_conj_renorm_e(a_r : LibC::Double, a_i : LibC::Double, c : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_2F1_conj_renorm(a_r : LibC::Double, a_i : LibC::Double, c : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_hyperg_2F0_e(a : LibC::Double, b : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hyperg_2F0(a : LibC::Double, b : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_laguerre_1_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_laguerre_2_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_laguerre_3_e(a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_laguerre_1(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_laguerre_2(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_laguerre_3(a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_laguerre_n_e(n : LibC::Int, a : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_laguerre_n(n : LibC::Int, a : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_lambert_W0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lambert_W0(x : LibC::Double) : LibC::Double
  fun gsl_sf_lambert_Wm1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lambert_Wm1(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Pl_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_Pl(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Pl_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_Pl_deriv_array(lmax : LibC::Int, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_P1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_P2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_P3_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_P1(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_P2(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_P3(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Q0_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_Q0(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Q1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_Q1(x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Ql_e(l : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_Ql(l : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Plm_e(l : LibC::Int, m : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_Plm(l : LibC::Int, m : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_Plm_array(lmax : LibC::Int, m : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_Plm_deriv_array(lmax : LibC::Int, m : LibC::Int, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_sphPlm_e(l : LibC::Int, m : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_sphPlm(l : LibC::Int, m : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_sphPlm_array(lmax : LibC::Int, m : LibC::Int, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_sphPlm_deriv_array(lmax : LibC::Int, m : LibC::Int, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_array_size(lmax : LibC::Int, m : LibC::Int) : LibC::Int
  fun gsl_sf_conicalP_half_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_half(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_conicalP_mhalf_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_mhalf(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_conicalP_0_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_0(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_conicalP_1_e(lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_1(lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_conicalP_sph_reg_e(l : LibC::Int, lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_sph_reg(l : LibC::Int, lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_conicalP_cyl_reg_e(m : LibC::Int, lambda : LibC::Double, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_conicalP_cyl_reg(m : LibC::Int, lambda : LibC::Double, x : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_H3d_0_e(lambda : LibC::Double, eta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_H3d_0(lambda : LibC::Double, eta : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_H3d_1_e(lambda : LibC::Double, eta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_H3d_1(lambda : LibC::Double, eta : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_H3d_e(l : LibC::Int, lambda : LibC::Double, eta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_legendre_H3d(l : LibC::Int, lambda : LibC::Double, eta : LibC::Double) : LibC::Double
  fun gsl_sf_legendre_H3d_array(lmax : LibC::Int, lambda : LibC::Double, eta : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_array(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, result_array : LibC::Double*) : LibC::Int
  enum Gsl_sf_legendre_t
    GSL_SF_LEGENDRE_SCHMIDT = 0
    GSL_SF_LEGENDRE_SPHARM  = 1
    GSL_SF_LEGENDRE_FULL    = 2
    GSL_SF_LEGENDRE_NONE    = 3
  end
  fun gsl_sf_legendre_array_e(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, csphase : LibC::Double, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv_array(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv_array_e(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, csphase : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv_alt_array(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv_alt_array_e(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, csphase : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv2_array(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*, result_deriv2_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv2_array_e(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, csphase : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*, result_deriv2_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv2_alt_array(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*, result_deriv2_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_deriv2_alt_array_e(norm : Gsl_sf_legendre_t, lmax : LibC::SizeT, x : LibC::Double, csphase : LibC::Double, result_array : LibC::Double*, result_deriv_array : LibC::Double*, result_deriv2_array : LibC::Double*) : LibC::Int
  fun gsl_sf_legendre_array_n(lmax : LibC::SizeT) : LibC::SizeT
  fun gsl_sf_legendre_array_index(l : LibC::SizeT, m : LibC::SizeT) : LibC::SizeT
  fun gsl_sf_legendre_nlm(lmax : LibC::SizeT) : LibC::SizeT
  fun gsl_sf_log_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log(x : LibC::Double) : LibC::Double
  fun gsl_sf_log_abs_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log_abs(x : LibC::Double) : LibC::Double
  fun gsl_sf_complex_log_e(zr : LibC::Double, zi : LibC::Double, lnr : Gsl_sf_result*, theta : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log_1plusx_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log_1plusx(x : LibC::Double) : LibC::Double
  fun gsl_sf_log_1plusx_mx_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_log_1plusx_mx(x : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_a_array(order_min : LibC::Int, order_max : LibC::Int, qq : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int

  struct Gsl_sf_mathieu_workspace
    size : LibC::SizeT
    even_order : LibC::SizeT
    odd_order : LibC::SizeT
    extra_values : LibC::Int
    qa : LibC::Double
    qb : LibC::Double
    aa : LibC::Double*
    bb : LibC::Double*
    dd : LibC::Double*
    ee : LibC::Double*
    tt : LibC::Double*
    e2 : LibC::Double*
    zz : LibC::Double*
    eval : Gsl_vector*
    evec : Gsl_matrix*
    wmat : Gsl_eigen_symmv_workspace*
  end

  fun gsl_sf_mathieu_b_array(order_min : LibC::Int, order_max : LibC::Int, qq : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_a_e(order : LibC::Int, qq : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_a(order : LibC::Int, qq : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_b_e(order : LibC::Int, qq : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_b(order : LibC::Int, qq : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_a_coeff(order : LibC::Int, qq : LibC::Double, aa : LibC::Double, coeff : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_b_coeff(order : LibC::Int, qq : LibC::Double, aa : LibC::Double, coeff : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_alloc(nn : LibC::SizeT, qq : LibC::Double) : Gsl_sf_mathieu_workspace*
  fun gsl_sf_mathieu_free(workspace : Gsl_sf_mathieu_workspace*)
  fun gsl_sf_mathieu_ce_e(order : LibC::Int, qq : LibC::Double, zz : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_ce(order : LibC::Int, qq : LibC::Double, zz : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_se_e(order : LibC::Int, qq : LibC::Double, zz : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_se(order : LibC::Int, qq : LibC::Double, zz : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_ce_array(nmin : LibC::Int, nmax : LibC::Int, qq : LibC::Double, zz : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_se_array(nmin : LibC::Int, nmax : LibC::Int, qq : LibC::Double, zz : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_Mc_e(kind : LibC::Int, order : LibC::Int, qq : LibC::Double, zz : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_Mc(kind : LibC::Int, order : LibC::Int, qq : LibC::Double, zz : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_Ms_e(kind : LibC::Int, order : LibC::Int, qq : LibC::Double, zz : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_mathieu_Ms(kind : LibC::Int, order : LibC::Int, qq : LibC::Double, zz : LibC::Double) : LibC::Double
  fun gsl_sf_mathieu_Mc_array(kind : LibC::Int, nmin : LibC::Int, nmax : LibC::Int, qq : LibC::Double, zz : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_mathieu_Ms_array(kind : LibC::Int, nmin : LibC::Int, nmax : LibC::Int, qq : LibC::Double, zz : LibC::Double, work : Gsl_sf_mathieu_workspace*, result_array : LibC::Double*) : LibC::Int
  fun gsl_sf_pow_int_e(x : LibC::Double, n : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_pow_int(x : LibC::Double, n : LibC::Int) : LibC::Double
  fun gsl_sf_psi_int_e(n : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_int(n : LibC::Int) : LibC::Double
  fun gsl_sf_psi_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi(x : LibC::Double) : LibC::Double
  fun gsl_sf_psi_1piy_e(y : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_1piy(y : LibC::Double) : LibC::Double
  fun gsl_sf_complex_psi_e(x : LibC::Double, y : LibC::Double, result_re : Gsl_sf_result*, result_im : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_1_int_e(n : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_1_int(n : LibC::Int) : LibC::Double
  fun gsl_sf_psi_1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_1(x : LibC::Double) : LibC::Double
  fun gsl_sf_psi_n_e(n : LibC::Int, x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_psi_n(n : LibC::Int, x : LibC::Double) : LibC::Double
  fun gsl_sf_synchrotron_1_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_synchrotron_1(x : LibC::Double) : LibC::Double
  fun gsl_sf_synchrotron_2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_synchrotron_2(x : LibC::Double) : LibC::Double
  fun gsl_sf_transport_2_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_transport_2(x : LibC::Double) : LibC::Double
  fun gsl_sf_transport_3_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_transport_3(x : LibC::Double) : LibC::Double
  fun gsl_sf_transport_4_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_transport_4(x : LibC::Double) : LibC::Double
  fun gsl_sf_transport_5_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_transport_5(x : LibC::Double) : LibC::Double
  fun gsl_sf_sin_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_sin(x : LibC::Double) : LibC::Double
  fun gsl_sf_cos_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_cos(x : LibC::Double) : LibC::Double
  fun gsl_sf_hypot_e(x : LibC::Double, y : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hypot(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun gsl_sf_complex_sin_e(zr : LibC::Double, zi : LibC::Double, szr : Gsl_sf_result*, szi : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_complex_cos_e(zr : LibC::Double, zi : LibC::Double, czr : Gsl_sf_result*, czi : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_complex_logsin_e(zr : LibC::Double, zi : LibC::Double, lszr : Gsl_sf_result*, lszi : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_sinc_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_sinc(x : LibC::Double) : LibC::Double
  fun gsl_sf_lnsinh_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lnsinh(x : LibC::Double) : LibC::Double
  fun gsl_sf_lncosh_e(x : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_lncosh(x : LibC::Double) : LibC::Double
  fun gsl_sf_polar_to_rect(r : LibC::Double, theta : LibC::Double, x : Gsl_sf_result*, y : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_rect_to_polar(x : LibC::Double, y : LibC::Double, r : Gsl_sf_result*, theta : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_sin_err_e(x : LibC::Double, dx : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_cos_err_e(x : LibC::Double, dx : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_angle_restrict_symm_e(theta : LibC::Double*) : LibC::Int
  fun gsl_sf_angle_restrict_symm(theta : LibC::Double) : LibC::Double
  fun gsl_sf_angle_restrict_pos_e(theta : LibC::Double*) : LibC::Int
  fun gsl_sf_angle_restrict_pos(theta : LibC::Double) : LibC::Double
  fun gsl_sf_angle_restrict_symm_err_e(theta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_angle_restrict_pos_err_e(theta : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_zeta_int_e(n : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_zeta_int(n : LibC::Int) : LibC::Double
  fun gsl_sf_zeta_e(s : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_zeta(s : LibC::Double) : LibC::Double
  fun gsl_sf_zetam1_e(s : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_zetam1(s : LibC::Double) : LibC::Double
  fun gsl_sf_zetam1_int_e(s : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_zetam1_int(s : LibC::Int) : LibC::Double
  fun gsl_sf_hzeta_e(s : LibC::Double, q : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_hzeta(s : LibC::Double, q : LibC::Double) : LibC::Double
  fun gsl_sf_eta_int_e(n : LibC::Int, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_eta_int(n : LibC::Int) : LibC::Double
  fun gsl_sf_eta_e(s : LibC::Double, result : Gsl_sf_result*) : LibC::Int
  fun gsl_sf_eta(s : LibC::Double) : LibC::Double
  fun gsl_siman_solve(r : Gsl_rng*, x0_p : Void*, ef : Gsl_siman_efunc_t, take_step : Gsl_siman_step_t, distance : Gsl_siman_metric_t, print_position : Gsl_siman_print_t, copyfunc : Gsl_siman_copy_t, copy_constructor : Gsl_siman_copy_construct_t, destructor : Gsl_siman_destroy_t, element_size : LibC::SizeT, params : Gsl_siman_params_t)
  alias Gsl_siman_efunc_t = (Void* -> LibC::Double)
  alias Gsl_siman_step_t = (Gsl_rng*, Void*, LibC::Double -> Void)
  alias Gsl_siman_metric_t = (Void*, Void* -> LibC::Double)
  alias Gsl_siman_print_t = (Void* -> Void)
  alias Gsl_siman_copy_t = (Void*, Void* -> Void)
  alias Gsl_siman_copy_construct_t = (Void* -> Void*)
  alias Gsl_siman_destroy_t = (Void* -> Void)

  struct Gsl_siman_params_t
    n_tries : LibC::Int
    iters_fixed_t : LibC::Int
    step_size : LibC::Double
    k : LibC::Double
    t_initial : LibC::Double
    mu_t : LibC::Double
    t_min : LibC::Double
  end

  fun gsl_siman_solve_many(r : Gsl_rng*, x0_p : Void*, ef : Gsl_siman_efunc_t, take_step : Gsl_siman_step_t, distance : Gsl_siman_metric_t, print_position : Gsl_siman_print_t, element_size : LibC::SizeT, params : Gsl_siman_params_t)
  fun gsl_sort_char(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_char(data1 : LibC::Char*, stride1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_char_index(p : LibC::SizeT*, data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_char_smallest(dest : LibC::Char*, k : LibC::SizeT, src : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_char_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_char_largest(dest : LibC::Char*, k : LibC::SizeT, src : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_char_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2(data1 : LibC::Double*, stride1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_index(p : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_smallest(dest : LibC::Double*, k : LibC::SizeT, src : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_largest(dest : LibC::Double*, k : LibC::SizeT, src : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_float(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_float(data1 : LibC::Float*, stride1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_float_index(p : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_float_smallest(dest : LibC::Float*, k : LibC::SizeT, src : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_float_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_float_largest(dest : LibC::Float*, k : LibC::SizeT, src : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_float_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_sort_long_double(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT)
  # fun gsl_sort2_long_double(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n : LibC::SizeT)
  # fun gsl_sort_long_double_index(p : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT)
  # fun gsl_sort_long_double_smallest(dest : LibC::LongDouble*, k : LibC::SizeT, src : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_sort_long_double_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_sort_long_double_largest(dest : LibC::LongDouble*, k : LibC::SizeT, src : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  # fun gsl_sort_long_double_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ulong(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_ulong(data1 : LibC::ULong*, stride1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_ulong_index(p : LibC::SizeT*, data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_ulong_smallest(dest : LibC::ULong*, k : LibC::SizeT, src : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ulong_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ulong_largest(dest : LibC::ULong*, k : LibC::SizeT, src : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ulong_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_long(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_long(data1 : LibC::Long*, stride1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_long_index(p : LibC::SizeT*, data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_long_smallest(dest : LibC::Long*, k : LibC::SizeT, src : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_long_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_long_largest(dest : LibC::Long*, k : LibC::SizeT, src : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_long_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uint(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_uint(data1 : LibC::UInt*, stride1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_uint_index(p : LibC::SizeT*, data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_uint_smallest(dest : LibC::UInt*, k : LibC::SizeT, src : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uint_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uint_largest(dest : LibC::UInt*, k : LibC::SizeT, src : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uint_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_int(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_int(data1 : LibC::Int*, stride1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_int_index(p : LibC::SizeT*, data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_int_smallest(dest : LibC::Int*, k : LibC::SizeT, src : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_int_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_int_largest(dest : LibC::Int*, k : LibC::SizeT, src : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_int_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ushort(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_ushort(data1 : LibC::UShort*, stride1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_ushort_index(p : LibC::SizeT*, data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_ushort_smallest(dest : LibC::UShort*, k : LibC::SizeT, src : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ushort_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ushort_largest(dest : LibC::UShort*, k : LibC::SizeT, src : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_ushort_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_short(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_short(data1 : LibC::Short*, stride1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_short_index(p : LibC::SizeT*, data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_short_smallest(dest : LibC::Short*, k : LibC::SizeT, src : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_short_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_short_largest(dest : LibC::Short*, k : LibC::SizeT, src : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_short_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uchar(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort2_uchar(data1 : UInt8*, stride1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_uchar_index(p : LibC::SizeT*, data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_sort_uchar_smallest(dest : UInt8*, k : LibC::SizeT, src : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uchar_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, src : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uchar_largest(dest : UInt8*, k : LibC::SizeT, src : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_uchar_largest_index(p : LibC::SizeT*, k : LibC::SizeT, src : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_sort_vector_char(v : Gsl_vector_char*)
  fun gsl_sort_vector2_char(v1 : Gsl_vector_char*, v2 : Gsl_vector_char*)
  fun gsl_sort_vector_char_index(p : Gsl_permutation*, v : Gsl_vector_char*) : LibC::Int
  fun gsl_sort_vector_char_smallest(dest : LibC::Char*, k : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_sort_vector_char_largest(dest : LibC::Char*, k : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_sort_vector_char_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_sort_vector_char_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_char*) : LibC::Int
  fun gsl_sort_vector(v : Gsl_vector*)
  fun gsl_sort_vector2(v1 : Gsl_vector*, v2 : Gsl_vector*)
  fun gsl_sort_vector_index(p : Gsl_permutation*, v : Gsl_vector*) : LibC::Int
  fun gsl_sort_vector_smallest(dest : LibC::Double*, k : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_sort_vector_largest(dest : LibC::Double*, k : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_sort_vector_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_sort_vector_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector*) : LibC::Int
  fun gsl_sort_vector_float(v : Gsl_vector_float*)
  fun gsl_sort_vector2_float(v1 : Gsl_vector_float*, v2 : Gsl_vector_float*)
  fun gsl_sort_vector_float_index(p : Gsl_permutation*, v : Gsl_vector_float*) : LibC::Int
  fun gsl_sort_vector_float_smallest(dest : LibC::Float*, k : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  fun gsl_sort_vector_float_largest(dest : LibC::Float*, k : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  fun gsl_sort_vector_float_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  fun gsl_sort_vector_float_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_float*) : LibC::Int
  # fun gsl_sort_vector_long_double(v : Gsl_vector_long_double*)
  # fun gsl_sort_vector2_long_double(v1 : Gsl_vector_long_double*, v2 : Gsl_vector_long_double*)
  # fun gsl_sort_vector_long_double_index(p : Gsl_permutation*, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_sort_vector_long_double_smallest(dest : LibC::LongDouble*, k : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_sort_vector_long_double_largest(dest : LibC::LongDouble*, k : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_sort_vector_long_double_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  # fun gsl_sort_vector_long_double_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_long_double*) : LibC::Int
  fun gsl_sort_vector_ulong(v : Gsl_vector_ulong*)
  fun gsl_sort_vector2_ulong(v1 : Gsl_vector_ulong*, v2 : Gsl_vector_ulong*)
  fun gsl_sort_vector_ulong_index(p : Gsl_permutation*, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_sort_vector_ulong_smallest(dest : LibC::ULong*, k : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_sort_vector_ulong_largest(dest : LibC::ULong*, k : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_sort_vector_ulong_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_sort_vector_ulong_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_ulong*) : LibC::Int
  fun gsl_sort_vector_long(v : Gsl_vector_long*)
  fun gsl_sort_vector2_long(v1 : Gsl_vector_long*, v2 : Gsl_vector_long*)
  fun gsl_sort_vector_long_index(p : Gsl_permutation*, v : Gsl_vector_long*) : LibC::Int
  fun gsl_sort_vector_long_smallest(dest : LibC::Long*, k : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_sort_vector_long_largest(dest : LibC::Long*, k : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_sort_vector_long_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_sort_vector_long_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_long*) : LibC::Int
  fun gsl_sort_vector_uint(v : Gsl_vector_uint*)
  fun gsl_sort_vector2_uint(v1 : Gsl_vector_uint*, v2 : Gsl_vector_uint*)
  fun gsl_sort_vector_uint_index(p : Gsl_permutation*, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_sort_vector_uint_smallest(dest : LibC::UInt*, k : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_sort_vector_uint_largest(dest : LibC::UInt*, k : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_sort_vector_uint_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_sort_vector_uint_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_uint*) : LibC::Int
  fun gsl_sort_vector_int(v : Gsl_vector_int*)
  fun gsl_sort_vector2_int(v1 : Gsl_vector_int*, v2 : Gsl_vector_int*)
  fun gsl_sort_vector_int_index(p : Gsl_permutation*, v : Gsl_vector_int*) : LibC::Int
  fun gsl_sort_vector_int_smallest(dest : LibC::Int*, k : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_sort_vector_int_largest(dest : LibC::Int*, k : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_sort_vector_int_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_sort_vector_int_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_int*) : LibC::Int
  fun gsl_sort_vector_ushort(v : Gsl_vector_ushort*)
  fun gsl_sort_vector2_ushort(v1 : Gsl_vector_ushort*, v2 : Gsl_vector_ushort*)
  fun gsl_sort_vector_ushort_index(p : Gsl_permutation*, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_sort_vector_ushort_smallest(dest : LibC::UShort*, k : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_sort_vector_ushort_largest(dest : LibC::UShort*, k : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_sort_vector_ushort_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_sort_vector_ushort_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_ushort*) : LibC::Int
  fun gsl_sort_vector_short(v : Gsl_vector_short*)
  fun gsl_sort_vector2_short(v1 : Gsl_vector_short*, v2 : Gsl_vector_short*)
  fun gsl_sort_vector_short_index(p : Gsl_permutation*, v : Gsl_vector_short*) : LibC::Int
  fun gsl_sort_vector_short_smallest(dest : LibC::Short*, k : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_sort_vector_short_largest(dest : LibC::Short*, k : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_sort_vector_short_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_sort_vector_short_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_short*) : LibC::Int
  fun gsl_sort_vector_uchar(v : Gsl_vector_uchar*)
  fun gsl_sort_vector2_uchar(v1 : Gsl_vector_uchar*, v2 : Gsl_vector_uchar*)
  fun gsl_sort_vector_uchar_index(p : Gsl_permutation*, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_sort_vector_uchar_smallest(dest : UInt8*, k : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_sort_vector_uchar_largest(dest : UInt8*, k : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_sort_vector_uchar_smallest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_sort_vector_uchar_largest_index(p : LibC::SizeT*, k : LibC::SizeT, v : Gsl_vector_uchar*) : LibC::Int
  fun gsl_spmatrix_alloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_spmatrix*

  struct Gsl_spmatrix
    size1 : LibC::SizeT
    size2 : LibC::SizeT
    i : LibC::SizeT*
    data : LibC::Double*
    p : LibC::SizeT*
    nzmax : LibC::SizeT
    nz : LibC::SizeT
    tree_data : Gsl_spmatrix_tree*
    work : Void*
    sptype : LibC::SizeT
  end

  struct Gsl_spmatrix_tree
    tree : Void*
    node_array : Void*
    n : LibC::SizeT
  end

  fun gsl_spmatrix_alloc_nzmax(n1 : LibC::SizeT, n2 : LibC::SizeT, nzmax : LibC::SizeT, flags : LibC::SizeT) : Gsl_spmatrix*
  fun gsl_spmatrix_free(m : Gsl_spmatrix*)
  fun gsl_spmatrix_realloc(nzmax : LibC::SizeT, m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_set_zero(m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_nnz(m : Gsl_spmatrix*) : LibC::SizeT
  fun gsl_spmatrix_compare_idx(ia : LibC::SizeT, ja : LibC::SizeT, ib : LibC::SizeT, jb : LibC::SizeT) : LibC::Int
  fun gsl_spmatrix_tree_rebuild(m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_memcpy(dest : Gsl_spmatrix*, src : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_get(m : Gsl_spmatrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double
  fun gsl_spmatrix_set(m : Gsl_spmatrix*, i : LibC::SizeT, j : LibC::SizeT, x : LibC::Double) : LibC::Int
  fun gsl_spmatrix_ptr(m : Gsl_spmatrix*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double*
  fun gsl_spmatrix_compcol(t : Gsl_spmatrix*) : Gsl_spmatrix*
  fun gsl_spmatrix_ccs(t : Gsl_spmatrix*) : Gsl_spmatrix*
  fun gsl_spmatrix_crs(t : Gsl_spmatrix*) : Gsl_spmatrix*
  fun gsl_spmatrix_cumsum(n : LibC::SizeT, c : LibC::SizeT*)
  fun gsl_spmatrix_fprintf(stream : File*, m : Gsl_spmatrix*, format : LibC::Char*) : LibC::Int
  fun gsl_spmatrix_fscanf(stream : File*) : Gsl_spmatrix*
  fun gsl_spmatrix_fwrite(stream : File*, m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_fread(stream : File*, m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_scale(m : Gsl_spmatrix*, x : LibC::Double) : LibC::Int
  fun gsl_spmatrix_minmax(m : Gsl_spmatrix*, min_out : LibC::Double*, max_out : LibC::Double*) : LibC::Int
  fun gsl_spmatrix_add(c : Gsl_spmatrix*, a : Gsl_spmatrix*, b : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_d2sp(s : Gsl_spmatrix*, a : Gsl_matrix*) : LibC::Int
  fun gsl_spmatrix_sp2d(a : Gsl_matrix*, s : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_equal(a : Gsl_spmatrix*, b : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_transpose(m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_transpose2(m : Gsl_spmatrix*) : LibC::Int
  fun gsl_spmatrix_transpose_memcpy(dest : Gsl_spmatrix*, src : Gsl_spmatrix*) : LibC::Int
  fun gsl_spblas_dgemv(trans_a : CBLAS_TRANSPOSE_t, alpha : LibC::Double, a : Gsl_spmatrix*, x : Gsl_vector*, beta : LibC::Double, y : Gsl_vector*) : LibC::Int
  fun gsl_spblas_dgemm(alpha : LibC::Double, a : Gsl_spmatrix*, b : Gsl_spmatrix*, c : Gsl_spmatrix*) : LibC::Int
  fun gsl_spblas_scatter(a : Gsl_spmatrix*, j : LibC::SizeT, alpha : LibC::Double, w : LibC::SizeT*, x : LibC::Double*, mark : LibC::SizeT, c : Gsl_spmatrix*, nz : LibC::SizeT) : LibC::SizeT

  struct Gsl_splinalg_itersolve_type
    name : LibC::Char*
    alloc : (LibC::SizeT, LibC::SizeT -> Void*)
    iterate : (Gsl_spmatrix*, Gsl_vector*, LibC::Double, Gsl_vector*, Void* -> LibC::Int)
    normr : (Void* -> LibC::Double)
    free : (Void* -> Void)
  end

  fun gsl_splinalg_itersolve_alloc(t : Gsl_splinalg_itersolve_type*, n : LibC::SizeT, m : LibC::SizeT) : Gsl_splinalg_itersolve*

  struct Gsl_splinalg_itersolve
    type : Gsl_splinalg_itersolve_type*
    normr : LibC::Double
    state : Void*
  end

  fun gsl_splinalg_itersolve_free(w : Gsl_splinalg_itersolve*)
  fun gsl_splinalg_itersolve_name(w : Gsl_splinalg_itersolve*) : LibC::Char*
  fun gsl_splinalg_itersolve_iterate(a : Gsl_spmatrix*, b : Gsl_vector*, tol : LibC::Double, x : Gsl_vector*, w : Gsl_splinalg_itersolve*) : LibC::Int
  fun gsl_splinalg_itersolve_normr(w : Gsl_splinalg_itersolve*) : LibC::Double
  fun gsl_spline2d_alloc(t : Gsl_interp2d_type*, xsize : LibC::SizeT, ysize : LibC::SizeT) : Gsl_spline2d*

  struct Gsl_spline2d
    interp_object : Gsl_interp2d
    xarr : LibC::Double*
    yarr : LibC::Double*
    zarr : LibC::Double*
  end

  fun gsl_spline2d_init(interp : Gsl_spline2d*, xa : LibC::Double*, ya : LibC::Double*, za : LibC::Double*, xsize : LibC::SizeT, ysize : LibC::SizeT) : LibC::Int
  fun gsl_spline2d_free(interp : Gsl_spline2d*)
  fun gsl_spline2d_eval(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_eval_deriv_x(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_deriv_x_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_eval_deriv_y(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_deriv_y_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_eval_deriv_xx(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_deriv_xx_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_eval_deriv_yy(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_deriv_yy_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_eval_deriv_xy(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline2d_eval_deriv_xy_e(interp : Gsl_spline2d*, x : LibC::Double, y : LibC::Double, xa : Gsl_interp_accel*, ya : Gsl_interp_accel*, z : LibC::Double*) : LibC::Int
  fun gsl_spline2d_min_size(interp : Gsl_spline2d*) : LibC::SizeT
  fun gsl_spline2d_name(interp : Gsl_spline2d*) : LibC::Char*
  fun gsl_spline2d_set(interp : Gsl_spline2d*, zarr : LibC::Double*, i : LibC::SizeT, j : LibC::SizeT, z : LibC::Double) : LibC::Int
  fun gsl_spline2d_get(interp : Gsl_spline2d*, zarr : LibC::Double*, i : LibC::SizeT, j : LibC::SizeT) : LibC::Double
  fun gsl_spline_alloc(t : Gsl_interp_type*, size : LibC::SizeT) : Gsl_spline*

  struct Gsl_spline
    interp : Gsl_interp*
    x : LibC::Double*
    y : LibC::Double*
    size : LibC::SizeT
  end

  fun gsl_spline_init(spline : Gsl_spline*, xa : LibC::Double*, ya : LibC::Double*, size : LibC::SizeT) : LibC::Int
  fun gsl_spline_name(spline : Gsl_spline*) : LibC::Char*
  fun gsl_spline_min_size(spline : Gsl_spline*) : LibC::UInt
  fun gsl_spline_eval_e(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*, y : LibC::Double*) : LibC::Int
  fun gsl_spline_eval(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline_eval_deriv_e(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*, y : LibC::Double*) : LibC::Int
  fun gsl_spline_eval_deriv(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline_eval_deriv2_e(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*, y : LibC::Double*) : LibC::Int
  fun gsl_spline_eval_deriv2(spline : Gsl_spline*, x : LibC::Double, a : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline_eval_integ_e(spline : Gsl_spline*, a : LibC::Double, b : LibC::Double, acc : Gsl_interp_accel*, y : LibC::Double*) : LibC::Int
  fun gsl_spline_eval_integ(spline : Gsl_spline*, a : LibC::Double, b : LibC::Double, acc : Gsl_interp_accel*) : LibC::Double
  fun gsl_spline_free(spline : Gsl_spline*)
  fun gsl_stats_char_mean(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_variance(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_sd(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_variance_with_fixed_mean(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_sd_with_fixed_mean(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_tss(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_tss_m(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_absdev(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_skew(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_kurtosis(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_lag1_autocorrelation(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_covariance(data1 : LibC::Char*, stride1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_correlation(data1 : LibC::Char*, stride1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_spearman(data1 : LibC::Char*, stride1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_char_variance_m(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_sd_m(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_absdev_m(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_skew_m_sd(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_char_kurtosis_m_sd(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_char_lag1_autocorrelation_m(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_char_covariance_m(data1 : LibC::Char*, stride1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_char_pvariance(data1 : LibC::Char*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_ttest(data1 : LibC::Char*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Char*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_max(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Char
  fun gsl_stats_char_min(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Char
  fun gsl_stats_char_minmax(min : LibC::Char*, max : LibC::Char*, data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_char_max_index(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_char_min_index(data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_char_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_char_median_from_sorted_data(sorted_data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_char_quantile_from_sorted_data(sorted_data : LibC::Char*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_mean(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_variance(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_sd(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_variance_with_fixed_mean(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_sd_with_fixed_mean(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_tss(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_tss_m(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_absdev(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_skew(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_kurtosis(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_lag1_autocorrelation(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_covariance(data1 : LibC::Double*, stride1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_correlation(data1 : LibC::Double*, stride1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_spearman(data1 : LibC::Double*, stride1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_variance_m(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_sd_m(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_absdev_m(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_skew_m_sd(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_kurtosis_m_sd(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_lag1_autocorrelation_m(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_covariance_m(data1 : LibC::Double*, stride1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_wmean(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wvariance(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wsd(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wvariance_with_fixed_mean(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_wsd_with_fixed_mean(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_wtss(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wtss_m(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_wabsdev(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wskew(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wkurtosis(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_wvariance_m(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_wsd_m(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_wabsdev_m(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_wskew_m_sd(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  fun gsl_stats_wkurtosis_m_sd(w : LibC::Double*, wstride : LibC::SizeT, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  fun gsl_stats_pvariance(data1 : LibC::Double*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_ttest(data1 : LibC::Double*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Double*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_max(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_min(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_minmax(min : LibC::Double*, max : LibC::Double*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_max_index(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_min_index(data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_median_from_sorted_data(sorted_data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_quantile_from_sorted_data(sorted_data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_float_mean(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_variance(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_sd(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_variance_with_fixed_mean(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_sd_with_fixed_mean(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_tss(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_tss_m(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_absdev(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_skew(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_kurtosis(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_lag1_autocorrelation(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_covariance(data1 : LibC::Float*, stride1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_correlation(data1 : LibC::Float*, stride1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_spearman(data1 : LibC::Float*, stride1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_float_variance_m(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_sd_m(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_absdev_m(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_skew_m_sd(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_float_kurtosis_m_sd(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_float_lag1_autocorrelation_m(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_covariance_m(data1 : LibC::Float*, stride1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_float_wmean(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wvariance(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wsd(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wvariance_with_fixed_mean(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wsd_with_fixed_mean(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wtss(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wtss_m(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wabsdev(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wskew(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wkurtosis(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_wvariance_m(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wsd_m(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wabsdev_m(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  fun gsl_stats_float_wskew_m_sd(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  fun gsl_stats_float_wkurtosis_m_sd(w : LibC::Float*, wstride : LibC::SizeT, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  fun gsl_stats_float_pvariance(data1 : LibC::Float*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_ttest(data1 : LibC::Float*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Float*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_max(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Float
  fun gsl_stats_float_min(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Float
  fun gsl_stats_float_minmax(min : LibC::Float*, max : LibC::Float*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_float_max_index(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_float_min_index(data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_float_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_float_median_from_sorted_data(sorted_data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_float_quantile_from_sorted_data(sorted_data : LibC::Float*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_mean(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_variance(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_sd(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_variance_with_fixed_mean(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_sd_with_fixed_mean(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_tss(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_tss_m(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_absdev(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_skew(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_kurtosis(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_lag1_autocorrelation(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_covariance(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_correlation(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_spearman(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  # fun gsl_stats_long_double_variance_m(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_sd_m(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_absdev_m(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_skew_m_sd(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_kurtosis_m_sd(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_lag1_autocorrelation_m(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_covariance_m(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wmean(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wvariance(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wsd(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wvariance_with_fixed_mean(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wsd_with_fixed_mean(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wtss(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wtss_m(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wabsdev(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wskew(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wkurtosis(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_wvariance_m(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wsd_m(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wabsdev_m(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wskew_m_sd(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_wkurtosis_m_sd(w : LibC::LongDouble*, wstride : LibC::SizeT, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, wmean : LibC::Double, wsd : LibC::Double) : LibC::Double
  # fun gsl_stats_long_double_pvariance(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_ttest(data1 : LibC::LongDouble*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::LongDouble*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_max(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::LongDouble
  # fun gsl_stats_long_double_min(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::LongDouble
  # fun gsl_stats_long_double_minmax(min : LibC::LongDouble*, max : LibC::LongDouble*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT)
  # fun gsl_stats_long_double_max_index(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  # fun gsl_stats_long_double_min_index(data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  # fun gsl_stats_long_double_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT)
  # fun gsl_stats_long_double_median_from_sorted_data(sorted_data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  # fun gsl_stats_long_double_quantile_from_sorted_data(sorted_data : LibC::LongDouble*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_mean(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_variance(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_sd(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_variance_with_fixed_mean(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_sd_with_fixed_mean(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_tss(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_tss_m(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_absdev(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_skew(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_kurtosis(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_lag1_autocorrelation(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_covariance(data1 : LibC::ULong*, stride1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_correlation(data1 : LibC::ULong*, stride1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_spearman(data1 : LibC::ULong*, stride1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_ulong_variance_m(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_sd_m(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_absdev_m(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_skew_m_sd(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_kurtosis_m_sd(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_lag1_autocorrelation_m(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_covariance_m(data1 : LibC::ULong*, stride1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_ulong_pvariance(data1 : LibC::ULong*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_ttest(data1 : LibC::ULong*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::ULong*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_max(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::ULong
  fun gsl_stats_ulong_min(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::ULong
  fun gsl_stats_ulong_minmax(min : LibC::ULong*, max : LibC::ULong*, data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_ulong_max_index(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_ulong_min_index(data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_ulong_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_ulong_median_from_sorted_data(sorted_data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ulong_quantile_from_sorted_data(sorted_data : LibC::ULong*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_long_mean(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_variance(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_sd(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_variance_with_fixed_mean(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_sd_with_fixed_mean(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_tss(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_tss_m(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_absdev(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_skew(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_kurtosis(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_lag1_autocorrelation(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_covariance(data1 : LibC::Long*, stride1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_correlation(data1 : LibC::Long*, stride1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_spearman(data1 : LibC::Long*, stride1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_long_variance_m(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_sd_m(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_absdev_m(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_skew_m_sd(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_long_kurtosis_m_sd(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_long_lag1_autocorrelation_m(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_long_covariance_m(data1 : LibC::Long*, stride1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_long_pvariance(data1 : LibC::Long*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_ttest(data1 : LibC::Long*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Long*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_max(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Long
  fun gsl_stats_long_min(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Long
  fun gsl_stats_long_minmax(min : LibC::Long*, max : LibC::Long*, data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_long_max_index(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_long_min_index(data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_long_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_long_median_from_sorted_data(sorted_data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_long_quantile_from_sorted_data(sorted_data : LibC::Long*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_uint_mean(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_variance(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_sd(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_variance_with_fixed_mean(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_sd_with_fixed_mean(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_tss(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_tss_m(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_absdev(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_skew(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_kurtosis(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_lag1_autocorrelation(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_covariance(data1 : LibC::UInt*, stride1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_correlation(data1 : LibC::UInt*, stride1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_spearman(data1 : LibC::UInt*, stride1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_uint_variance_m(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_sd_m(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_absdev_m(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_skew_m_sd(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_uint_kurtosis_m_sd(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_uint_lag1_autocorrelation_m(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uint_covariance_m(data1 : LibC::UInt*, stride1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_uint_pvariance(data1 : LibC::UInt*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_ttest(data1 : LibC::UInt*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::UInt*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_max(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::UInt
  fun gsl_stats_uint_min(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::UInt
  fun gsl_stats_uint_minmax(min : LibC::UInt*, max : LibC::UInt*, data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_uint_max_index(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_uint_min_index(data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_uint_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_uint_median_from_sorted_data(sorted_data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uint_quantile_from_sorted_data(sorted_data : LibC::UInt*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_int_mean(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_variance(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_sd(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_variance_with_fixed_mean(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_sd_with_fixed_mean(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_tss(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_tss_m(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_absdev(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_skew(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_kurtosis(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_lag1_autocorrelation(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_covariance(data1 : LibC::Int*, stride1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_correlation(data1 : LibC::Int*, stride1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_spearman(data1 : LibC::Int*, stride1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_int_variance_m(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_sd_m(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_absdev_m(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_skew_m_sd(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_int_kurtosis_m_sd(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_int_lag1_autocorrelation_m(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_int_covariance_m(data1 : LibC::Int*, stride1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_int_pvariance(data1 : LibC::Int*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_ttest(data1 : LibC::Int*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Int*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_max(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_stats_int_min(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Int
  fun gsl_stats_int_minmax(min : LibC::Int*, max : LibC::Int*, data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_int_max_index(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_int_min_index(data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_int_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_int_median_from_sorted_data(sorted_data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_int_quantile_from_sorted_data(sorted_data : LibC::Int*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_mean(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_variance(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_sd(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_variance_with_fixed_mean(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_sd_with_fixed_mean(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_tss(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_tss_m(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_absdev(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_skew(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_kurtosis(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_lag1_autocorrelation(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_covariance(data1 : LibC::UShort*, stride1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_correlation(data1 : LibC::UShort*, stride1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_spearman(data1 : LibC::UShort*, stride1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_ushort_variance_m(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_sd_m(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_absdev_m(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_skew_m_sd(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_kurtosis_m_sd(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_lag1_autocorrelation_m(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_covariance_m(data1 : LibC::UShort*, stride1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_ushort_pvariance(data1 : LibC::UShort*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_ttest(data1 : LibC::UShort*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::UShort*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_max(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::UShort
  fun gsl_stats_ushort_min(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::UShort
  fun gsl_stats_ushort_minmax(min : LibC::UShort*, max : LibC::UShort*, data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_ushort_max_index(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_ushort_min_index(data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_ushort_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_ushort_median_from_sorted_data(sorted_data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_ushort_quantile_from_sorted_data(sorted_data : LibC::UShort*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_short_mean(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_variance(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_sd(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_variance_with_fixed_mean(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_sd_with_fixed_mean(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_tss(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_tss_m(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_absdev(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_skew(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_kurtosis(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_lag1_autocorrelation(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_covariance(data1 : LibC::Short*, stride1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_correlation(data1 : LibC::Short*, stride1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_spearman(data1 : LibC::Short*, stride1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_short_variance_m(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_sd_m(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_absdev_m(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_skew_m_sd(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_short_kurtosis_m_sd(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_short_lag1_autocorrelation_m(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_short_covariance_m(data1 : LibC::Short*, stride1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_short_pvariance(data1 : LibC::Short*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_ttest(data1 : LibC::Short*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : LibC::Short*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_max(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Short
  fun gsl_stats_short_min(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Short
  fun gsl_stats_short_minmax(min : LibC::Short*, max : LibC::Short*, data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_short_max_index(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_short_min_index(data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_short_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_short_median_from_sorted_data(sorted_data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_short_quantile_from_sorted_data(sorted_data : LibC::Short*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_mean(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_variance(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_sd(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_variance_with_fixed_mean(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_sd_with_fixed_mean(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_tss(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_tss_m(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_absdev(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_skew(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_kurtosis(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_lag1_autocorrelation(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_covariance(data1 : UInt8*, stride1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_correlation(data1 : UInt8*, stride1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_spearman(data1 : UInt8*, stride1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n : LibC::SizeT, work : LibC::Double*) : LibC::Double
  fun gsl_stats_uchar_variance_m(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_sd_m(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_absdev_m(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_skew_m_sd(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_kurtosis_m_sd(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double, sd : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_lag1_autocorrelation_m(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, mean : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_covariance_m(data1 : UInt8*, stride1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n : LibC::SizeT, mean1 : LibC::Double, mean2 : LibC::Double) : LibC::Double
  fun gsl_stats_uchar_pvariance(data1 : UInt8*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_ttest(data1 : UInt8*, stride1 : LibC::SizeT, n1 : LibC::SizeT, data2 : UInt8*, stride2 : LibC::SizeT, n2 : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_max(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : UInt8
  fun gsl_stats_uchar_min(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : UInt8
  fun gsl_stats_uchar_minmax(min : UInt8*, max : UInt8*, data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_uchar_max_index(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_uchar_min_index(data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::SizeT
  fun gsl_stats_uchar_minmax_index(min_index : LibC::SizeT*, max_index : LibC::SizeT*, data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT)
  fun gsl_stats_uchar_median_from_sorted_data(sorted_data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT) : LibC::Double
  fun gsl_stats_uchar_quantile_from_sorted_data(sorted_data : UInt8*, stride : LibC::SizeT, n : LibC::SizeT, f : LibC::Double) : LibC::Double
  fun gsl_sum_levin_u_alloc(n : LibC::SizeT) : Gsl_sum_levin_u_workspace*

  struct Gsl_sum_levin_u_workspace
    size : LibC::SizeT
    i : LibC::SizeT
    terms_used : LibC::SizeT
    sum_plain : LibC::Double
    q_num : LibC::Double*
    q_den : LibC::Double*
    dq_num : LibC::Double*
    dq_den : LibC::Double*
    dsum : LibC::Double*
  end

  fun gsl_sum_levin_u_free(w : Gsl_sum_levin_u_workspace*)
  fun gsl_sum_levin_u_accel(array : LibC::Double*, n : LibC::SizeT, w : Gsl_sum_levin_u_workspace*, sum_accel : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_sum_levin_u_minmax(array : LibC::Double*, n : LibC::SizeT, min_terms : LibC::SizeT, max_terms : LibC::SizeT, w : Gsl_sum_levin_u_workspace*, sum_accel : LibC::Double*, abserr : LibC::Double*) : LibC::Int
  fun gsl_sum_levin_u_step(term : LibC::Double, n : LibC::SizeT, nmax : LibC::SizeT, w : Gsl_sum_levin_u_workspace*, sum_accel : LibC::Double*) : LibC::Int
  fun gsl_sum_levin_utrunc_alloc(n : LibC::SizeT) : Gsl_sum_levin_utrunc_workspace*

  struct Gsl_sum_levin_utrunc_workspace
    size : LibC::SizeT
    i : LibC::SizeT
    terms_used : LibC::SizeT
    sum_plain : LibC::Double
    q_num : LibC::Double*
    q_den : LibC::Double*
    dsum : LibC::Double*
  end

  fun gsl_sum_levin_utrunc_free(w : Gsl_sum_levin_utrunc_workspace*)
  fun gsl_sum_levin_utrunc_accel(array : LibC::Double*, n : LibC::SizeT, w : Gsl_sum_levin_utrunc_workspace*, sum_accel : LibC::Double*, abserr_trunc : LibC::Double*) : LibC::Int
  fun gsl_sum_levin_utrunc_minmax(array : LibC::Double*, n : LibC::SizeT, min_terms : LibC::SizeT, max_terms : LibC::SizeT, w : Gsl_sum_levin_utrunc_workspace*, sum_accel : LibC::Double*, abserr_trunc : LibC::Double*) : LibC::Int
  fun gsl_sum_levin_utrunc_step(term : LibC::Double, n : LibC::SizeT, w : Gsl_sum_levin_utrunc_workspace*, sum_accel : LibC::Double*) : LibC::Int
  fun gsl_test(status : LibC::Int, test_description : LibC::Char*, ...)
  fun gsl_test_rel(result : LibC::Double, expected : LibC::Double, relative_error : LibC::Double, test_description : LibC::Char*, ...)
  fun gsl_test_abs(result : LibC::Double, expected : LibC::Double, absolute_error : LibC::Double, test_description : LibC::Char*, ...)
  fun gsl_test_factor(result : LibC::Double, expected : LibC::Double, factor : LibC::Double, test_description : LibC::Char*, ...)
  fun gsl_test_int(result : LibC::Int, expected : LibC::Int, test_description : LibC::Char*, ...)
  fun gsl_test_str(result : LibC::Char*, expected : LibC::Char*, test_description : LibC::Char*, ...)
  fun gsl_test_verbose(verbose : LibC::Int)
  fun gsl_test_summary : LibC::Int

  struct Gsl_wavelet_type
    name : LibC::Char*
    init : (LibC::Double**, LibC::Double**, LibC::Double**, LibC::Double**, LibC::SizeT*, LibC::SizeT*, LibC::SizeT -> LibC::Int)
  end

  fun gsl_wavelet_alloc(t : Gsl_wavelet_type*, k : LibC::SizeT) : Gsl_wavelet*

  struct Gsl_wavelet
    type : Gsl_wavelet_type*
    h1 : LibC::Double*
    g1 : LibC::Double*
    h2 : LibC::Double*
    g2 : LibC::Double*
    nc : LibC::SizeT
    offset : LibC::SizeT
  end

  fun gsl_wavelet_free(w : Gsl_wavelet*)
  fun gsl_wavelet_name(w : Gsl_wavelet*) : LibC::Char*
  fun gsl_wavelet_workspace_alloc(n : LibC::SizeT) : Gsl_wavelet_workspace*

  struct Gsl_wavelet_workspace
    scratch : LibC::Double*
    n : LibC::SizeT
  end

  fun gsl_wavelet_workspace_free(work : Gsl_wavelet_workspace*)
  fun gsl_wavelet_transform(w : Gsl_wavelet*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, dir : Gsl_wavelet_direction, work : Gsl_wavelet_workspace*) : LibC::Int
  enum Gsl_wavelet_direction
    Gsl_wavelet_forward  =  1
    Gsl_wavelet_backward = -1
  end
  fun gsl_wavelet_transform_forward(w : Gsl_wavelet*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet_transform_inverse(w : Gsl_wavelet*, data : LibC::Double*, stride : LibC::SizeT, n : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, dir : Gsl_wavelet_direction, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform_forward(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform_inverse(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, dir : Gsl_wavelet_direction, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform_forward(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform_inverse(w : Gsl_wavelet*, data : LibC::Double*, tda : LibC::SizeT, size1 : LibC::SizeT, size2 : LibC::SizeT, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform_matrix(w : Gsl_wavelet*, a : Gsl_matrix*, dir : Gsl_wavelet_direction, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform_matrix_forward(w : Gsl_wavelet*, a : Gsl_matrix*, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_transform_matrix_inverse(w : Gsl_wavelet*, a : Gsl_matrix*, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform_matrix(w : Gsl_wavelet*, a : Gsl_matrix*, dir : Gsl_wavelet_direction, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform_matrix_forward(w : Gsl_wavelet*, a : Gsl_matrix*, work : Gsl_wavelet_workspace*) : LibC::Int
  fun gsl_wavelet2d_nstransform_matrix_inverse(w : Gsl_wavelet*, a : Gsl_matrix*, work : Gsl_wavelet_workspace*) : LibC::Int
  $gsl_check_range : LibC::Int
  $gsl_prec_eps : LibC::Double*
  $gsl_prec_sqrt_eps : LibC::Double*
  $gsl_prec_root3_eps : LibC::Double*
  $gsl_prec_root4_eps : LibC::Double*
  $gsl_prec_root5_eps : LibC::Double*
  $gsl_prec_root6_eps : LibC::Double*
  $gsl_integration_fixed_legendre : Gsl_integration_fixed_type*
  $gsl_integration_fixed_chebyshev : Gsl_integration_fixed_type*
  $gsl_integration_fixed_gegenbauer : Gsl_integration_fixed_type*
  $gsl_integration_fixed_jacobi : Gsl_integration_fixed_type*
  $gsl_integration_fixed_laguerre : Gsl_integration_fixed_type*
  $gsl_integration_fixed_hermite : Gsl_integration_fixed_type*
  $gsl_integration_fixed_exponential : Gsl_integration_fixed_type*
  $gsl_integration_fixed_rational : Gsl_integration_fixed_type*
  $gsl_integration_fixed_chebyshev2 : Gsl_integration_fixed_type*
  $gsl_interp_linear : Gsl_interp_type*
  $gsl_interp_polynomial : Gsl_interp_type*
  $gsl_interp_cspline : Gsl_interp_type*
  $gsl_interp_cspline_periodic : Gsl_interp_type*
  $gsl_interp_akima : Gsl_interp_type*
  $gsl_interp_akima_periodic : Gsl_interp_type*
  $gsl_interp_steffen : Gsl_interp_type*
  $gsl_interp2d_bilinear : Gsl_interp2d_type*
  $gsl_interp2d_bicubic : Gsl_interp2d_type*
  $gsl_message_mask : LibC::UInt
  $gsl_min_fminimizer_goldensection : Gsl_min_fminimizer_type*
  $gsl_min_fminimizer_brent : Gsl_min_fminimizer_type*
  $gsl_min_fminimizer_quad_golden : Gsl_min_fminimizer_type*
  $gsl_rng_borosh13 : Gsl_rng_type*
  $gsl_rng_coveyou : Gsl_rng_type*
  $gsl_rng_cmrg : Gsl_rng_type*
  $gsl_rng_fishman18 : Gsl_rng_type*
  $gsl_rng_fishman20 : Gsl_rng_type*
  $gsl_rng_fishman2x : Gsl_rng_type*
  $gsl_rng_gfsr4 : Gsl_rng_type*
  $gsl_rng_knuthran : Gsl_rng_type*
  $gsl_rng_knuthran2 : Gsl_rng_type*
  $gsl_rng_knuthran2002 : Gsl_rng_type*
  $gsl_rng_lecuyer21 : Gsl_rng_type*
  $gsl_rng_minstd : Gsl_rng_type*
  $gsl_rng_mrg : Gsl_rng_type*
  $gsl_rng_mt19937 : Gsl_rng_type*
  $gsl_rng_mt19937_1999 : Gsl_rng_type*
  $gsl_rng_mt19937_1998 : Gsl_rng_type*
  $gsl_rng_r250 : Gsl_rng_type*
  $gsl_rng_ran0 : Gsl_rng_type*
  $gsl_rng_ran1 : Gsl_rng_type*
  $gsl_rng_ran2 : Gsl_rng_type*
  $gsl_rng_ran3 : Gsl_rng_type*
  $gsl_rng_rand : Gsl_rng_type*
  $gsl_rng_rand48 : Gsl_rng_type*
  $gsl_rng_random128_bsd : Gsl_rng_type*
  $gsl_rng_random128_glibc2 : Gsl_rng_type*
  $gsl_rng_random128_libc5 : Gsl_rng_type*
  $gsl_rng_random256_bsd : Gsl_rng_type*
  $gsl_rng_random256_glibc2 : Gsl_rng_type*
  $gsl_rng_random256_libc5 : Gsl_rng_type*
  $gsl_rng_random32_bsd : Gsl_rng_type*
  $gsl_rng_random32_glibc2 : Gsl_rng_type*
  $gsl_rng_random32_libc5 : Gsl_rng_type*
  $gsl_rng_random64_bsd : Gsl_rng_type*
  $gsl_rng_random64_glibc2 : Gsl_rng_type*
  $gsl_rng_random64_libc5 : Gsl_rng_type*
  $gsl_rng_random8_bsd : Gsl_rng_type*
  $gsl_rng_random8_glibc2 : Gsl_rng_type*
  $gsl_rng_random8_libc5 : Gsl_rng_type*
  $gsl_rng_random_bsd : Gsl_rng_type*
  $gsl_rng_random_glibc2 : Gsl_rng_type*
  $gsl_rng_random_libc5 : Gsl_rng_type*
  $gsl_rng_randu : Gsl_rng_type*
  $gsl_rng_ranf : Gsl_rng_type*
  $gsl_rng_ranlux : Gsl_rng_type*
  $gsl_rng_ranlux389 : Gsl_rng_type*
  $gsl_rng_ranlxd1 : Gsl_rng_type*
  $gsl_rng_ranlxd2 : Gsl_rng_type*
  $gsl_rng_ranlxs0 : Gsl_rng_type*
  $gsl_rng_ranlxs1 : Gsl_rng_type*
  $gsl_rng_ranlxs2 : Gsl_rng_type*
  $gsl_rng_ranmar : Gsl_rng_type*
  $gsl_rng_slatec : Gsl_rng_type*
  $gsl_rng_taus : Gsl_rng_type*
  $gsl_rng_taus2 : Gsl_rng_type*
  $gsl_rng_taus113 : Gsl_rng_type*
  $gsl_rng_transputer : Gsl_rng_type*
  $gsl_rng_tt800 : Gsl_rng_type*
  $gsl_rng_uni : Gsl_rng_type*
  $gsl_rng_uni32 : Gsl_rng_type*
  $gsl_rng_vax : Gsl_rng_type*
  $gsl_rng_waterman14 : Gsl_rng_type*
  $gsl_rng_zuf : Gsl_rng_type*
  $gsl_rng_default : Gsl_rng_type*
  $gsl_rng_default_seed : LibC::ULong
  $gsl_multifit_robust_default : Gsl_multifit_robust_type*
  $gsl_multifit_robust_bisquare : Gsl_multifit_robust_type*
  $gsl_multifit_robust_cauchy : Gsl_multifit_robust_type*
  $gsl_multifit_robust_fair : Gsl_multifit_robust_type*
  $gsl_multifit_robust_huber : Gsl_multifit_robust_type*
  $gsl_multifit_robust_ols : Gsl_multifit_robust_type*
  $gsl_multifit_robust_welsch : Gsl_multifit_robust_type*
  $gsl_multifit_nlinear_trust : Gsl_multifit_nlinear_type*
  $gsl_multifit_nlinear_trs_lm : Gsl_multifit_nlinear_trs*
  $gsl_multifit_nlinear_trs_lmaccel : Gsl_multifit_nlinear_trs*
  $gsl_multifit_nlinear_trs_dogleg : Gsl_multifit_nlinear_trs*
  $gsl_multifit_nlinear_trs_ddogleg : Gsl_multifit_nlinear_trs*
  $gsl_multifit_nlinear_trs_subspace2D : Gsl_multifit_nlinear_trs*
  $gsl_multifit_nlinear_scale_levenberg : Gsl_multifit_nlinear_scale*
  $gsl_multifit_nlinear_scale_marquardt : Gsl_multifit_nlinear_scale*
  $gsl_multifit_nlinear_scale_more : Gsl_multifit_nlinear_scale*
  $gsl_multifit_nlinear_solver_cholesky : Gsl_multifit_nlinear_solver*
  $gsl_multifit_nlinear_solver_qr : Gsl_multifit_nlinear_solver*
  $gsl_multifit_nlinear_solver_svd : Gsl_multifit_nlinear_solver*
  $gsl_multifit_fdfsolver_lmsder : Gsl_multifit_fdfsolver_type*
  $gsl_multifit_fdfsolver_lmder : Gsl_multifit_fdfsolver_type*
  $gsl_multifit_fdfsolver_lmniel : Gsl_multifit_fdfsolver_type*
  $gsl_multilarge_linear_normal : Gsl_multilarge_linear_type*
  $gsl_multilarge_linear_tsqr : Gsl_multilarge_linear_type*
  $gsl_multilarge_nlinear_trust : Gsl_multilarge_nlinear_type*
  $gsl_multilarge_nlinear_trs_lm : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_trs_lmaccel : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_trs_dogleg : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_trs_ddogleg : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_trs_subspace2D : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_trs_cgst : Gsl_multilarge_nlinear_trs*
  $gsl_multilarge_nlinear_scale_levenberg : Gsl_multilarge_nlinear_scale*
  $gsl_multilarge_nlinear_scale_marquardt : Gsl_multilarge_nlinear_scale*
  $gsl_multilarge_nlinear_scale_more : Gsl_multilarge_nlinear_scale*
  $gsl_multilarge_nlinear_solver_cholesky : Gsl_multilarge_nlinear_solver*
  $gsl_multilarge_nlinear_solver_none : Gsl_multilarge_nlinear_solver*
  $gsl_multimin_fdfminimizer_steepest_descent : Gsl_multimin_fdfminimizer_type*
  $gsl_multimin_fdfminimizer_conjugate_pr : Gsl_multimin_fdfminimizer_type*
  $gsl_multimin_fdfminimizer_conjugate_fr : Gsl_multimin_fdfminimizer_type*
  $gsl_multimin_fdfminimizer_vector_bfgs : Gsl_multimin_fdfminimizer_type*
  $gsl_multimin_fdfminimizer_vector_bfgs2 : Gsl_multimin_fdfminimizer_type*
  $gsl_multimin_fminimizer_nmsimplex : Gsl_multimin_fminimizer_type*
  $gsl_multimin_fminimizer_nmsimplex2 : Gsl_multimin_fminimizer_type*
  $gsl_multimin_fminimizer_nmsimplex2rand : Gsl_multimin_fminimizer_type*
  $gsl_multiroot_fsolver_dnewton : Gsl_multiroot_fsolver_type*
  $gsl_multiroot_fsolver_broyden : Gsl_multiroot_fsolver_type*
  $gsl_multiroot_fsolver_hybrid : Gsl_multiroot_fsolver_type*
  $gsl_multiroot_fsolver_hybrids : Gsl_multiroot_fsolver_type*
  $gsl_multiroot_fdfsolver_newton : Gsl_multiroot_fdf_solver_type*
  $gsl_multiroot_fdfsolver_gnewton : Gsl_multiroot_fdf_solver_type*
  $gsl_multiroot_fdfsolver_hybridj : Gsl_multiroot_fdf_solver_type*
  $gsl_multiroot_fdfsolver_hybridsj : Gsl_multiroot_fdf_solver_type*
  $gsl_odeiv2_step_rk2 : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rk4 : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rkf45 : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rkck : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rk8pd : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rk2imp : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rk4imp : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_bsimp : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_rk1imp : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_msadams : Gsl_odeiv2_step_type*
  $gsl_odeiv2_step_msbdf : Gsl_odeiv2_step_type*
  $gsl_odeiv_step_rk2 : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rk4 : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rkf45 : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rkck : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rk8pd : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rk2imp : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rk2simp : Gsl_odeiv_step_type*
  $gsl_odeiv_step_rk4imp : Gsl_odeiv_step_type*
  $gsl_odeiv_step_bsimp : Gsl_odeiv_step_type*
  $gsl_odeiv_step_gear1 : Gsl_odeiv_step_type*
  $gsl_odeiv_step_gear2 : Gsl_odeiv_step_type*
  $gsl_qrng_niederreiter_2 : Gsl_qrng_type*
  $gsl_qrng_sobol : Gsl_qrng_type*
  $gsl_qrng_halton : Gsl_qrng_type*
  $gsl_qrng_reversehalton : Gsl_qrng_type*
  $gsl_root_fsolver_bisection : Gsl_root_fsolver_type*
  $gsl_root_fsolver_brent : Gsl_root_fsolver_type*
  $gsl_root_fsolver_falsepos : Gsl_root_fsolver_type*
  $gsl_root_fdfsolver_newton : Gsl_root_fdfsolver_type*
  $gsl_root_fdfsolver_secant : Gsl_root_fdfsolver_type*
  $gsl_root_fdfsolver_steffenson : Gsl_root_fdfsolver_type*
  $gsl_splinalg_itersolve_gmres : Gsl_splinalg_itersolve_type*
  $gsl_version : LibC::Char*
  $gsl_wavelet_daubechies : Gsl_wavelet_type*
  $gsl_wavelet_daubechies_centered : Gsl_wavelet_type*
  $gsl_wavelet_haar : Gsl_wavelet_type*
  $gsl_wavelet_haar_centered : Gsl_wavelet_type*
  $gsl_wavelet_bspline : Gsl_wavelet_type*
  $gsl_wavelet_bspline_centered : Gsl_wavelet_type*
end

module GSL
  RNG = LibGSL.gsl_rng_alloc(LibGSL.gsl_rng_env_setup)
end
