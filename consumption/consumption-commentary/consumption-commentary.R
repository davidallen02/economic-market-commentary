library(magrittr)

lay <- pamngr::set_layout(1)

title <- pamngr::set_title("Consumption")

commentary <- readr::read_file("./consumption/consumption-commentary/consumption-commentary.txt") %>%
  stringr::str_wrap(width = 45) %>%
  paste(sep = "\n") %>%
  grid::textGrob(x = 0, y = 1, just = "top", hjust = 0)

p1 <- pamngr::run_and_load("personal-income-spending", "personal-savings") + 
  ggplot2::theme(legend.position = "none", plot.caption    = ggplot2::element_blank())

p2 <- pamngr::run_and_load("personal-income-spending", "spending-level-by-type-normalized") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, commentary, p1, p2), 
                               layout_matrix = lay)

ggplot2::ggsave("consumption/consumption-commentary/consumption-commentary.png", 
                plot = foo, width = 10, height = 6.75, units = "in")

rm(list = ls())