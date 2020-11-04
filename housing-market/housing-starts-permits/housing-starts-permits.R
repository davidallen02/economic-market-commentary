library(magrittr)

lay <- pamngr::set_layout(11)

title <- pamngr::set_title("Housing Starts")

housing_starts <- pamngr::run_and_load("housing-starts", "housing-starts") + 
  ggplot2::theme(legend.position = "none", 
                 plot.caption    = ggplot2::element_blank())

northeast <- pamngr::run_and_load("housing-starts", "housing-starts-northeast") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

midwest <- pamngr::run_and_load("housing-starts", "housing-starts-midwest") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

south <- pamngr::run_and_load("housing-starts", "housing-starts-south") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

west <- pamngr::run_and_load("housing-starts", "housing-starts-west") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            housing_starts,
                                            northeast,
                                            midwest,
                                            south,
                                            west), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/housing-starts-permits/housing-starts-permits.png", 
                plot = foo, 
                width = 10, 
                height = 6.75, 
                units = "in")

