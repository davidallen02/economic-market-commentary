library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Labor Market")

p1 <- pamngr::run_and_load("jobless-claims", "state-vs-fed-initial-claims") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("jobless-claims", "continuing-claims", "continuing-claims-composition") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("labor-market/jobless-claims/jobless-claims.png", 
                plot = foo, width = 10, height = 6.75, units = "in")


# library(magrittr)
# 
# lay <- readxl::read_excel("layouts.xlsx", 
#                           sheet     = "lay-4", 
#                           range     = "A1:AN28", 
#                           col_names = TRUE) %>% 
#   as.matrix()
# 
# title <- grid::textGrob("US Labor Market",
#                         x    = 0, 
#                         y    = 0.5,
#                         just = "left",
#                         gp   = grid::gpar(
#                           fontface = "bold",
#                           fontsize = 36,
#                           col      = "#850237"))
# 
# load("~/OneDrive/PAMGMT/Economics/data/jobless-claims/output/tam/reg-vs-emer-claims.RData")
# reg_vs_emer_claims <- p
# 
# load("~/OneDrive/PAMGMT/Economics/data/jobless-claims/output/tam/continuing-claims-composition.RData")
# continuing_claims_composition <- p
# 
# 
# foo <- gridExtra::grid.arrange(grobs = list(title, 
#                                             reg_vs_emer_claims,
#                                             continuing_claims_composition), 
#                                layout_matrix = lay)
# 
# ggplot2::ggsave("jobless-claims.png", plot = foo, width = 10, height = 6.75, units = "in")