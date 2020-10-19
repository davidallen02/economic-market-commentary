library(magrittr)

lay <- readxl::read_excel("layouts.xlsx", 
                          sheet     = "lay-9", 
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

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/consumption-growth-with-estimates.RData")
legend <- p %>% pamngr::get_legend()
consumption_growth_with_estimates <- p + ggplot2::theme(legend.position = "none")

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/private-invest-growth-with-estimates.RData")
private_investment_growth_with_estimates <- p + ggplot2::theme(legend.position = "none")

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/government-spending-growth-with-estimates.RData")
government_spending_growth_with_estimates <- p + ggplot2::theme(legend.position = "none")

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/import-growth-with-estimates.RData")
import_growth_with_estimates <- p + ggplot2::theme(legend.position = "none")

load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/export-growth-with-estimates.RData")
export_growth_with_estimates <- p + ggplot2::theme(legend.position = "none")

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            consumption_growth_with_estimates, 
                                            private_investment_growth_with_estimates,
                                            government_spending_growth_with_estimates,
                                            import_growth_with_estimates,
                                            export_growth_with_estimates,
                                            legend), 
                               layout_matrix = lay)

ggplot2::ggsave("gross-domestic-product/gdp-growth-estimates/gdp-growth-estimates.png", plot = foo, width = 10, height = 6.75, units = "in")