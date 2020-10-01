library(magrittr)

lay <- pamngr::set_layout(5)

title <- pamngr::set_title("Existing Home Sales")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/"
} else {
  "~/OneDrive/PAMGMT"
}

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-home-sales-by-region-stacked.RData"))
existing_home_sales <- p + 
  ggplot2::theme(
    legend.position = "right",
    plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/existing-homes-inventory-months-of-supply.RData"))
inventory <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/existing-home-sales/output/tam/median-home-price-annual-pchange.RData"))
prices <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())


foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            existing_home_sales,
                                            inventory,
                                            prices), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/existing-home-sales/existing-home-sales-inventory-prices.png", plot = foo, width = 10, height = 6.75, units = "in")