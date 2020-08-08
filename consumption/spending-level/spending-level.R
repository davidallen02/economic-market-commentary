library(magrittr)

lay <- pamngr::set_layout(1)
title <- pamngr::set_title("Consumption")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/"
} else {
    "~/OneDrive/PAMGMT"
}

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/spending-level-normalized.RData"))
spending_level_normalized <- p %>% 
  pamngr::pam_plot(
    plot_title = "Personal Spending",
    plot_subtitle = "Normalized to December 2019",
    caption = FALSE)

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/spending-level-by-type-normalized.RData"))
spending_level_by_type_normalized <- p %>% 
  pamngr::pam_plot(
    plot_title = "Spending on Goods vs Services",
    plot_subtitle = "Normalized to December 2019")

spending_level_by_type_normalized <- spending_level_by_type_normalized +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            spending_level_normalized,
                                            spending_level_normalized,
                                            spending_level_by_type_normalized), 
                               layout_matrix = lay)

ggplot2::ggsave("spending-level.png", plot = foo, width = 10, height = 6.75, units = "in")