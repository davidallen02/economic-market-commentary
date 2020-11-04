library(magrittr)

lay <- pamngr::set_layout(11)

title <- pamngr::set_title("Existing Home Sales")

existing_home_sales <- pamngr::run_and_load("existing-home-sales", "existing-home-sales") + ggplot2::theme(
  legend.position = "none", 
  plot.caption    = ggplot2::element_blank())

northeast <- pamngr::run_and_load("existing-home-sales", "existing-home-sales-northeast") +
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

midwest <- pamngr::run_and_load("existing-home-sales", "existing-home-sales-midwest") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

south <- pamngr::run_and_load("existing-home-sales", "existing-home-sales-south") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

west <- pamngr::run_and_load("existing-home-sales", "existing-home-sales-west") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y")

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            existing_home_sales,
                                            northeast,
                                            midwest,
                                            south,
                                            west), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/existing-home-sales/existing-home-sales.png", 
                plot = foo, width = 10, height = 6.75, units = "in")