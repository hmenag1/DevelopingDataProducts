library(shiny)

shinyUI(fluidPage(
  
  div(
    img(src = "logo.png", align = "right"),
    titlePanel("Poem Sentiment Analyzer"),
    
    tabsetPanel(
      tabPanel("Data", 
               tags$body(
                 tags$div(id = "main", style = "margin-left: auto; margin-right: auto",
                   tags$p("This is an application for analyzing sentiment (positive, neutral, negative) of poems or other multi-line texts. Each line is analyzed separately."),
                   tags$p("At the moment application does not support languages other than English."),
                   tags$p("Paste or enter a poem, lyrics of your favourite song or just some text in the box below, press the blue button and go to the Result tab."),
                   tags$br(), tags$br(),
                   tags$textarea(id = "text", rows = 15, cols = 100, ""),
                   tags$br(),
                   submitButton("Submit for sentiment analysis")
                 )
               ),               
               style = "padding-top: 10px"
      ),
      tabPanel("Result",       
               tags$body(
                 tags$div(id = "main", style = "margin-left: auto; margin-right: auto",
                   dataTableOutput("tbl")
                 )
               ),
               style = "padding-top: 10px"
      )
    ),
    style = "width: 75%; margin-left: auto; margin-right: auto"
  )
  
))