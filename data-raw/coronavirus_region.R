## code to prepare `coronavirus_region` dataset goes here

library(readr)
library(janitor)
library(tidyr)
library(magrittr)
library(dplyr)

coronavirus_region <- read_csv("coronavirus_region.csv") %>%
  filter(administrative_area_level_1=="Australia")%>%
  select("administrative_area_level_1","administrative_area_level_2","date","confirmed","recovered","deaths","latitude","longitude")%>%
  rename(Country=administrative_area_level_1,State=administrative_area_level_2)



  
usethis::use_data(coronavirus_region, overwrite = TRUE)
