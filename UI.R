library(shiny)

# Define UI for application that calculates BMI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with text inputs for weight and height
    sidebarLayout(
        sidebarPanel(
            h4("Input your details:"),
            numericInput("weight", "Weight, kg:", 0),
            numericInput("height", "Height, m:", 0),
            h4("BMI Calculation:"),
            p("= Weight(kg) / Height(m)^2"),
            img(src="BMI_Eqn.png", height = 72, width = 201)
        ),
        
        # Show a result and plot
        mainPanel(
            
            textOutput("text1"),
            
            h4("BMI:"),
            verbatimTextOutput("BMItext"),
            
            h4("BMI Classification shown with Red Dot:"),            
            plotOutput(outputId = "main_plot", height = "400px")
        )
    )
))
