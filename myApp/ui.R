#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Exploring Motor Trend Car Road Test Relationships"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
        selectInput("xvar", "Pick an x variable", names(mtcars)),
        selectInput("yvar", "Pick a y variable", names(mtcars), "wt"),
        selectInput("groupcol", "Pick a variable to color the points", 
                    c("cyl", "am", "gear", "carb", "vs")),
        checkboxInput("displaylm", "Display linear regression model", TRUE),
        helpText("The data was extracted from the 1974 Motor Trend US magazine, 
                 and comprises fuel consumption and 10 aspects of automobile 
                 design and performance for 32 automobiles (1973 to 1974 models)."),
        helpText("mpg = Miles/gallon, cyl = Number of cylinders, disp = Displacement(cu.in.),
                 hp = Gross horsepower, drat = Rear axle ratio, wt = Weight(1000lbs),
                qsec = 1/4 mile time, vs = V/S, am = Transmission(0=automatic, 1=manual),
                gear = Number of forward gears, carb = Number of carburetors")
    ),
    
    mainPanel(
       plotOutput('plot1')
       
    )
  )
))
