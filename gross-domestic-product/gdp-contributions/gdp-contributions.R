library(magrittr)

# lay <- readxl::read_excel("layouts.xlsx", 
#                           sheet     = "lay-6", 
#                           range     = "A1:AN28", 
#                           col_names = TRUE) %>% 
#   as.matrix()
# 
# title <- grid::textGrob("Gross Domestic Product",
#                         x    = 0, 
#                         y    = 0.5,
#                         just = "left",
#                         gp   = grid::gpar(
#                           fontface = "bold",
#                           fontsize = 36,
#                           col      = "#850237"))

lay <- pamngr::set_layout(6)

title <- pamngr::set_title("Gross Domestic Product")

paragraph <- readr::read_file("./gross-domestic-product/gdp-contributions/gdp-contributions.txt") %>%
  stringr::str_wrap(width = 130) %>%
  paste(sep = "\n") %>%
  grid::textGrob(x = 0, y = 1, just = "top", hjust = 0)

gdp_contributions <- pamngr::run_and_load("gross-domestic-product",
                                          "growth-breakdown",
                                          "gdp-contributions")

# load("~/OneDrive/PAMGMT/Economics/data/gross-domestic-product/output/tam/gdp-contributions.RData")
# gdp_contributions <- p

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            paragraph, 
                                            gdp_contributions), 
                               layout_matrix = lay)

ggplot2::ggsave("gross-domestic-product/gdp-contributions/gdp-contributions.png", 
                plot = foo, width = 10, height = 6.75, units = "in")