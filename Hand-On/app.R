#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

ui <- fluidPage(
#Dropdown menu the user can use to choose from a list of selections
  selectInput(inputId = "greeting", 
              label = "Who do you want to greet, the greeting will be shown below",
              choices = c("world" = "Hello, world!", "friends" = "Hi, friends!", "people"= "Hey, people!")),
  
  #Output Display
  textOutput("greeting_text"),
  #tableOutput("Table_name")
  #plotOutput("Plot_name")
  
# Text input the user can type in answering a question
  textInput(inputId = "greeting",
            label = "Who do you want to greet",
            value = "Type your name"),
  
  sliderInput(inputId = "age",
              label = "How old are you?",
              min = 10, max = 90, value = 10),
  textOutput("older")
)


server <- function(input, output, session) {
#Render the selected greeting

  output$greeting_text <- renderText({input$greeting})
  
  output$older <- renderText(input$age)
   
}

# Run the application 
shinyApp(ui = ui, server = server)
