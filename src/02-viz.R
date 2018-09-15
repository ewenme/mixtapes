
# setup -------------------------------------------------------------------

# install packages if missing and load local functions
source("./src/00-global.R")

# load packages
library(rvest)
library(stringr)
library(dplyr)
library(purrr)
library(readr)
library(ggplot2)
library(lubridate)
library(ggraph)
library(ggforce)


# load --------------------------------------------------------------------

mixtapes <- read_csv("./data/datpiff-mixtapes.csv")


# clean -------------------------------------------------------------------

# set date vars
mixtapes$scrape_time <- dmy(mixtapes$scrape_time)


# analyse -----------------------------------------------------------------

# get artist d/l counts
artist_downloads <- mixtapes %>% 
  count(artist, wt = downloads) %>% 
  arrange(desc(n)) %>% 
  filter(artist != "Various Artists") %>% 
  rename(name=artist, value=)

write_csv(artist_downloads, path = "./data/artist-dl-counts.csv")
