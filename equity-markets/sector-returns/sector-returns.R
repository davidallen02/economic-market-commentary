library(magrittr)


# Previous Qtr ----------------------------------------------------------------------
field <- "hist-trr-prev-1qtr"

prev_1qtr <- pamngr::get_data("s5cond", type = "Equity", flds = field) %>%
  dplyr::bind_cols(pamngr::get_data("s5cons", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5tels", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5rlst", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5matr", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5indu", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5util", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5enrs", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5finl", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5inft", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5hlth", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(c("s5cond", "s5cons", "s5tels", "s5rlst", "s5matr", "s5indu",
                           "s5util", "s5enrs", "s5finl", "s5inft", "s5hlth")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(index = index %>% stringr::str_to_upper())

p1 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Last Quarter",
    caption = FALSE,
    show_legend = FALSE
  )


# Year to date ----------------------------------------------------------------------
field <- "last-close-trr-ytd"

prev_1qtr <- pamngr::get_data("s5cond", type = "Equity", flds = field) %>%
  dplyr::bind_cols(pamngr::get_data("s5cons", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5tels", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5rlst", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5matr", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5indu", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5util", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5enrs", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5finl", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5inft", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5hlth", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(c("s5cond", "s5cons", "s5tels", "s5rlst", "s5matr", "s5indu",
                           "s5util", "s5enrs", "s5finl", "s5inft", "s5hlth")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(index = index %>% stringr::str_to_upper())

p2 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Year to Date",
    caption = FALSE,
    show_legend = FALSE
  )


# Last year -------------------------------------------------------------------------

field <- "last-close-trr-1yr"

prev_1qtr <- pamngr::get_data("s5cond", type = "Equity", flds = field) %>%
  dplyr::bind_cols(pamngr::get_data("s5cons", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5tels", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5rlst", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5matr", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5indu", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5util", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5enrs", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5finl", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5inft", type = "Equity", flds = field)) %>%
  dplyr::bind_cols(pamngr::get_data("s5hlth", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(c("s5cond", "s5cons", "s5tels", "s5rlst", "s5matr", "s5indu",
                           "s5util", "s5enrs", "s5finl", "s5inft", "s5hlth")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(index = index %>% stringr::str_to_upper())

p3 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Trailing 12 Months",
    caption = FALSE,
    show_legend = FALSE
  )


# Page ------------------------------------------------------------------------------

lay <- pamngr::set_layout(18)

title <- pamngr::set_title("S&P 500 Sector Index Returns")

foo <- gridExtra::grid.arrange(grobs = list(title, p2, p1, p3), layout_matrix = lay)

ggplot2::ggsave("equity-markets/sector-returns/sector-returns.png", 
                plot = foo, width = 10, height = 6.75, units = "in")

