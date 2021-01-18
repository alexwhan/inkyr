df <- expand.grid(x = 1:19, y = 1:16)
df$hex <- sample(factor(1:7), nrow(df), replace = TRUE)

ggplot(df, aes(x, y)) +
  geom_tile(aes(fill = hex)) +
  scale_fill_inky(guide = FALSE) +
  ggplot2::theme_void() +
  ggplot2::coord_cartesian(expand = FALSE) -> p

ggplot2::ggsave("random.jpg", p, width = 6, height = 4.48, dpi = 100)

inkysave(p, "inkytest.jpg")

ggplot(df, aes(x, y)) +
  geom_tile(aes(fill = as.numeric(hex))) +
  scale_fill_inky(palette = "inky_cool", discrete = FALSE, guide = FALSE) +
  ggplot2::theme_void() +
  ggplot2::coord_cartesian(expand = FALSE) -> p
p

inkysave(p, "inkycool.jpg")
