library(magrittr)

lay <- pamngr::set_layout(10)

title <- pamngr::set_title("Consumption")

p1 <- pamngr::run_and_load(
  "personal-income-spending", "monthly-change-income", "income-monthly-change") + 
  ggplot2::theme(legend.position = "none", plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("personal-income-spending", "personal-income-annual-change") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p3 <- pamngr::run_and_load("personal-income-spending", "personal-income-change-by-category") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2, p3), 
                               layout_matrix = lay)

ggplot2::ggsave("consumption/personal-income/personal-income.png", 
                plot = foo, width = 10, height = 6.75, units = "in")

rm(list = ls())