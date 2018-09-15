
# setup -------------------------------------------------------------------

# install packages if missing and load local functions
source("./src/00-global.R")

# load packages
library(rvest)
library(stringr)
library(dplyr)
library(purrr)
library(readr)


# scrape ------------------------------------------------------------------

# get gold mixtapes
gold_mixtapes <- map_dfr(1:20, scrape_datpiff_page, mixtape_category = "gold")

# get platinum mixtapes
platinum_mixtapes <- map_dfr(1:20, scrape_datpiff_page, mixtape_category = "platinum") 
  
# get double platinum mixtapes
dbl_platinum_mixtapes <- map_dfr(1:20, scrape_datpiff_page, mixtape_category = "2xplatinum") 


# clean -------------------------------------------------------------------

# combine mixtapes
mixtapes <- bind_rows(gold_mixtapes, platinum_mixtapes, dbl_platinum_mixtapes)

# remove duplicates
mixtapes <- distinct(mixtapes, .keep_all = TRUE)

# sort by downloads
mixtapes <- arrange(mixtapes, desc(downloads))


# export ------------------------------------------------------------------

# write data 
write_csv(mixtapes, path = "./raw-data/datpiff-mixtapes.csv")
