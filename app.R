# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

devtools::install_github("https://github.com/AqsaIftikhar25/APILab.git" , upgrade = "always", force = TRUE)
library(APIpkg)
#source("votesinfo.R")
dataContext <- vott("C",2015,2020)#calling API outside in order to download all required data


# Define UI for application that draws a histogram

ui <- fluidPage(

    # Application title
    titlePanel("Vote information based on Parties"),

    # Sidebar with a slider input for every year 
    sidebarLayout(
        sidebarPanel(
              sliderInput(inputId = "bins",
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
       #bins <- seq(min(dataContext[,2]), max(dataContext[,2]), length.out = input$bins+1)
       
        x <- c(1:length(dataContext[,1]))
        # draw the histogram with the specified number of bins
        plot(x, dataContext[,2] ,type = "h", col = 'darkblue', border = 'white', main = paste("Histogram of votes"),xlab = "Members", ylab = "Number of approve")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
