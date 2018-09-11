
# dependencies ------------------------------------------------------------

# install CRAN packages if missing
list.of.packages <- c("rvest", "dplyr", "stringr", "purrr", "readr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

rm(list.of.packages, new.packages)


# global parameters -------------------------------------------------------

# base url
base_url <- "https://www.datpiff.com/mixtapes/"


# functions ---------------------------------------------------------------

# scrape a mixtape awarded category from datpiff
scrape_mixtapes <- function(mixtape_category, page) {
  
  # read page
  page <- read_html(paste0(base_url, mixtape_category, "/", page)) %>% 
    html_nodes("div.contentListing.celebrated")
  
  # get titles
  titles <- page %>% 
    html_nodes(css = "[class=title]") %>% 
    html_text()
  
  # get artists
  artists <- page %>% 
    html_nodes(css = "[class=artist]") %>% 
    html_text()
  
  # get text
  downloads <- page %>% 
    html_nodes(css = "[class=text]") %>% 
    html_text() %>% 
    str_extract_all("[0-9,;]+$") %>% 
    unlist() %>% 
    str_remove_all(",") %>% 
    as.numeric()
  
  # create data frame
  return(tibble::tibble(
    artist = artists,
    title = titles,
    downloads = downloads
  ))
  
}
