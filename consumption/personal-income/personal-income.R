library(magrittr)

lay <- pamngr::set_layout(10)

title <- pamngr::set_title("Consumption")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/"
} else {
  "~/OneDrive/PAMGMT"
}

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/income-monthly-change.RData"))
income_monthly_change <- p + ggplot2::theme(legend.position = "none", 
                                            plot.caption    = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/personal-income-annual-change.RData"))
personal_income_annual_change <- p + ggplot2::theme(plot.caption = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/income-composition.RData"))
income_composition <- p + ggplot2::theme(plot.caption    = ggplot2::element_blank())

load(file = paste0(path, "/Economics/data/personal-income-spending/output/tam/personal-income-change-by-category.RData"))
personal_income_change_by_category <- p + ggplot2::theme(plot.caption    = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            income_monthly_change,
                                            personal_income_annual_change,
                                            # income_composition,
                                            personal_income_change_by_category), 
                               layout_matrix = lay)

ggplot2::ggsave("personal-income.png", plot = foo, width = 10, height = 6.75, units = "in")