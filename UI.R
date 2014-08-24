library(shiny)

# Define UI for application that calculates BMI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Input your details:"),
            numericInput("weight", "Weight, kg:", 0),
            numericInput("height", "Height, m:", 0)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            
            textOutput("text1"),
            
            h4("BMI:"),
            verbatimTextOutput("BMItext"),
            
            h4("BMI Classification shown with Red Dot:"),            
            plotOutput(outputId = "main_plot", height = "400px")
        )
    )
))
