library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Business Activity")

p1 <- pamngr::run_and_load("industrial-production", "total-industrial-production-monthly-pchange") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("industrial-production", "capacity-utilization") +
  ggplot2::labs(
    title = "Industrial Capacity Utilization",
    subtitle = "Percent"
  ) +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("business-activity/industrial-production/industrial-production.png", 
                plot = foo, width = 10, height = 6.75, units = "in")