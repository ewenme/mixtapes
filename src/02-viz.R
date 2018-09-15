
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


# load --------------------------------------------------------------------

mixtapes <- read_csv("./data/datpiff-mixtapes.csv")


# clean -------------------------------------------------------------------

# set date vars
mixtapes$scrape_time <- dmy(mixtapes$scrape_time)


# visualise ---------------------------------------------------------------



