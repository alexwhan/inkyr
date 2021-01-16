#' Use ggsave to export in a compatible way for inky impression
#'
#' @param plot a ggplot object
#' @param filename path to save to
#' @param ... other params passed to ggsave
#'
#' @export
#'
#' @examples
#' df <- tidyr::crossing(x = 1:19, y = 1:16)
#'df$hex <- sample(factor(1:7), nrow(df), replace = TRUE)
#'
#'ggplot(df, aes(x, y)) +
#'  geom_tile(aes(fill = hex)) +
#'  scale_fill_inky(guide = FALSE) +
#'  ggplot2::theme_void() +
#'  ggplot2::coord_cartesian(expand = FALSE) -> p
#'  inkysave(p, 'filename.jpg')
inkysave <- function(plot, filename, ...) {
  ggplot2::ggsave(filename, plot, width = 3, height = 2.24, dpi = 200, ...)
}
