library(magrittr)

lay <- pamngr::set_layout(11)

title <- pamngr::set_title("Housing Starts")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/"
} else {
  "~/OneDrive/PAMGMT"
}

load(file = paste0(path, "/Economics/data/housing-starts/output/tam/housing-starts.RData"))
<<<<<<< HEAD
housing_starts <- p + ggplot2::theme(legend.position = "none", 
                                          plot.caption    = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/housing-starts/output/tam/housing-starts-northeast.RData"))
northeast <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/housing-starts/output/tam/housing-starts-midwest.RData"))
midwest <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/housing-starts/output/tam/housing-starts-south.RData"))
south <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/housing-starts/output/tam/housing-starts-west.RData"))
west <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            housing_starts,
=======
existing_home_sales <- p + ggplot2::theme(legend.position = "none", 
                                          plot.caption    = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-home-sales-northeast.RData"))
northeast <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-home-sales-midwest.RData"))
midwest <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-home-sales-south.RData"))
south <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-home-sales-west.RData"))
west <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            existing_home_sales,
>>>>>>> 2a8774560b1826d7da2bbae234ec3265b9ff5ed2
                                            northeast,
                                            midwest,
                                            south,
                                            west), 
                               layout_matrix = lay)

<<<<<<< HEAD
ggplot2::ggsave("./housing-market/housing-starts-permits/housing-starts-permits.png", 
                plot = foo, 
                width = 10, 
                height = 6.75, 
                units = "in")
=======
ggplot2::ggsave("./housing-market/existing-home-sales/existing-home-sales.png", plot = foo, width = 10, height = 6.75, units = "in")
>>>>>>> 2a8774560b1826d7da2bbae234ec3265b9ff5ed2
