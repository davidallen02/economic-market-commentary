library(magrittr)

lay <- pamngr::set_layout(16)

title <- pamngr::set_title("Consumption")

p1 <- pamngr::run_and_load("personal-income-spending", "spending-composition") +
  ggplot2::guides(fill = ggplot2::guide_legend(nrow = 2)) +
  ggplot2::theme(plot.caption = ggplot2::element_blank(),
                 legend.position = "bottom")

p2 <- pamngr::run_and_load("personal-income-spending", "durable-goods-composition") +
  ggplot2::guides(fill = ggplot2::guide_legend(nrow = 2)) +
  ggplot2::theme(plot.caption = ggplot2::element_blank(),
                 legend.position = "bottom")

p3 <- pamngr::run_and_load("personal-income-spending", "nondurable-goods-composition") +
  ggplot2::guides(fill = ggplot2::guide_legend(nrow = 2)) +
  ggplot2::theme(plot.caption = ggplot2::element_blank(),
                 legend.position = "bottom")

p4 <- pamngr::run_and_load("personal-income-spending", "services-composition") +
  ggplot2::guides(fill = ggplot2::guide_legend(nrow = 2)) +
  ggplot2::theme(plot.caption = ggplot2::element_blank(),
                 legend.position = "bottom")

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2, p3, p4), layout_matrix = lay)

ggplot2::ggsave("consumption/spending-composition/spending-composition.png", 
                plot = foo, width = 10, height = 6.75, units = "in")