library(magrittr)

lay <- pamngr::set_layout(2)

title <- pamngr::set_title("Labor Market")

employment_normalized <- pamngr::run_and_load("employment-situation", 
                                              "employment-by-occupation-normalized") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs         = list(title, employment_normalized), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/employment-normalized/employment-normalized.png", 
                plot = foo, width = 10, height = 6.75, units = "in")