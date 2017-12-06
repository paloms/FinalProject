treatment_TB <- read.csv("data/TB_DATA.csv",header = T,stringsAsFactors = FALSE)
library(ggplot2)
library(dplyr)
library(maps)

world_treatment_TB <- left_join(x = map_data("world"), y = treatment_TB, by = c("region" = "Country")) %>% arrange(Year)


colnames(world_treatment_TB) <- gsub(colnames(world_treatment_TB), "country", "number")

make_new_treatments_map <- function(year){
  treated_previously_year <- filter(world_treatment_TB, world_treatment_TB$Year == year)
  map<- ggplot(world_treatment_TB,aes(x=long,y=lat,group=group,fill=`Treatment success rate: new TB cases`))+
    geom_polygon() +
    scale_fill_continuous(low="Red",high = "#fee0d2") +
    ggtitle(paste("Treatment success rate for first time patients in",year))
  return(map)
  
}

make_previously_treated_map <- function(year){
  treated_previously_year <- filter(world_treatment_TB, world_treatment_TB$Year == year)
  map<- ggplot(world_treatment_TB,aes(x=long,y=lat,group=group,fill=`Treatment success rate: previously treated TB cases`))+
    geom_polygon() +
    scale_fill_continuous(low="Red",high = "#fee0d2") +
    ggtitle(paste("Treatment success rate in previously treated patients in",year))
  return(map)
}

list_years <- as.numeric((unique(treatment_TB$Year)))