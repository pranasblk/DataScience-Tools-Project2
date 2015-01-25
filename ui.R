library(shiny)
library(ggplot2)

## Adaptation of sample shiny applicatio to explore `mtcars` dataset.
## Inspired by the project of 
## Regression Models to predict `mpg` and see if `am` has impact on `mpg`.
dataset <- mtcars

shinyUI(pageWithSidebar(
  
  headerPanel("Cars Explorer"),
  
  sidebarPanel(
    # The number of cars to display
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(32, nrow(dataset)), step=1, round=0),
    
    # The X axis
    selectInput('x', 'X', names(dataset), "hp"),
    
    # The Y axis 
    selectInput('y', 'Y', names(dataset), "mpg"),
    
    # Colour of data points
    selectInput('color', 'Color', c('None', names(dataset)), "wt"),
    
    # Smoothing line
    checkboxInput('smooth', 'Smooth', T),
    
    # Set facets to display
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)), "am")
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput('plot')),
      tabPanel("Documentation", includeHTML("README.html"))
    )
  )
))