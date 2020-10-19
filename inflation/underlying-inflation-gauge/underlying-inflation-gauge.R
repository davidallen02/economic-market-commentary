library(magrittr)

lay <- pamngr::set_layout(2)

title <- pamngr::set_title("Inflation")

p1 <- pamngr::run_and_load("underlying-inflation-gauge", "underlying-inflation-gauge") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1), layout_matrix = lay)

ggplot2::ggsave("inflation/underlying-inflation-gauge/underlying-inflation-gauge.png", 
                plot = foo, width = 10, height = 6.75, units = "in")