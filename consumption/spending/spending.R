library(magrittr)

lay <- pamngr::set_layout(14)

title <- pamngr::set_title("Consumption")

p1 <- pamngr::run_and_load("personal-income-spending", "spending-pchange-category") %>% 
  pamngr::pam_plot(
    plot_title = "Personal Spending",
    plot_subtitle = "Normalized to December 2019",
    caption = FALSE)

p2 <- pamngr::run_and_load("personal-income-spending", "spending-monthly-change") %>% 
  pamngr::pam_plot(
    plot_title = "Monthly Percent Change",
    show_legend = FALSE,
    caption = FALSE)

p3 <- pamngr::run_and_load("personal-income-spending", "spending-annual-pchange") %>% 
  pamngr::pam_plot(
    plot_title = "Annual Percent Change",
    show_legend = FALSE,
    caption = FALSE)


foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            p1,
                                            p2,
                                            p3), 
                               layout_matrix = lay)

ggplot2::ggsave("consumption/spending/spending.png", 
                plot = foo, width = 10, height = 6.75, units = "in")