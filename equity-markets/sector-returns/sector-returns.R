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
  dplyr::bind_cols(pamngr::get_data("spx", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(c("s5cond", "s5cons", "s5tels", "s5rlst", "s5matr", "s5indu",
                           "s5util", "s5enrs", "s5finl", "s5inft", "s5hlth", "spx")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(
    index = index %>% 
      stringr::str_to_upper() %>% 
      stringr::str_remove_all("S5") %>% 
      factor() %>% 
      forcats::fct_reorder(-value)
  )

p1 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Last Quarter",
    caption = FALSE,
    show_legend = FALSE
  )

p1 <- p1 +
  ggplot2::scale_fill_manual(
    values = c("COND" = pamngr::pam.pal()[1], 
               "CONS" = pamngr::pam.pal()[2], 
               "TELS" = pamngr::pam.pal()[3], 
               "RLST" = pamngr::pam.pal()[4], 
               "MATR" = pamngr::pam.pal()[5], 
               "INDU" = pamngr::pam.pal()[6],
               "UTIL" = pamngr::pam.pal()[7], 
               "ENRS" = pamngr::pam.pal()[8], 
               "FINL" = pamngr::pam.pal()[9], 
               "INFT" = pamngr::pam.pal()[10], 
               "HLTH" = pamngr::pam.pal()[11], 
               "SPX"    = pamngr::pam.pal()[12])
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
  dplyr::bind_cols(pamngr::get_data("spx", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(
    c("Consumer\nDiscretionary\n(COND)", 
      "Consumer\nStaples\n(CONS)", 
      "Communication\nServices\n(TELS)", 
      "Real\nEstate\n(RLST)", 
      "Materials\n(MATR)", 
      "Industrials\n(INDU)",
      "Utilities\n(UTIL)", 
      "Energy\n(ENRS)", 
      "Financials\n(FINL)", 
      "Information\nTechnology\n(INFT)", 
      "Health\nCare\n(HLTH)", 
      "S&P 500\n(SPX)")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(
    index = index %>% factor() %>% forcats::fct_reorder(-value),
  )

p2 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Year to Date",
    caption = FALSE,
    show_legend = FALSE
  )

p2 <- p2 +
  ggplot2::scale_fill_manual(
    values = c("Consumer\nDiscretionary\n(COND)" = pamngr::pam.pal()[1], 
               "Consumer\nStaples\n(CONS)" = pamngr::pam.pal()[2], 
               "Communication\nServices\n(TELS)" = pamngr::pam.pal()[3], 
               "Real\nEstates\n(RLST)" = pamngr::pam.pal()[4], 
               "Materials\n(MATR)" = pamngr::pam.pal()[5], 
               "Industrials\n(INDU)" = pamngr::pam.pal()[6],
               "Utilities\n(UTIL)" = pamngr::pam.pal()[7], 
               "Energy\n(ENRS)" = pamngr::pam.pal()[8], 
               "Financials\n(FINL)" = pamngr::pam.pal()[9], 
               "Information\nTechnology\n(INFT)" = pamngr::pam.pal()[10], 
               "Health\nCare\n(HLTH)" = pamngr::pam.pal()[11], 
               "S&P 500\n(SPX)"    = pamngr::pam.pal()[12])
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
  dplyr::bind_cols(pamngr::get_data("spx", type = "Equity", flds = field)) %>%
  magrittr::set_colnames(c("s5cond", "s5cons", "s5tels", "s5rlst", "s5matr", "s5indu",
                           "s5util", "s5enrs", "s5finl", "s5inft", "s5hlth", "spx")) %>%
  tidyr::pivot_longer(cols = tidyr::everything(), names_to = "index") %>%
  dplyr::mutate(
    index = index %>% 
      stringr::str_to_upper() %>% 
      stringr::str_remove_all("S5") %>% 
      factor() %>% 
      forcats::fct_reorder(-value),
  )

p3 <- prev_1qtr %>%
  pamngr::barplot(x = "index", fill = "index") %>%
  pamngr::pam_plot(
    plot_title = "Index Total Returns",
    plot_subtitle = "Trailing 12 Months",
    caption = FALSE,
    show_legend = FALSE
  )

p3 <- p3 +
  ggplot2::scale_fill_manual(
    values = c("COND" = pamngr::pam.pal()[1], 
               "CONS" = pamngr::pam.pal()[2], 
               "TELS" = pamngr::pam.pal()[3], 
               "RLST" = pamngr::pam.pal()[4], 
               "MATR" = pamngr::pam.pal()[5], 
               "INDU" = pamngr::pam.pal()[6],
               "UTIL" = pamngr::pam.pal()[7], 
               "ENRS" = pamngr::pam.pal()[8], 
               "FINL" = pamngr::pam.pal()[9], 
               "INFT" = pamngr::pam.pal()[10], 
               "HLTH" = pamngr::pam.pal()[11], 
               "SPX"    = pamngr::pam.pal()[12])
  )


# Page ------------------------------------------------------------------------------

lay <- pamngr::set_layout(5)

title <- pamngr::set_title("S&P 500 Sector Index Returns")

foo <- gridExtra::grid.arrange(grobs = list(title, p2, p1, p3), layout_matrix = lay)

ggplot2::ggsave("equity-markets/sector-returns/sector-returns.png", 
                plot = foo, width = 10, height = 6.75, units = "in")

