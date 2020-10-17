library(magrittr)

lay <- pamngr::set_layout(16)

title <- pamngr::set_title("Consumption")

p1 <- pamngr::run_and_load("retail-sales", "headline-level") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("retail-sales", "nonstore-sales", "nonstore-share") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p3 <- pamngr::run_and_load("retail-sales", "headline-monthly-pchange") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p4 <- pamngr::run_and_load("retail-sales", "control-group-monthly-pchange") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2, p3, p4), layout_matrix = lay)

ggplot2::ggsave("consumption/retail-sales/retail-sales.png", 
                plot = foo, width = 10, height = 6.75, units = "in")