library(shiny)

# Initial parameters for BMI chart.
## Chart code sourced from the following site
## http://sas-and-r.blogspot.ie/2010/04/example-731-contour-plot-of-bmi-by.html
## (accessed 24th August 2014)
## Converted to metric.
ht = seq(1.2,2.2, length.out=1000)
wt = seq(40,140, length.out=1000)
wtht = expand.grid(x=ht, y=wt)
bmi = function(h,w) { w /(h*h)}
bmiwtht = matrix(bmi(wtht$x,wtht$y),length(ht),length(wt))

# Define server logic required to calc and visualise BMI
shinyServer(
    function(input, output) {
    
    # BMI Calculation
    BMI <- reactive({
        round( input$weight / input$height^2, digits=1 )
    })
        
    output$text1 <- renderText({
        paste("(Weight", input$weight, "kg, and Height", input$height, "m)")
    })
    
    output$BMItext <- renderText({
        BMI()
    })
    
    output$main_plot <- renderPlot({
        par(mar=c(4,4,0,0))
        contour(ht,wt,bmiwtht,levels = c(18.5,25,30), drawlabels=FALSE,
                xlab="Height (metres)",ylab="Weight (kgs)")
        
        text(1.4,90,"Obese",cex=2,srt=45)
        text(1.71,80,"Overweight",cex=2,srt=32)
        text(1.75,67,"Normal",cex=2,srt=28)
        text(1.95,54,"Underweight",cex=2,srt=22)
        
        # Insert specific BMI observation
        points(input$height, input$weight, pch = 21, bg = "red", cex = 2)
    })
    
    }
)
