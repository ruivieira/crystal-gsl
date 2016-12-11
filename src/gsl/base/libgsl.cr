@[Link("gsl")]
lib LibGSL
  struct Gsl_rng_type
    name : UInt8*
  end

  # # Structures

  # RNG structure
  struct Gsl_rng
    type : Gsl_rng_type*
  end

  fun gsl_rng_alloc(t : Gsl_rng_type*) : Gsl_rng*
  fun gsl_rng_types_setup : LibC::Double**
  fun gsl_rng_env_setup : Gsl_rng_type*
  fun gsl_rng_name(r : Gsl_rng) : UInt8
  fun gsl_ran_gaussian(r : Gsl_rng*, sigma : Float64) : Float64
  fun gsl_ran_gaussian_pdf(x : Float64, sigma : Float64) : Float64

  # Binomial distribution
  fun gsl_ran_binomial(r : Gsl_rng*, p : Float64, n : UInt64) : UInt64
  fun gsl_ran_binomial_pdf(k : UInt64, p : Float64, n : UInt64) : Float64
  fun gsl_cdf_binomial_P(k : UInt64, p : Float64, n : UInt64) : Float64
  fun gsl_cdf_binomial_Q(k : UInt64, p : Float64, n : UInt64) : Float64

  # Chi square distribution
  fun gsl_ran_chisq(r : Gsl_rng*, nu : Float64) : Float64
  fun gsl_ran_chisq_pdf(x : Float64, nu : Float64) : Float64
  fun gsl_cdf_chisq_P(x : Float64, nu : Float64) : Float64
  fun gsl_cdf_chisq_Q(x : Float64, nu : Float64) : Float64
  fun gsl_cdf_chisq_Pinv(p : Float64, nu : Float64) : Float64
  fun gsl_cdf_chisq_Qinv(q : Float64, nu : Float64) : Float64

  # Gamma distribution
  fun gsl_ran_gamma(r : Gsl_rng*, a : Float64, b : Float64) : Float64
  fun gsl_ran_gamma_pdf(x : Float64, a : Float64, b : Float64) : Float64

  # Exponential distribution
  fun gsl_ran_exponential(r : Gsl_rng*, mu : Float64) : Float64
  fun gsl_ran_exponential_pdf(x : Float64, mu : Float64) : Float64

  fun gsl_cdf_exponential_P(x : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Q(x : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Pinv(p : Float64, mu : Float64) : Float64
  fun gsl_cdf_exponential_Qinv(q : Float64, mu : Float64) : Float64

  # Permutations

  struct Gsl_permutation
    size : LibC::SizeT
    data : LibC::SizeT*
  end

  fun gsl_permutation_alloc(n : LibC::SizeT) : Gsl_permutation*
  fun gsl_permutation_calloc(n : LibC::SizeT) : Gsl_permutation*
  fun gsl_permutation_init(p : Gsl_permutation*) : Void

  fun gsl_permutation_get(p : Gsl_permutation*, i : LibC::SizeT) : LibC::SizeT
  fun gsl_permutation_size(p : Gsl_permutation*) : LibC::SizeT
  fun gsl_permutation_data(p : Gsl_permutation*) : LibC::SizeT*
  fun gsl_permutation_valid(p : Gsl_permutation*) : UInt32
  fun gsl_permute(p : LibC::SizeT*, data : Float64*, stride : LibC::SizeT, n : LibC::SizeT) : Int32
  fun gsl_permutation_next(p : Gsl_permutation*) : Int32
  fun gsl_permutation_prev(p : Gsl_permutation*) : Int32

  # Poisson distribution
  fun gsl_ran_poisson(r : Gsl_rng*, mu : Float64) : UInt64
  fun gsl_ran_poisson_pdf(k : UInt64, mu : Float64) : Float64
  fun gsl_cdf_poisson_P(k : UInt64, mu : Float64) : Float64
  fun gsl_cdf_poisson_Q(k : UInt64, mu : Float64) : Float64

  # Multinomial distribution
  fun gsl_ran_multinomial(r : Gsl_rng*,
                          k : LibC::SizeT, n : UInt64, p : Float64*, ns : UInt64*) : Void

  # Uniform distribution
  fun gsl_ran_flat(r : Gsl_rng*, a : Float64, b : Float64) : Float64

  # # histograms
  # Histogram structure
  struct Gsl_histogram
    n : LibC::SizeT
    range : Float64*
    bin : Float64*
  end

  fun gsl_histogram_alloc(n : LibC::SizeT) : Gsl_histogram*
  fun gsl_histogram_set_ranges(h : Gsl_histogram*, range : Float64*, size : LibC::SizeT) : Int64
  fun gsl_histogram_set_ranges_uniform(h : Gsl_histogram*, xmin : Float64, xmax : Float64) : Int64
  fun gsl_histogram_free(h : Gsl_histogram*) : Void

  fun gsl_histogram_increment(h : Gsl_histogram*, x : Float64) : Int64
  fun gsl_histogram_accumulate(h : Gsl_histogram*, x : Float64, weight : Float64)
  fun gsl_histogram_get(h : Gsl_histogram*, i : LibC::SizeT) : Float64
  fun gsl_histogram_get_range(h : Gsl_histogram*, i : LibC::SizeT, lower : Float64*, upper : Float64*) : Int64

  fun gsl_histogram_find(h : Gsl_histogram*, x : Float64, i : LibC::SizeT*) : Int32

  fun gsl_histogram_max_val(h : Gsl_histogram*) : Float64
  fun gsl_histogram_min_val(h : Gsl_histogram*) : Float64
  fun gsl_histogram_max_bin(h : Gsl_histogram*) : LibC::SizeT
  fun gsl_histogram_min_bin(h : Gsl_histogram*) : LibC::SizeT
  fun gsl_histogram_mean(h : Gsl_histogram*) : Float64
  fun gsl_histogram_sigma(h : Gsl_histogram*) : Float64
  fun gsl_histogram_sum(h : Gsl_histogram*) : Float64

  fun gsl_histogram_equal_bins_p(h1 : Gsl_histogram*, h2 : Gsl_histogram*) : Int32
  fun gsl_histogram_clone(src : Gsl_histogram*) : Gsl_histogram*

  fun gsl_histogram_add(h1 : Gsl_histogram*, h2 : Gsl_histogram*)
  fun gsl_histogram_sub(h1 : Gsl_histogram*, h2 : Gsl_histogram*)
  fun gsl_histogram_mul(h1 : Gsl_histogram*, h2 : Gsl_histogram*)
  fun gsl_histogram_div(h1 : Gsl_histogram*, h2 : Gsl_histogram*)
  fun gsl_histogram_scale(h : Gsl_histogram*, scale : Float64)
  fun gsl_histogram_shift(h : Gsl_histogram*, offset : Float64)

  # # matrices

  struct Gsl_matrix
    size1 : Int32
    size2 : Int32
    tda : LibC::SizeT
    data : LibC::Double*
    block : Gsl_block*
    owner : Int32
  end

  struct Gsl_block
    size : Int32
    data : LibC::Double*
  end

  fun gsl_matrix_calloc(n1 : LibC::SizeT, n2 : LibC::SizeT) : Gsl_matrix*
  fun gsl_matrix_get(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT) : Float64
  fun gsl_matrix_set(m : Gsl_matrix*, i : LibC::SizeT, j : LibC::SizeT, x : Float64) : Void

  fun gsl_matrix_get_row(v : Gsl_vector*, m : Gsl_matrix*, i : Int32) : Int32
  fun gsl_matrix_set_row(m : Gsl_matrix*, i : Int32, v : Gsl_vector*) : Int32

  fun gsl_matrix_get_col(v : Gsl_vector*, m : Gsl_matrix*, j : Int32) : Int32
  fun gsl_matrix_set_col(m : Gsl_matrix*, j : Int32, v : Gsl_vector*) : Int32

  fun gsl_matrix_transpose(m : Gsl_matrix*) : Int32
  fun gsl_matrix_memcpy(dest : Gsl_matrix*, src : Gsl_matrix*) : Int32
  fun gsl_matrix_free(m : Gsl_matrix*) : Void

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
  fun gsl_vector_set(v : Gsl_vector*, i : LibC::SizeT, x : Float64) : Void
  fun gsl_vector_add(a : Gsl_vector*, b : Gsl_vector*) : Int32
  fun gsl_vector_sub(a : Gsl_vector*, b : Gsl_vector*) : Int32
  fun gsl_vector_mul(a : Gsl_vector*, b : Gsl_vector*) : Int32
  fun gsl_vector_div(a : Gsl_vector*, b : Gsl_vector*) : Int32
  fun gsl_vector_scale(a : Gsl_vector*, b : LibC::Double) : Int32
  fun gsl_vector_add_constant(a : Gsl_vector*, b : LibC::Double) : Int32

  # matrix - vector multiplication
  enum CBLAS_TRANSPOSE_t
    CblasNoTrans   = 111
    CblasTrans     = 112
    CblasConjTrans = 113
  end

  enum CBLAS_UPLO_t
    CblasUpper = 121
    CblasLower = 122
  end

  enum CBLAS_DIAG_t
    CblasNonUnit = 131
    CblasUnit    = 132
  end

  # Linear algebra

  fun gsl_blas_dgemv(trans : CBLAS_TRANSPOSE_t, alpha : Float64, a : Gsl_matrix*, x : Gsl_vector*, beta : Float64, y : Gsl_vector*)
  fun gsl_linalg_cholesky_decomp(a : Gsl_matrix*) : Int32
  fun gsl_blas_dtrmv(uplo : CBLAS_UPLO_t, trans : CBLAS_TRANSPOSE_t, diag : CBLAS_DIAG_t, a : Gsl_matrix*, x : Gsl_vector*) : Int32

  # Inference
  fun gsl_fit_linear(x : Float64*, xstride : LibC::SizeT, y : Float64*, ystride : LibC::SizeT, n : LibC::SizeT, c0 : Float64*, c1 : Float64*, cov00 : Float64*, cov01 : Float64*, cov11 : Float64*, sumsq : Float64*) : Int32
end

module GSL
  RNG = LibGSL.gsl_rng_alloc(LibGSL.gsl_rng_env_setup)
end
