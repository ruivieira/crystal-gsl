# crystal-gsl

[![Linux CI](https://github.com/ruivieira/crystal-gsl/actions/workflows/linux.yml/badge.svg)](https://github.com/ruivieira/crystal-gsl/actions/workflows/linux.yml)
[![MacOS CI](https://github.com/ruivieira/crystal-gsl/actions/workflows/macos.yml/badge.svg)](https://github.com/ruivieira/crystal-gsl/actions/workflows/macos.yml)
[![Windows CI](https://github.com/ruivieira/crystal-gsl/actions/workflows/windows.yml/badge.svg)](https://github.com/ruivieira/crystal-gsl/actions/workflows/windows.yml)

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

### MacOS

- brew install gsl

### Windows

 - Recommended on [GSL website](https://www.gnu.org/software/gsl/extras/native_win_builds.html) way to get GSL on Windows is to build manually using .sln files from https://github.com/BrianGladman/gsl
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
- [konovod](https://github.com/konovod) Andrey Konovod - developer
