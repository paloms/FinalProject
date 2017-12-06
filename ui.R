# Colomaranian FinalProject
# UI

library(shiny)

our.ui <- fluidPage(
  titlePanel("Analyze Disease Patterns Around the World"),
  
  # Page Select
  navbarPage("Team Colomaranian",
    tabPanel("About Our Project"),
    tabPanel("Cholera Page",
             plotOutput("Cholera_plot"),
             uiOutput("dropdown1"),
             radioButtons(
               inputId="radio1",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
             )
             ),
    tabPanel("Malaria Page",
             plotOutput("Malaria_plot"),
             uiOutput("dropdown2"),
             radioButtons(
               inputId="radio2",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
               )
             ),
    tabPanel("HIV Page",
             plotOutput("HIV_plot"),
             uiOutput("dropdown3"),
             radioButtons(
               inputId="radio3",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
               )
             ),
    tabPanel("TB Page",
             plotOutput("TB_plot"),
             uiOutput("dropdown4"),
             radioButtons(
               inputId="radio4",
               label="Select Data to Display:",
               choices=c("New Patient Success Rate", "Previously Treated Patient Success Rate")
               )
             )
  )
  
)

shinyUI(our.ui)