library(magrittr)

lay <- pamngr::set_layout(13)

title <- pamngr::set_title("Housing Affordability")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/Economics/data/case-shiller/output/tam/"
} else {
  "~/OneDrive/PAMGMT/Economics/data/housing-affordability/output/tam/"
}

load(file = paste0(path, "mortgage-rates.RData"))
mortgage_rates <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))

load(file = paste0(path, "mortgage-delinquencies.RData"))
delinquencies <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::guides(color = ggplot2::guide_legend(nrow = 2))


load(file = paste0(path, "mortgage-applications.RData"))
applications <- p + ggplot2::theme(plot.caption = ggplot2::element_blank()) 

load(file = paste0(path, "housing-affordability.RData"))
affordability <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            mortgage_rates,
                                            delinquencies,
                                            applications,
                                            affordability), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/housing-affordability/housing-affordability.png", plot = foo, width = 10, height = 6.75, units = "in")