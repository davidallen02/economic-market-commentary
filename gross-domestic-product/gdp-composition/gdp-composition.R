library(magrittr)

lay <- readxl::read_excel("layouts.xlsx", 
                          sheet     = "lay-8", 
                          range     = "A1:AN28", 
                          col_names = TRUE) %>% 
  as.matrix()

title <- grid::textGrob("Gross Domestic Product",
                        x    = 0, 
                        y    = 0.5,
                        just = "left",
                        gp   = grid::gpar(
                          fontface = "bold",
                          fontsize = 36,
                          col      = "#850237"))

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/gdp-composition.RData")
gdp_composition <- p 

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/personal-consumption-composition.RData")
personal_consumption_composition <- p %>% 
  pamngr::pam_plot(plot_title = "Personal Consumption", caption = FALSE)

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/fixed-investment-composition.RData")
fixed_investment_composition <- p %>% 
  pamngr::pam_plot(plot_title = "Fixed Investment", caption = FALSE)

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/government-spending-composition.RData")
government_spending_composition <- p %>% 
  pamngr::pam_plot(plot_title = "Government Spending", caption = FALSE) 

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            gdp_composition, 
                                            personal_consumption_composition,
                                            fixed_investment_composition,
                                            government_spending_composition), 
                               layout_matrix = lay)

ggplot2::ggsave("gross-domestic-product/gdp-composition/gdp-composition.png", plot = foo, width = 10, height = 6.75, units = "in")

