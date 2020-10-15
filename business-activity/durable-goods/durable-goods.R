library(magrittr)

lay <- pamngr::set_layout(4)

title <- pamngr::set_title("Business Activity")

p1 <- pamngr::run_and_load("durable-goods", "durable-goods-orders") +
  ggplot2::theme(plot.caption = ggplot2::element_blank())

p2 <- pamngr::run_and_load("durable-goods", "capital-goods-orders-nondefense-ex-air") %>%
  pamngr::pam_plot(plot_title = "Core Capital Goods Orders",
                   plot_subtitle = "Monthly Change in Nondefense Capital Goods Orders ex Aircraft",
                   caption = FALSE, 
                   show_legend = FALSE)

foo <- gridExtra::grid.arrange(grobs = list(title, p1, p2), layout_matrix = lay)

ggplot2::ggsave("business-activity/durable-goods/durable-goods.png", 
                plot = foo, width = 10, height = 6.75, units = "in")