library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Consumption")

p1 <- pamngr::run_and_load("consumer-sentiment", "all-indexes") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("consumer-confidence", "consumer-confidence") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("consumption/consumer-surveys/consumer-surveys.png", 
                plot = foo, width = 10, height = 6.75, units = "in")