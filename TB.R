library(ggplot2)
library(dplyr)
library(maps)

namechange <- read.csv("namechange.csv", header = T, stringsAsFactors = F)

# Prepare data for mapping
treatment_TB <- read.csv("data/TB_DATA.csv",header = T,stringsAsFactors = FALSE) %>%
  select(Country, Year, Treatment.success.rate..new.TB.cases, Treatment.success.rate..previously.treated.TB.cases)
colnames(treatment_TB) <- c("country", "year", "newTreatments", "prevTreatments")
treatment_TB[treatment_TB == "No data"] <- 100
for(i in 1:nrow(namechange)) { # To standardize country names between data and world map
  treatment_TB[treatment_TB == namechange$OldName[i]] <- namechange$NewName[i]
}

# merge data with world map coordinates
world_treatment_TB <- left_join(x = map_data("world"), y = treatment_TB, by = c("region" = "country")) %>% arrange(year)

# Returns world map of new patient success in a given year
make_new_treatments_map <- function(input){
  treated_new_year <- filter(world_treatment_TB, year == 2010)
  map<- ggplot(treated_new_year,aes(x=long,y=lat,group=group,
                                      fill=as.numeric(treated_new_year$newTreatments)))+
    geom_polygon() +
    scale_fill_continuous(low="Red",high = "#fee0d2", name = "Success rate %") +
    ggtitle(paste("Treatment success rate for first time patients in",input))
  return(map)
}

# Returns world map of previously treated patient success in a given year
make_previously_treated_map <- function(input){
  treated_previously_year <- filter(world_treatment_TB, year == input)
  map<- ggplot(treated_previously_year,aes(x=long,y=lat,group=group,
                                           fill=as.numeric(treated_previously_year$prevTreatments)))+
    geom_polygon() +
    scale_fill_continuous(low="Red",high = "#fee0d2", name = "Success rate %") +
    ggtitle(paste("Treatment success rate in previously treated patients in",input))
  return(map)
}

# Variable that returns list of years available to look at in data
list_years <- as.numeric((unique(treatment_TB$year)))
