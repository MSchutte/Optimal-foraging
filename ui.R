# This is the user-interface definition of the Shiny web application
# 'Simulation of Optimal Foraging'.
# Author: Manon Schutte
# June 2017
#
# run the application by clicking 'Run App' above.

library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Optimal Foraging in human memory search"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("animalsLength",
                   "Number of Animals:",
                   min = 10,
                   max = 50,
                   value = 10),
       # Actionbutton
       actionButton("goButton", "Search!"),
       tableOutput("generateditems")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Optimal Foraging", 
                 radialNetworkOutput("foragingnetwork")),
        tabPanel("Theory of Optimal Foraging", includeMarkdown("explanation.Rmd"))
      )
    )
  )
))

