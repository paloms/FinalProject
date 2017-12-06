# Colomaranian FinalProject
# Server

library(shiny)
library(ggplot2)

our.server <- function(input, output) {
  output$dropdown1 <- renderUI({
    source("Cholera.R")
    selectInput("years1", "Select Year:", cholera_years)
  })
  
  output$Cholera_plot <- renderPlot({
    source("Cholera.R")
    if(input$radio1 == "Reported Deaths") {deaths_cholera_world(input$years1)}
    else{cases_cholera_world(input$years1)}
  })
  
  output$dropdown2 <- renderUI({
    source("Malaria.R")
    selectInput("years2", "Select Year:", years_maralia)
  })
  
  output$Malaria_plot <- renderPlot({
    source("Malaria.R")
    if(input$radio2 == "Reported Deaths") {make_map_death_malaria(input$years2)}
    else{make_map_case_malaria(input$years2)}
  })
  
  output$dropdown3 <- renderUI({
    source("HIV.R")
    if(input$radio3 == "Reported Deaths") {selectInput("years3", "Select Year:", death_years)}
    else{selectInput("years3", "Select Year:", cases_years)}
  })
  
  output$HIV_plot <- renderPlot({
    source("HIV.R")
    if(input$radio3 == "Reported Deaths") {hiv_death_map(input$years3)}
    else{hiv_cases_map(input$years3)}
  })
  
  output$dropdown4 <- renderUI({
    source("TB.R")
    selectInput("years4", "Select Year:", list_years)
  })
  
  output$TB_plot <- renderPlot({
    source("TB.R")
    if(input$radio4 == "New Patient Success Rate") {make_new_treatments_map(input$years4)}
    else{make_previously_treated_map(input$years4)}
  })
}

shinyServer(our.server)