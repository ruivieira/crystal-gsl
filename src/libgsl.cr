@[Link("gsl")]
lib LibGSL

  struct Gsl_rng_type
    name : UInt8*
  end

  struct Gsl_rng
    type : Gsl_rng_type*
  end

  fun gsl_rng_alloc(t : Gsl_rng_type*) : Gsl_rng*
  fun gsl_rng_types_setup() : LibC::Double**
  fun gsl_rng_env_setup() : Gsl_rng_type*
  fun gsl_rng_name (r : Gsl_rng) : UInt8
  fun gsl_ran_gaussian(r : Gsl_rng*, sigma : Float64) : Float64
  fun gsl_ran_gaussian_pdf(x : Float64, sigma : Float64) : Float64

  # gamma distribution
  fun gsl_ran_gamma(r : Gsl_rng*, a : Float64, b : Float64) : Float64
  fun gsl_ran_gamma_pdf(x : Float64, a : Float64, b : Float64) : Float64

  # exponential distribution
  fun gsl_ran_exponential(r : Gsl_rng*, mu : Float64) : Float64
  fun gsl_ran_exponential_pdf(x : Float64, mu : Float64) : Float64

  fun gsl_cdf_exponential_P(x : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Q(x : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Pinv(p : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Qinv(q : Float64, mu : Float64) : Float64

  # Poisson distribution
  fun gsl_ran_poisson(r : Gsl_rng*, mu : Float64) : UInt64
  fun gsl_ran_poisson_pdf(k : UInt64, mu : Float64) : Float64
  fun gsl_cdf_poisson_P(k : UInt64, mu : Float64) : Float64
  fun gsl_cdf_poisson_Q(k : UInt64, mu : Float64) : Float64

  # matrices

  struct Gsl_matrix
    size1 : Int32
    size2 : Int32
    tda   : LibC::SizeT
    data  : LibC::Double*
    block : Gsl_block*
    owner : Int32
  end

  struct Gsl_block
    size  : Int32
    data  : LibC::Double*
  end

  fun gsl_matrix_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix*
  fun gsl_matrix_get(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : Float64
  fun gsl_matrix_set(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT, x : Float64) : Void

  fun gsl_matrix_get_row (v : Gsl_vector*, m : Gsl_matrix*, i : Int32) : Int32
  fun gsl_matrix_set_row(m : Gsl_matrix*, i : Int32, v : Gsl_vector*) : Int32

  fun gsl_matrix_get_col (v : Gsl_vector*, m : Gsl_matrix*, j : Int32) : Int32
  fun gsl_matrix_set_col (m : Gsl_matrix*, j : Int32, v : Gsl_vector*) : Int32

  fun gsl_matrix_transpose(m : Gsl_matrix*) : Int32
  fun gsl_matrix_memcpy(dest : Gsl_matrix*, src : Gsl_matrix*) : Int32
  fun gsl_matrix_free (m : Gsl_matrix*) : Void

  # vectors

  struct Gsl_vector
    size : Int32
    stride : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block*
    owner : Int32
  end

  fun gsl_vector_calloc(n : LibC::SizeT) : Gsl_vector*
  fun gsl_vector_get(v : Gsl_vector*, i : LibC::SizeT) : Float64
  fun gsl_vector_set (v : Gsl_vector*, i : LibC::SizeT, x : Float64) : Void
  fun gsl_vector_add (a : Gsl_vector*, b : Gsl_vector*) : Int32

  # matrix - vector multiplication
  enum CBLAS_TRANSPOSE_t
    CblasNoTrans=111
    CblasTrans=112
    CblasConjTrans=113
  end

  enum CBLAS_UPLO_t
    CblasUpper=121
    CblasLower=122
  end

  enum CBLAS_DIAG_t
    CblasNonUnit=131
    CblasUnit=132
  end

  # Linear algebra

  fun gsl_blas_dgemv(trans : CBLAS_TRANSPOSE_t, alpha : Float64, a : Gsl_matrix*, x : Gsl_vector*, beta : Float64, y : Gsl_vector*)
  fun gsl_linalg_cholesky_decomp (a : Gsl_matrix*) : Int32
  fun gsl_blas_dtrmv (uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix*, x : Gsl_vector*) : Int32

end

$rng = LibGSL.gsl_rng_alloc(LibGSL.gsl_rng_env_setup())
