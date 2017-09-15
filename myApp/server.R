#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required
shinyServer(function(input, output) {
   
    # Combine selected variables into new data frame
    chosen <- reactive({
        mtcars[, c(input$xvar, input$yvar)]
    })
    
    fit <- reactive({
        form <- paste(input$yvar, "~", input$xvar)
        lm(form, data = mtcars)
    })
    
    # Create variable for colors
    groupcol <- reactive({
        mtcars[, input$groupcol]
    })
    
    # Plot data
    output$plot1 <- renderPlot({
        plot(chosen(), col = groupcol() + 1, pch = 20, cex = 2)
        if(input$displaylm == TRUE) {
            abline(fit())
        }
        legend("topright", legend = as.character(levels(as.factor(groupcol()))),
               pch = 20, col = as.numeric(levels(as.factor(groupcol())))+1)
    })
    
})
