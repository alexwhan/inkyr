
# inkyr

<!-- badges: start -->
[![R-CMD-check](https://github.com/alexwhan/inkyr/workflows/R-CMD-check/badge.svg)](https://github.com/alexwhan/inkyr/actions)
<!-- badges: end -->

This is a very basic package, primarily to define a palette for the [inky impression](https://shop.pimoroni.com/products/inky-impression) to use in R, and maybe do other stuff in future.

## Installation

You can install the development version with:

``` r
remotes::install_github('alexwhan/inkyr')
```

## Using a ggplot inky scale

Here's a simple use of the inky palette for ggplot.

``` r
library(inkyr)
library(ggplot2)
library(tidyr)

df <- crossing(x = 1:19, y = 1:16)
df$hex <- sample(factor(1:7), nrow(df), replace = TRUE)

ggplot(df, aes(x, y)) +
  geom_tile(aes(fill = hex)) +
  scale_fill_inky(guide = FALSE) +
  theme_void() +
  coord_cartesian(expand = FALSE)
```

