library(shiny)

shinyUI(fluidPage(
  titlePanel("Word Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Begin typing, the app is trying to predict
               the next word(s) that you intent to write.
               Let the app 5 seconds for the data to get loaded."),
      
      textInput("text", label = h3("Start Typing..."), 
                value = ""),
      
      sliderInput("numberOfWords",
                  label = h3("Number of Words to predict"),
                  min = 1, 
                  max = 3, value = 3)
    ),
    
    mainPanel(
      h3("Next Word(s):"),
      textOutput("text1")
    )
  )
))
