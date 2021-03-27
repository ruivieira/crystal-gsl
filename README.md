# crystal-gsl

[![tests](https://github.com/ruivieira/crystal-gsl/actions/workflows/main.yml/badge.svg)](https://github.com/ruivieira/crystal-gsl/actions/workflows/main.yml)

GNU Scientific Library (GSL) binding for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  gsl:
    github: ruivieira/crystal-gsl
```

## System dependencies

### Ubuntu

- libatlas-base-dev
- libgsl-dev

### Fedora

- gsl
- gsl-devel

## Usage

```crystal
require "gsl"
```

### Documentation

Full documentation can be found at [here](https://ruivieira.github.io/crystal-gsl/).

### Examples

Examples can be found [here](https://ruivieira.github.io/projects/crystal-gsl/).

_Warning_:

- Not fully test
- Pre-release (API will break)
- Not fit for production

## Status

Implementation list:

- Statistical
  - Distributions
    - Binomial
    - Chi-square
    - Uniform
    - Exponential
    - Cauchy
    - Gaussian (univariate and multivariate)
    - Poisson
    - Multinomial
    - Gamma
  - Vectors
  - Matrices
  - Sparse and dense matrices
  - Histograms
  - Permutations

## Contributing

1. Fork it ( https://github.com/ruivieira/crystal-gsl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ruivieira](https://github.com/ruivieira) Rui Vieira - creator, maintainer
- [dylandy](https://github.com/dylandy) Dylandy Chang - developer, maintainer
