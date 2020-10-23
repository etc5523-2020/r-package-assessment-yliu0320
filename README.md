
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AustraliaCOVID19

<!-- badges: start -->

[![R build
status](https://github.com/etc5523-2020/r-package-assessment-yliu0320/workflows/R-CMD-check/badge.svg)](https://github.com/etc5523-2020/r-package-assessment-yliu0320/actions)
<!-- badges: end -->

The goal of AustraliaCOVID19 is to see the coronavirus data of daily
cases and cumulative cases of different types in different states of
Australia between 2020-01-12 to 2020-10-02.Besides,the shiny app in this
package will give people the whole information about the data with the
interactive plots and table.

## Installation

You can install the AustraliaCOVID19 from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-yliu0320")
```

## Example

This is a basic example which shows the content of data in the package.

``` r
library(AustraliaCOVID19)
library(tibble)
coronavirus_region
#> # A tibble: 2,120 x 9
#>    Country State date       confirmed recovered deaths daily_confirmed
#>    <chr>   <chr> <date>         <dbl>     <dbl>  <dbl>           <dbl>
#>  1 Austra~ Sout~ 2020-01-12         0         0      0               0
#>  2 Austra~ Sout~ 2020-01-13         0         0      0               0
#>  3 Austra~ Sout~ 2020-01-14         0         0      0               0
#>  4 Austra~ Sout~ 2020-01-15         0         0      0               0
#>  5 Austra~ Sout~ 2020-01-16         0         0      0               0
#>  6 Austra~ Sout~ 2020-01-17         0         0      0               0
#>  7 Austra~ Sout~ 2020-01-18         0         0      0               0
#>  8 Austra~ Sout~ 2020-01-19         0         0      0               0
#>  9 Austra~ Sout~ 2020-01-20         0         0      0               0
#> 10 Austra~ Sout~ 2020-01-21         0         0      0               0
#> # ... with 2,110 more rows, and 2 more variables: daily_recovered <dbl>,
#> #   daily_deaths <dbl>
n_states(coronavirus_region)
#> [1] 8
```
