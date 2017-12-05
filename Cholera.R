# For the Cholera Page. Provides three functions, 1: creates a map indicating the number of
# cases reported of cholera for the provided coutry. 2: creates a map indicating the number of
# deaths reported due to cholera for the provided country. 3: returns a list indicating the number
# of years there is data for cholera cases and deaths(some countries have more data, some has less). 

library(dplyr) 
library(ggplot2)

number_of_cases <- read.csv("data/NUMBER_OF_CASES_CHOLERA.csv",header=TRUE)
number_of_deaths <- read.csv("data/NUMBER_OF_DEATHS_CHOLERA.csv",header=TRUE)

# Creates a map indicating the number of cases reported for the country provided.
cases_cholera_world<- function(input) {
  cases_cholera <- filter(number_of_cases, input == county)
  map<- ggplot(cases_cholera,aes(long,lat,group=group,fill=cases_cholera))+ geom_polygon() +
    scale_fill_continuous(low="khaki1",high ="Yellow") + ggtitle("Reported Cholera Cases in ",input)
  return(map)
}

# Creates a map indicating the number of reported deaths for the country provided.
deaths_cholera_world <- function(input) {
  deaths_cholera <- filter(number_of_deaths, input == country)
  map<- ggplot(deaths_cholera,aes(long,lat,group=group,fill=deaths_cholera))+ geom_polygon() +
    scale_fill_continuous(low="lightcoral",high ="Red") + ggtitle("Reported Cholera Deaths in ",input)
  return(map)
}

#returns a list containing the number of years data covers 
list_of_years_cholera <- function(input) {
  year_of_earliest_tracking_cases <- select(arrange(number_of_cases,Year)[1,],Year)
  year_of_latest_tracking_cases <- select(arrange(number_of_cases,-Year)[1,],Year)
  return(year_of_earliest_tracking_cases[1,]:year_of_latest_tracking_cases[1,])
}
