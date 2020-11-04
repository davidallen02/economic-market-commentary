library(magrittr)

lay <- pamngr::set_layout(5)

title <- pamngr::set_title("Existing Home Sales")

existing_home_sales <- pamngr::run_and_load("existing-home-sales", 
                                            "existing-home-sales-by-region-stacked") + 
  ggplot2::theme(
    legend.position = "right",
    plot.caption = ggplot2::element_blank())

inventory <- pamngr::run_and_load("existing-home-sales", "inventory-months-of-supply") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

prices <- pamngr::run_and_load("existing-home-sales", "median-home-price") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            existing_home_sales,
                                            inventory,
                                            prices), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/existing-home-sales/existing-home-sales-inventory-prices.png", plot = foo, width = 10, height = 6.75, units = "in")