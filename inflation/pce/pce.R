library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Inflation")

p1 <- pamngr::run_and_load("personal-income-spending", "pce-deflators", "pce-deflator-monthly-pchange") +
  ggplot2::labs(subtitle = "Monthly Change in Core CPI") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("personal-income-spending", "pce-deflators", "pce-deflator-annual-pchange") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("inflation/pce/pce.png", 
                plot = foo, width = 10, height = 6.75, units = "in")