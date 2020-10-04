# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

devtools::install_github("https://github.com/AqsaIftikhar25/APILab.git" , upgrade = "always")
library("APIpkg")
#source("./votesinfo.R")
#dataContext <- vott()#calling API outside in order to download all required data


# Define UI for application that draws a histogram

ui <- fluidPage(

    # Application title
    titlePanel("Vote information based on Parties"),

    # Sidebar with a slider input for every year 
    sidebarLayout(
        sidebarPanel(
              sliderInput(inputId = "year",
                        label = "Choose a year to see votes to each person",
                        min = 2002,
                        max = 2020,
                        value = 2010)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("votout")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$votout <- renderPlot({
        # generate year based on input$year from ui.R
        #i <- 30
        #x    <- approve
       # approve <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length.out = i+1)
x <- c(1:length(nam))
        # draw the histogram with the specified number of bins
        plot(x, approve, type = "h", col = 'darkblue', border = 'white', main = paste("Histogram of votes"))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
