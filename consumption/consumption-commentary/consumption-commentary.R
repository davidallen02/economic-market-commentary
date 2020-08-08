library(magrittr)

lay <- pamngr::set_layout(1)
title <- pamngr::set_title("Consumption")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/"
} else {
    "~/OneDrive/PAMGMT"
}

commentary <- readr::read_file("./consumption/consumption-commentary/consumption-commentary.txt") %>%
  stringr::str_wrap(width = 45) %>%
  paste(sep = "\n") %>%
  grid::textGrob(x = 0, y = 1, just = "top", hjust = 0)

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/personal-savings-rate.RData"))
personal_savings_rate <- p + ggplot2::theme(legend.position = "none", 
                                            plot.caption    = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/spending-level-by-type-normalized.RData"))
spending_level_by_type_normalized <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            commentary,
                                            personal_savings_rate,
                                            spending_level_by_type_normalized), 
                               layout_matrix = lay)

ggplot2::ggsave("consumption-commentary.png", plot = foo, width = 10, height = 6.75, units = "in")