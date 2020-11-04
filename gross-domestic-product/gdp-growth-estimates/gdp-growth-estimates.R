library(magrittr)



p0 <- pamngr::run_and_load("gross-domestic-product", "gdp-growth-with-estimates")
p1 <- p0 + ggplot2::theme(legend.position = "none")


p2 <- pamngr::run_and_load("gross-domestic-product", "gdp-growth-estimates")
p2 <- p2 + 
  ggplot2::theme(legend.position = "none", plot.caption = ggplot2::element_blank()) 
  

legend <- p0 %>% pamngr::get_legend()

lay <- pamngr::set_layout(19)

title <- pamngr::set_title("Gross Domestic Product")

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2, legend), layout_matrix = lay)

ggplot2::ggsave("gross-domestic-product/gdp-growth-estimates/gdp-growth-estimates.png", plot = foo, width = 10, height = 6.75, units = "in")