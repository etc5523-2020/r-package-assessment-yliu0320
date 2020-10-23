## code to prepare `coronavirus_region` dataset goes here

library(readr)
library(janitor)
library(tidyr)
library(magrittr)
library(dplyr)

coronavirus_region <- read_csv("coronavirus_region.csv") %>%
  filter(administrative_area_level_1=="Australia")%>%
  select("administrative_area_level_1","administrative_area_level_2","date","confirmed","recovered","deaths")%>%
  rename(Country=administrative_area_level_1,State=administrative_area_level_2)
coronavirus_region$date <- as.Date(coronavirus_region$date)

coronavirus_region <- coronavirus_region %>%
  group_by(State) %>%
  mutate(daily_confirmed = confirmed - lag(confirmed),
         daily_recovered=recovered-lag(recovered),
         daily_deaths=deaths-lag(deaths))
coronavirus_region[is.na(coronavirus_region)]<- 0
  
usethis::use_data(coronavirus_region, overwrite = TRUE)
