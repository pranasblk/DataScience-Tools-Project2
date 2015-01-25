# Project
The project is related to  coursera.com assignment for:

 * Specialization: Data Science
 * Course: Developing Data Products 
 * Project1 / Part 2
 
 The application is based on sample exporatory shiny examples and Regresssion Models project. Purpose is to explore `mtcars` data set.
 
# How to run
 * Install devtools `install.packages(“devtools”)`
 * Install shiny `install.packages("shiny")`
 * Run the application `library(shiny); runGitHub('DataScience-Tools-Project2', 'pranasblk')`

# How it works
UI input contains:

 * Sample size - the size of data element to analyse;
 * X - x axis;
 * Y - y axis;
 * Color - colour of data points;
 * Smooth - checkbos to show or remove linear regression line with confidence intervals;
 * Facet Row - the faced to partition data and show graphs in rows;
 * Facet Column - the faced to partinion data and show graphs in columns.
 
Logic:

  * The `ggplot2` functions used to display reactive parts of the output graph:
  * Original data set is randomized taking into account `sampleSize` => `mtcars[sample(nrow(mtcars), input$sampleSize),]`
  * `aes_string(x=input$x, y=input$y)` is used to set x and y axis;
  * `aes_string(color=input$color)` the coluor is set if required;
  * `stat_smooth(method = "lm")` the linear model smoothing added if required;
  * `facets <- paste(input$facet_row, '~', input$facet_col); facet_grid(facets)` facets added if required.
