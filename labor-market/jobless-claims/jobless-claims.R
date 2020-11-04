library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Labor Market")

p1 <- pamngr::run_and_load("jobless-claims", "state-vs-fed-initial-claims") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("jobless-claims", "continuing-claims", "continuing-claims-composition") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("labor-market/jobless-claims/jobless-claims.png", 
                plot = foo, width = 10, height = 6.75, units = "in")
