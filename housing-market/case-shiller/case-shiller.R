library(magrittr)

lay <- pamngr::set_layout(12)

title <- pamngr::set_title("Case Shiller Home Prices")

path <- if(Sys.info()["nodename"] %in% c("BBJW", "BBDA")){
  "R:/David/Economics/data/case-shiller/output/tam/"
} else {
  "~/OneDrive/PAMGMT/Economics/data/case-shiller/output/tam/"
}

load(file = paste0(path, "national-index-annual-pchange.RData"))
national <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "National Index", subtitle = "Annual Percent Change")
  
load(file = paste0(path, "san-diego-case-shiller-annual-pchange.RData"))
san_diego <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "San Diego") 

load(file = paste0(path, "new-york-case-shiller-annual-pchange.RData"))
new_york <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "New York") +
  ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

load(file = paste0(path, "los-angeles-case-shiller-annual-pchange.RData"))
los_angeles <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "Los Angeles") +
  ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

load(file = paste0(path, "chicago-case-shiller-annual-pchange.RData"))
chicago <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "Chicago") +
  ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

load(file = paste0(path, "san-francisco-case-shiller-annual-pchange.RData"))
san_francisco <- p + 
  ggplot2::theme(plot.caption = ggplot2::element_blank()) +
  ggplot2::labs(title = "San Francisco") +
  ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

foo <- gridExtra::grid.arrange(grobs = list(title, 
                                            national,
                                            san_diego,
                                            new_york,
                                            los_angeles,
                                            chicago,
                                            san_francisco), 
                               layout_matrix = lay)

ggplot2::ggsave("./housing-market/case-shiller/case-shiller.png", plot = foo, width = 10, height = 6.75, units = "in")