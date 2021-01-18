#' Colour ramp vector
#'
#' Generate a colour ramp with hex vector output
#'
#' @param colour1 valid argument for `col2rgb`
#' @param colour2 valid argument for `col2rgb`
#' @param length integer determining legnth of returned vector
#'
#' @return A character vector of hex colours
#' @export
#'
#' @examples
#' colorRamprgb(inky_colours("inky-red"), inky_colours("inky-blue"), 20)
colorRamprgb <- function(colour1, colour2, length) {

  seqvec <- ((0:(length - 1))/(length - 1))

  rampmat <- grDevices::colorRamp(c(colour1, colour2))(seqvec)

  apply(rampmat, 1, function(x) grDevices::rgb(x[1], x[2], x[3], maxColorValue = 255))
}

