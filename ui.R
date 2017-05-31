#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("animals",
                   "Number of Animals:",
                   min = 10,
                   max = 50,
                   value = 30)
    ),
    # Actionbutton
    #actionButton()
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Optimal Foraging", plotOutput("foraging")),
        tabPanel("Theory of Optimal Foraging", includeMarkdown("explanation.Rmd"))
      )
    )
  )
))

