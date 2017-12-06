# For the Cholera Page. Provides two functions, 1: creates a map indicating the number of
# cases reported of cholera for the provided coutry. 2: creates a map indicating the number of
# deaths reported due to cholera for the provided country. Variable at bottom returns number
# of years there is data for cholera cases and deaths(some countries have more data, some has less). 

library(dplyr) 
library(ggplot2)

namechange <- read.csv("namechange.csv", header = TRUE, stringsAsFactors = FALSE)

# Preparing case report data
number_of_cases <- read.csv("data/NUMBER_OF_CASES_CHOLERA.csv",header=TRUE, stringsAsFactors = FALSE)
for(i in 1:nrow(namechange)) { # To standardize country names between data and world map
  number_of_cases[number_of_cases == namechange$OldName[i]] <- namechange$NewName[i]
}
colnames(number_of_cases)[3] <- "reported"
number_of_cases <- left_join(x = map_data("world"), y = number_of_cases, by = c("region" = "Country")) %>%
  arrange(Year)
number_of_cases[is.na(number_of_cases)] <- 0


# Preparing death report data
number_of_deaths <- read.csv("data/NUMBER_OF_DEATHS_CHOLERA.csv",header=TRUE, stringsAsFactors = FALSE)
for(i in 1:nrow(namechange)) { # To standardize country names between data and world map
  number_of_deaths[number_of_deaths == namechange$OldName[i]] <- namechange$NewName[i]
}
colnames(number_of_deaths)[3] <- "reported"
number_of_deaths <- left_join(x = map_data("world"), y = number_of_deaths, by = c("region" = "Country")) %>%
  arrange(Year)
number_of_deaths[is.na(number_of_deaths)] <- 0


# Creates a map indicating the number of cases reported for the year provided.
cases_cholera_world<- function(input) {
  cases_cholera <- filter(number_of_cases, Year == input)
  map<- ggplot(cases_cholera,aes(long,lat,group=group,fill=as.numeric(cases_cholera$reported))) + 
    geom_polygon() +
    scale_fill_continuous(low="khaki1",high ="Yellow", name = "Cases Reported") + 
    ggtitle(paste("Reported Cholera Cases in",input))
  return(map)
}

# Creates a map indicating the number of reported deaths for the year provided.
deaths_cholera_world <- function(input) {
  deaths_cholera <- filter(number_of_deaths, Year == input)
  map<- ggplot(deaths_cholera,aes(long,lat,group=group,fill=as.numeric(deaths_cholera$reported))) + 
    geom_polygon() +
    scale_fill_continuous(low="lightcoral",high ="Red", name="Deaths Reported") + 
    ggtitle(paste("Reported Cholera Deaths in",input))
  return(map)
}

# Variable to access possible years to look at data with
cholera_years <- as.numeric(na.omit(unique(number_of_deaths$Year)))