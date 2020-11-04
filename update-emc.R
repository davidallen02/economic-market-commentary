library(magrittr)

scripts <- list.files(getwd(), recursive = TRUE) 
scripts <- scripts[stringr::str_detect(scripts, ".R")]
scripts <- scripts[stringr::str_detect(scripts, ".Rproj", negate = TRUE)]
scripts <- scripts[stringr::str_detect(scripts, "update-emc", negate = TRUE)]

f <- function(path){
  print(path)
  source(path)
}


scripts %>% purrr::map(f)
