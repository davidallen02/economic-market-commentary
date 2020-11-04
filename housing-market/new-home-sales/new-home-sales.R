library(magrittr)

lay <- pamngr::set_layout(11)

title <- pamngr::set_title("New Home Sales")

new_home_sales <- pamngr::run_and_load("new-home-sales", "new-home-sales") + 
  ggplot2::theme(legend.position = "none", plot.caption = ggplot2::element_blank())

northeast <- pamngr::run_and_load("new-home-sales", "new-home-sales-northeast") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

midwest <- pamngr::run_and_load("new-home-sales", "new-home-sales-midwest") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

south <- pamngr::run_and_load("new-home-sales", "new-home-sales-south") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

west <- pamngr::run_and_load("new-home-sales", "new-home-sales-west") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            new_home_sales,
                                            northeast,
                                            midwest,
                                            south,
                                            west), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/new-home-sales/new-home-sales.png", 
                plot = foo, width = 10, height = 6.75, units = "in")