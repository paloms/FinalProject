# FinalProject
# HIV/AIDS Page

# Provides 2 functions for the HIV/AIDS page, 1: returns a world map that visualizes the 
# number of reported deaths with a given year, 2: returns a world map of number of reported cases
# with a given year

library(ggplot2)
library(dplyr)

namechange <- read.csv("namechange.csv", header = T, stringsAsFactors = F)

# Prepares reported death data
death_hiv <- read.csv("data/DEATHS_DUE_TO_HIVAIDS.csv",header = T,stringsAsFactors = F) %>%
  select(YEAR..DISPLAY., COUNTRY..DISPLAY., Numeric) %>% arrange(YEAR..DISPLAY.)
colnames(death_hiv) <- c("year", "country", "number")
for(i in 1:nrow(namechange)) { # To standardize country names between data and world map
  death_hiv[death_hiv == namechange$OldName[i]] <- namechange$NewName[i]
}
death_hiv[is.na(death_hiv)] <- 0
death_hiv <- left_join(x = map_data("world"), y = death_hiv, by = c("region" = "country")) %>%
  arrange(year)

# Prepares reported cases data
cases_hiv<- read.csv("data/LIVING_WITH_HIV_ESTIMATES.csv",header = T,stringsAsFactors = F) %>%
  select(YEAR..DISPLAY., COUNTRY..DISPLAY., Numeric)
colnames(cases_hiv) <- c("year", "country", "number")
for(i in 1:nrow(namechange)) {
  cases_hiv[cases_hiv == namechange$OldName[i]] <- namechange$NewName[i]
}
cases_hiv[is.na(cases_hiv)] <- 0
cases_hiv <- left_join(x = map_data("world"), y = cases_hiv, by = c("region" = "country")) %>%
  arrange(year)

# Plots world map of deaths, takes in a year as input
hiv_death_map <- function(input) {
  map_data <- filter(death_hiv, year == input)
  map <- ggplot(map_data, aes(x=long, y=lat, group=group, fill=map_data$number)) +
    geom_polygon() +
    scale_fill_continuous(low="lightyellow", high="magenta", name = "# of Deaths") +
    ggtitle(paste("Reported HIV/AIDS Deaths in", input))
  return(map)
}

# Plots world map of cases, takes in a year as input
hiv_cases_map <- function(input) {
  map_data <- filter(cases_hiv, year == input)
  map <- ggplot(map_data, aes(x=long, y=lat, group=group, fill=map_data$number)) +
    geom_polygon() +
    scale_fill_continuous(low="seashell", high="indianred4", name = "# of Cases") +
    ggtitle(paste("Reported HIV/AIDS Cases in", input))
  return(map)
}

# Variables to access possible dates to look at data with
death_years <- as.numeric(na.omit(unique(death_hiv$year)))
cases_years <- as.numeric(na.omit(unique(cases_hiv$year)))
