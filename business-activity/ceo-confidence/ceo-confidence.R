library(magrittr)

lay <- pamngr::set_layout(2)

title <- pamngr::set_title("Business Activity")

p1 <- pamngr::run_and_load("ceo-confidence", "ceo-confidence") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1), layout_matrix = lay)

ggplot2::ggsave("business-activity/ceo-confidence/ceo-confidence.png", 
                plot = foo, width = 10, height = 6.75, units = "in")