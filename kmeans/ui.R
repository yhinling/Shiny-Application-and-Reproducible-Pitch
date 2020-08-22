
library(shiny)

shinyUI(fluidPage(
    sidebarLayout(
        
        
        sidebarPanel(
            
            selectInput(inputId = "xaxis", label = "x-axis", choices = names(iris)[-5], selected = names(iris)[1]),
            selectInput(inputId = "yaxis", label = "y-axis", choices = names(iris)[-5], selected = names(iris)[2]),
            sliderInput(inputId = "clusterNum", label = "Number of clusters", value = 3, min = 1, max = 5, step = 1),
            checkboxInput(inputId = "truth", label = "Truth", value = FALSE),
            actionButton(inputId='ab1', label="Learn More", 
                         icon = icon("th"), 
                         onclick ="window.open('https://rpubs.com/yhinling/651610', '_blank')")
        ),
        
        mainPanel(
            h1("Course Project: Shiny Application and Reproducible Pitch"),
            "by", strong("yhinling"),
            plotOutput("PLOT")
            
            
        )
        
        
        
    )
))
