#' Make a 2D colour gradient
#'
#' @param colours A vector of length 4, all as valid arguments to `col2rgb`
#' @param x The length of the x dimension
#' @param y The length of the y dimension
#'
#' @return A data.frame
#' @export
#'
#' @examples
#'
#' grad_2d <- inky_2d_space(inky_colours()[3:6])
inky_2d_space <- function(colours, x = 20, y = 14) {
  stopifnot(length(colours) == 4)

  xseq <- ((0:(x - 1))/(x - 1))
  yseq <- ((0:(y - 1))/(y - 1))

  ramp1 <- colorRamprgb(colours[1], colours[2], x)
  ramp2 <- colorRamprgb(colours[3], colours[4], x)

  collist <- vector("list", y)

  allcol <- mapply(function(i, j) {
    colorRamprgb(i, j, y)
  }, ramp1, ramp2)

  df <- data.frame(x = rep(1:x, each = y),
                   y = rep(1:y, times = x),
                   col = as.character(allcol))
}

#' Make a gradient figure from four colours
#'
#' @param colours A vector of length 4, all as valid arguments to `col2rgb`
#' @param x The length of the x dimension
#' @param y The length of the y dimension
#'
#' @return A ggplot2 objects
#' @export
#'
#' @examples
#' inky_2d_fig(inky_colours()[3:6])
inky_2d_fig <- function(colours, x = 20, y = 14) {
  df <- inky_2d_space(colours, x, y)

  pal <- setNames(df$col, df$col)

  p <- ggplot(df, aes(x, y)) +
    ggplot2::geom_tile(aes(fill = col)) +
    ggplot2::scale_fill_manual(values = pal, guide = FALSE) +
    ggplot2::coord_cartesian(expand = FALSE) +
    theme_inkyvoid()
}
#
#
# base_size = 11
# base_family = ""
# base_line_size = base_size/22
# base_rect_size = base_size/22
# half_line <- base_size/2
# p2 <- p +
#   theme(line = element_blank(), rect = element_blank(),
#         text = element_text(family = base_family, face = "plain",
#                             colour = "black", size = base_size, lineheight = 0.9,
#                             hjust = 0.5, vjust = 0.5, angle = 0, margin = margin(),
#                             debug = FALSE), axis.text = element_blank(), axis.title = element_blank(),
#         axis.ticks.length.x = NULL,
#         axis.ticks.length.x.top = NULL, axis.ticks.length.x.bottom = NULL,
#         axis.ticks.length.y = NULL, axis.ticks.length.y.left = NULL,
#         axis.ticks.length.y.right = NULL, legend.box = NULL,
#         axis.ticks.length = unit(0.1, "mm"),
#         legend.key.size = unit(1.2, "lines"), legend.position = "right",
#         legend.text = element_text(size = rel(0.8)), legend.title = element_text(hjust = 0),
#         strip.text = element_text(size = rel(0.8)), strip.switch.pad.grid = unit(half_line/2,
#                                                                                  "pt"), strip.switch.pad.wrap = unit(half_line/2,
#                                                                                                                      "pt"), panel.ontop = FALSE, panel.spacing = unit(half_line,
#                                                                                                                                                                       "pt"), plot.margin = unit(c(0, 0, 0, 0), "lines"),
#         plot.title = element_text(size = rel(1.2), hjust = 0,
#                                   vjust = 1, margin = margin(t = half_line)), plot.title.position = "panel",
#         plot.subtitle = element_text(hjust = 0, vjust = 1, margin = margin(t = half_line)),
#         plot.caption = element_text(size = rel(0.8), hjust = 1,
#                                     vjust = 1, margin = margin(t = half_line)), plot.caption.position = "panel",
#         plot.tag = element_text(size = rel(1.2), hjust = 0.5,
#                                 vjust = 0.5), plot.tag.position = "topleft",
#         complete = TRUE)
#
#
# inkysave(p2, "test.png")
#
# inkysave(p2 + theme_void(), "test3.png")
#
# the
#
#
# theme(axis.text = element_blank(),
#       line = element_blank(),
#       rect = element_blank(),
#       axis.title = element_blank(),
#       strip.text = element_text(size = rel(0.8)), strip.switch.pad.grid = unit(half_line/2,
#                                                                                "pt"), strip.switch.pad.wrap = unit(half_line/2,
#                                                                                                                    "pt"), panel.ontop = FALSE, panel.spacing = unit(half_line,
#                                                                                                                                                                     "pt"), plot.margin = unit(c(0, 0, 0, 0), "lines"),
#       plot.title = element_text(size = rel(1.2), hjust = 0,
#                                 vjust = 1, margin = margin(t = half_line)), plot.title.position = "panel",
#       plot.subtitle = element_text(hjust = 0, vjust = 1, margin = margin(t = half_line)),
#       plot.caption = element_text(size = rel(0.8), hjust = 1,
#                                   vjust = 1, margin = margin(t = half_line)), plot.caption.position = "panel",
#       plot.tag = element_text(size = rel(1.2), hjust = 0.5,
#                               vjust = 0.5), plot.tag.position = "topleft",
#       complete = TRUE,
#       # axis.ticks.length = unit(0, "pt"),
#       axis.ticks.length.x = NULL,
#       # axis.ticks.length.x.top = NULL, axis.ticks.length.x.bottom = NULL,
#       # axis.ticks.length.y = NULL, axis.ticks.length.y.left = NULL,
#       axis.ticks.length.y.right = NULL, legend.box = NULL,
# )
