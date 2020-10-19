lay <- readxl::read_excel("layouts.xlsx", 
                          sheet     = "lay-5", 
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

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/unemployment-rate.RData")
unemployment_rate <- p

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/unemployment-rate-education.RData")
unemployment_rate_education <- p

load("~/OneDrive/PAMGMT/Economics/data/employment-situation/output/tam/unemployment-rate-race.RData")
unemployment_rate_race <- p


foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            unemployment_rate, 
                                            unemployment_rate_education, 
                                            unemployment_rate_race), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/unemployment-rate/unemployment-rate.png", plot = foo, width = 10, height = 6.75, units = "in")