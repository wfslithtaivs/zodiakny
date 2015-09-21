library(shiny)

# Define UI for zodiakny application

# Input block

shinyUI(pageWithSidebar(
        
        headerPanel("Choose the day and got the sign of your day"),
        
        sidebarPanel(
                
                
                withTags({
                        div(class="header", checked=NA, style = "color:grey", 
                            p("Choose your DoB, random number and your favorite color"),
                                p("and press Submit button --->  ")
                        )
                }),
                
                
                dateInput("date", "Input your DoB:"), 
                
                sliderInput("num", 
                            "Add some luck to your day:", 
                            min = 1,
                            max = 100, 
                            value = 5),
                
                selectInput("Color", "Choose the color:", 
                            choices = c("darkgreen", "blue", "red", "black", "purple", "salmon", "orange", "darkblue")),

                
                submitButton('Submit'),
                
                withTags({
                        div(class="header", checked=NA, style = "color:grey", 
                            p(""), 
                            p("Enjoy your personal graph and/or --->"),
                            a(href="https://github.com/wfslithtaivs/zodiakny", "Review code here")
                        )
                })                
                
        ),
        
# Block of outputs
 
        mainPanel(
                
                h4('You entered:'),
                verbatimTextOutput("odate"),
                h4('You luck will be adjusted by:'),
                verbatimTextOutput("onum"),
                h4('Your sign is:'),
                verbatimTextOutput("prediction"),
                
                tabsetPanel(
                        tabPanel("Graph of your day --->", plotOutput("newHist")), 
                        
                        tabPanel("What to do with this graph?", 
                                 
                                 withTags({
                                         div(class="header", checked=NA,
                                             p(""),
                                             p("Feel free to interpret this graph in any convenient way"),
                                             p("For example, eat the number of cookies equal to the top point index and get the super good mood."),
                                             p(""),
                                             img(src = "http://1.bp.blogspot.com/_S_-QgMMnEi0/TDClySQpiiI/AAAAAAAAAAM/Bnwuwr4KgOk/S220/CookieMonsterFace.jpg"),
                                             p(""),
                                             p("Or try again if the graph looks not funny.")
                                       )
                                 })
                                       
                                 
                                 )
                        )
                
                )
))
