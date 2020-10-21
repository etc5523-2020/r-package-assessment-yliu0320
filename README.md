
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AustraliaCOVID19

<!-- badges: start -->

<!-- badges: end -->

The goal of AustraliaCOVID19 is to see the coronavirus data of daily
cases and cumulative cases of different types in different states of
Australia between 2020-01-12 to 2020-10-02.Also the shiny app in this
package will give you the whole information about the data with the
interactive plots and table.

## Installation

You can install the AustraliaCOVID19 from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-yliu0320")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(AustraliaCOVID19)
library(tibble)
coronavirus_region
#> # A tibble: 2,120 x 8
#>    Country   State        date     confirmed recovered deaths latitude longitude
#>    <chr>     <chr>        <chr>        <dbl>     <dbl>  <dbl>    <dbl>     <dbl>
#>  1 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  2 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  3 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  4 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  5 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  6 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  7 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  8 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#>  9 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#> 10 Australia South Austr~ 2020-01~         0         0      0    -34.9      139.
#> # ... with 2,110 more rows
```
