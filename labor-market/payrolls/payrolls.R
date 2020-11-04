library(magrittr)

lay <- pamngr::set_layout(3)

title <- pamngr::set_title("Labor Market")

monthly_change_in_payrolls <- pamngr::run_and_load("employment-situation", 
                                                 "monthly-change-payrolls", 
                                                 "monthly-change-in-payrolls")

payrolls_by_occupation <- pamngr::run_and_load("employment-situation", "payrolls-by-occupation")

paragraph <- readr::read_file("labor-market/payrolls/payrolls.txt") %>%
  stringr::str_wrap(width = 50) %>%
  paste(sep = "\n") %>%
  grid::textGrob(x = 0, y = 1, just = "top", hjust = 0)

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            paragraph, 
                                            monthly_change_in_payrolls, 
                                            payrolls_by_occupation), 
                               layout_matrix = lay)

ggplot2::ggsave("labor-market/payrolls/payrolls.png", 
                plot = foo, width = 10, height = 6.75, units = "in")