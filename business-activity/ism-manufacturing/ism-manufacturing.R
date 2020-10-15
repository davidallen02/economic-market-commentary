library(magrittr)

lay <- pamngr::set_layout(2)

title <- pamngr::set_title("Business Activity")

pamngr::run_and_load("ism-manufacturing", "index-table") 
t <- png::readPNG("/users/davidallen/onedrive/pamgmt/economics/data/ism-manufacturing/output/tables/index-table.png")

t <- grid::rasterGrob(t)
  
foo <- gridExtra::grid.arrange(grobs = list(title, t), layout_matrix = lay)

ggplot2::ggsave("business-activity/ism-manufacturing/ism-manufacturing.png", 
                plot = foo, width = 10, height = 6.75, units = "in")
