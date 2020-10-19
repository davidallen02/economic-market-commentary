library(magrittr)

lay <- readxl::read_excel("layouts.xlsx", 
                          sheet     = "lay-3", 
                          range     = "A1:AN28", 
                          col_names = TRUE) %>% 
  as.matrix()

title <- grid::textGrob("US Labor Market",
                        x    = 0, 
                        y    = 0.5,
                        just = "left",
                        gp   = grid::gpar(
                          fontface = "bold",
                          fontsize = 36,
                          col      = "#850237"))

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/monthly-change-in-payrolls.RData")
monthly_change_in_payrolls <- p

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/payrolls-by-occupation.RData")
payrolls_by_occupation <- p



paragraph <- readr::read_file("labor-market/payrolls/payrolls.txt") %>%
  stringr::str_wrap(width = 50) %>%
  paste(sep = "\n") %>%
  grid::textGrob(x = 0, y = 1, just = "top", hjust = 0)

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            paragraph, 
                                            monthly_change_in_payrolls, 
                                            payrolls_by_occupation), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/payrolls/payrolls.png", plot = foo, width = 10, height = 6.75, units = "in")