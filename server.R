library(shiny)
library(ggplot2)
library(igraph)

# Define server logic required to find out sign and graph of the day

sign <- function(x){
        sign <- ""

        year <- as.numeric(format(as.Date(x, "%Y/%m/%d"), "%Y"))
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "3/21", sep = "/")), 
                                 as.Date(paste(year, "4/20", sep = "/")), "days")) sign <- "Aries" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "4/21", sep = "/")), 
                                 as.Date(paste(year, "5/20", sep = "/")), "days")) sign <- "Taurus" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "5/21", sep = "/")), 
                                 as.Date(paste(year, "6/20", sep = "/")), "days")) sign <- "Gemini" 
     
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "6/21", sep = "/")), 
                                 as.Date(paste(year, "7/20", sep = "/")), "days")) sign <- "Cancer" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "7/21", sep = "/")), 
                                 as.Date(paste(year, "8/20", sep = "/")), "days")) sign <- "Leo" 
   
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "8/21", sep = "/")), 
                                 as.Date(paste(year, "9/20", sep = "/")), "days")) sign <- "Virgo" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "9/21", sep = "/")), 
                                 as.Date(paste(year, "10/20", sep = "/")), "days")) sign <- "Libra" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "10/21", sep = "/")), 
                                 as.Date(paste(year, "11/20", sep = "/")), "days")) sign <- "Scorpio" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "11/21", sep = "/")), 
                                 as.Date(paste(year, "12/20", sep = "/")), "days")) sign <- "Sagittarius" 
       
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "12/21", sep = "/")), 
                                 as.Date(paste(year, "12/31", sep = "/")), "days")
           | x %in% seq(as.Date(paste(year, "1/1", sep = "/")), 
                        as.Date(paste(year, "1/20", sep = "/")), "days")) sign <- "Capricorn" 

        if(as.Date(x)  %in%  seq(as.Date(paste(year, "1/21", sep = "/")), 
                                 as.Date(paste(year, "2/21", sep = "/")), "days")) sign <- "Aquarius" 
        
        if(as.Date(x)  %in%  seq(as.Date(paste(year, "2/21", sep = "/")), 
                                 as.Date(paste(year, "3/20", sep = "/")), "days")) sign <- "Pisces" 

        return(sign)
}


shinyServer(function(input, output) {
        
        output$odate <- renderPrint({input$date})      
        output$onum <- renderPrint({input$num}) 

        output$prediction <- renderPrint({sign(input$date)})   

                output$newHist <- renderPlot({
                                  
                coeff <- switch(sign(input$date), 
                                "Aries" = 10,
                                "Taurus" = 12,
                                "Gemini" = 13,
                                "Cancer" = 14,
                                "Leo" = 15,
                                "Virgo" = 16,
                                "Libra" = 17,
                                "Scorpio" = 18,
                                "Sagittarius" = 19,
                                "Capricorn" = 21,
                                "Aquarius" = 23,
                                "Pisces" = 27)
                         
                obs <- coeff + input$num
                
                g <- erdos.renyi.game(obs, 1/10)
                
                par(bg = "lightblue")
                
                plot(g, vertex.label.color="yellow", vertex.label.font=2,
                     vertex.color=input$Color, edge.color="black")
  
        })
       
        }
)