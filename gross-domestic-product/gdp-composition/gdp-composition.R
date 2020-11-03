library(magrittr)

lay <- pamngr::set_layout(8)

title <- pamngr::set_title("Gross Domestic Product")

gdp_composition <- pamngr::run_and_load("gross-domestic-product", "gdp-composition")

personal_consumption_composition <- pamngr::run_and_load(
  "gross-domestic-product", "personal-consumption-composition") %>% 
  pamngr::pam_plot(plot_title = "Personal Consumption", caption = FALSE)

fixed_investment_composition <- pamngr::run_and_load("gross-domestic-product",
                                                     "fixed-investment-composition") %>% 
  pamngr::pam_plot(plot_title = "Fixed Investment", caption = FALSE)

government_spending_composition <- pamngr::run_and_load("gross-domestic-product",
                                                        "government-spending-composition") %>% 
  pamngr::pam_plot(plot_title = "Government Spending", caption = FALSE) 

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            gdp_composition, 
                                            personal_consumption_composition,
                                            fixed_investment_composition,
                                            government_spending_composition), 
                               layout_matrix = lay)

ggplot2::ggsave("gross-domestic-product/gdp-composition/gdp-composition.png", 
                plot = foo, width = 10, height = 6.75, units = "in")

