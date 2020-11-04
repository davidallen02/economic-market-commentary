library(magrittr)

lay <- pamngr::set_layout(13)

title <- pamngr::set_title("Housing Affordability")

mortgage_rates <- pamngr::run_and_load("housing-affordability", "mortgage-rates") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))

delinquencies <- pamngr::run_and_load("housing-affordability", "mortgage-delinquencies") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))

applications <- pamngr::run_and_load("housing-affordability", "mortgage-applications") + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) 

affordability <- pamngr::run_and_load("housing-affordability", "housing-affordability") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            mortgage_rates,
                                            delinquencies,
                                            applications,
                                            affordability), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/housing-affordability/housing-affordability.png", 
                plot = foo, width = 10, height = 6.75, units = "in")