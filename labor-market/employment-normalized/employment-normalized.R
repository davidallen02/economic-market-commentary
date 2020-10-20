library(magrittr)

lay <- readxl::read_excel("layouts.xlsx", 
                          sheet     = "lay-2", 
                          range     = "A1:AN28", 
                          col_names = TRUE) %>% 
  as.matrix()

title <- grid::textGrob("Labor Market",
                        x    = 0, 
                        y    = 0.5,
                        just = "left",
                        gp   = grid::gpar(
                          fontface = "bold",
                          fontsize = 36,
                          col      = "#850237"))

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/employment-by-occupation-normalized.RData")
employment_normalized <- p

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            employment_normalized), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/employment-normalized/employment-normalized.png", plot = foo, width = 10, height = 6.75, units = "in")