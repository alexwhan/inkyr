
<!-- README.md is generated from README.Rmd. Please edit that file -->

# inkyr

<!-- badges: start -->

[![R-CMD-check](https://github.com/alexwhan/inkyr/workflows/R-CMD-check/badge.svg)](https://github.com/alexwhan/inkyr/actions)
<!-- badges: end -->

This is an R package with basic functionality for generating output for
the [inky
impression](https://shop.pimoroni.com/products/inky-impression).

## Installation

You can install the development version with:

``` r
remotes::install_github('alexwhan/inkyr')
```

## Using a ggplot inky scale

Here’s a simple use of the inky palette for ggplot.

``` r
library(inkyr)
library(ggplot2)

set.seed(123)
df <- expand.grid(x = 1:19, y = 1:16)
df$hex <- sample(factor(1:7), nrow(df), replace = TRUE)

p <- ggplot(df, aes(x, y)) +
  geom_tile(aes(fill = hex)) +
  scale_fill_inky(guide = FALSE) +
  theme_void() +
  coord_cartesian(expand = FALSE)

p
```

<img src="man/figures/README-demo1-1.png" width="100%" />

And to export for the impression:

``` r
inkysave(p, "filename.jpg")
```

## Generating an example gradient

The `inky_2d_fig` function lets you can define four colours, and builds
gradients between for inky output.

``` r
p <- inky_2d_fig(inky_colours()[3:6])

p
```

<img src="man/figures/README-gradient-demo-1.png" width="100%" />
