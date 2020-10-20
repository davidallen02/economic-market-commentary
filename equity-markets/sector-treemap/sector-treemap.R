library(magrittr)

field <- "percent-weight"

weights <- pamngr::get_data("s5cond", type = "Equity", flds = field) %>%
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
  dplyr::mutate(index = index %>% 
                  stringr::str_to_upper() %>%
                  paste0("\n", round(value,2), "%"))

png("equity-markets/sector-treemap/treemap.png", width = 10, height = 6, units = "in", res = 350)
p <- treemap::treemap(weights, 
                      index = "index", 
                      vSize = "value", 
                      palette = pamngr::pam.pal(),
                      title = "S&P 500 Sector Weights",
                      fontsize.title = 20,
                      aspRatio = 13/6.75) 
dev.off()

p <- grid::rasterGrob(png::readPNG("equity-markets/sector-treemap/treemap.png"))


lay <- pamngr::set_layout(2)

title <- pamngr::set_title("Equity Markets")

foo <- gridExtra::grid.arrange(grobs = list(title, p), layout_matrix = lay)

ggplot2::ggsave("equity-markets/sector-treemap/sector-treemap.png", 
                plot = foo, width = 10, height = 6.75, units = "in")