#' Clour definitions
#'
#' @param ... Which colours to return
#'
#' @export
#'
#' @examples
#' inky_colours("inky-orange")
#' #inky-orange
#'    "#AC7B00"
inky_colours <- function(...) {

  cols <- c(...)

  inky_colours <- c(
    "inky-black" = "#000000",
    "inky-white" = "#FFFFFF",
    "inky-green" = "#00FF00",
    "inky-blue" = "#0000FF",
    "inky-red" = "#FF0000",
    "inky-yellow" = "#FFFF00",
    "inky-orange" = "#AC7B00"
  )

  if (is.null(cols))
    return (inky_colours)

  inky_colours[cols]

}

#' Inky compatible colours
#' @export
inky_palettes <- list(
  `inky_basic` = inky_colours("inky-black", "inky-white", "inky-green", "inky-blue", "inky-red", "inky-yellow", "inky-orange"),
  `inky_cool` = inky_colours("inky-green", "inky-blue"),
  `inky_warm` = inky_colours("inky-yellow", "inky-orange", "inky-red"),
  `inky_mono` = inky_colours("inky-black", "inky-white"),
  `inky_colourful` = inky_colours("inky-green", "inky-blue", "inky-yellow", "inky-orange", "inky-red")
)


#' Interpolate an inky palette
#'
#' @param palette Character name of palette
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to colorRampPalette()
#'
inky_pal <- function(palette = "inky_basic", reverse = FALSE, ...) {
  pal <- inky_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

#' Construct a fill palette
#'
#' @param palette Character name of palette
#' @param discrete Boolean indicating whether colour aesthetic is discrete
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_fill_inky <- function(palette = "inky_basic", discrete = TRUE, reverse = FALSE, ...) {
  pal <- inky_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("inky_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
