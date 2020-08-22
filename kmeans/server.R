library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data(iris)
    
    
    data <- reactive ({ cbind(iris[[input$xaxis]], iris[[input$yaxis]])
    })
    
    model <- reactive ({ kmeans(data(), centers = input$clusterNum)
    })
    
    
    plotData <- reactive ({ d <- data.frame(data()[,1], data()[,2], model()$cluster, iris$Species) 
    
    names(d) <-  c(paste0(input$xaxis, ".x"), paste0(input$yaxis, ".y"), "cluster", "Species") 
    d$cluster <- factor(d$cluster)
    
    d
    })
    
    
    
    output$PLOT <- renderPlot({
        
        if(input$truth){
            
            ggplot(data = plotData(), aes_string(x = paste0(input$xaxis, ".x"), y = paste0(input$yaxis, ".y"), color = "Species")) +
                geom_point(size = 2) +
                labs(x = input$xaxis, y = input$xaxis, title = "k-means of the iris dataset")+ 
                theme(legend.position="bottom")
            
            
        }else{
            
            
            ggplot(data = plotData(), aes_string(x = paste0(input$xaxis, ".x"), y = paste0(input$yaxis, ".y"), color = "cluster")) +
                geom_point(size = 2) +
                labs(x = input$xaxis, y = input$xaxis, title = "k-means of the iris dataset") + 
                theme(legend.position="bottom")
            
        }
        
        
    })

})
