death_malaria <- read.csv("data/NUMBER_OF_REPORTED_DEATHS_MALARIA.csv",header = T,skip=1,stringsAsFactors = FALSE)
cases_malaria <- read.csv("data/NUMBER_OF_REPORTED_MALARIA_CASES.csv",header = T,skip=1,stringsAsFactors = FALSE)

library(ggplot2)
library(dplyr)

years_maralia <- gsub("X","",colnames(death_malaria)[-1])


for (i in 2:length(colnames(cases_malaria))){cases_malaria[,i] <-  as.numeric(gsub(" ","",cases_malaria[,i]))}
for (i in 2:length(colnames(death_malaria))){death_malaria[,i] <-  as.numeric(gsub(" ","",death_malaria[,i]))}
death_malaria <- merge(map_data("world"),death_malaria,by.x = "region",by.y = "Country",all.x = TRUE) %>% arrange(order)
cases_malaria <- merge(map_data("world"),cases_malaria,by.x = "region",by.y = "Country",all.x = TRUE) %>% arrange(order)

make_map_death_malaria <- function(year){
assign(paste("death_toll_by_malaria"),eval(parse(text=paste0("death_malaria$X",year))))
h<- ggplot(death_malaria,aes(x=long,y=lat,group=group,fill=death_toll_by_malaria))+
  geom_polygon() +
  scale_fill_continuous(low="#fee0d2",high = "Red") +
  ggtitle(paste("Death by malaria in",year))
return(h)
}

make_map_case_malaria <- function(year){
  assign(paste("case_of_malaria"),eval(parse(text=paste0("cases_malaria$X.",year))))
  h<- ggplot(cases_malaria,aes(x=long,y=lat,group=group,fill=case_of_malaria))+
    geom_polygon() +
    scale_fill_continuous(low="#fee0d2",high = "Red") +
    ggtitle(paste("Cases of malaria in",year))
  return(h)
}


