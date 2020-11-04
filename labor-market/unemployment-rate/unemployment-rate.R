library(magrittr)

lay <- pamngr::set_layout(5)

title <- pamngr::set_title("Labor Market")

unemployment_rate <- pamngr::run_and_load("employment-situation", 
                                          "unemployment-rate")

unemployment_rate_education <- pamngr::run_and_load("employment-situation", 
                                                    "unemployment-rate-education")

unemployment_rate_race <- pamngr::run_and_load("employment-situation",
                                               "unemployment-rate-race")

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            unemployment_rate, 
                                            unemployment_rate_education, 
                                            unemployment_rate_race), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/unemployment-rate/unemployment-rate.png", 
                plot = foo, width = 10, height = 6.75, units = "in")