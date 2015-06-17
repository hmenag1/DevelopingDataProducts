library(shiny)

library(stringr)
library(qdap)

shinyServer(function(input, output) {
  
  output$tbl = renderDataTable({
    text <- unlist(str_split(input$text, pattern = "\n"))
    text <- text[!grepl("^\\s*$", text)]
    
    text <- gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", text)
    text <- gsub("@\\w+", "", text)
    text <- gsub("[[:punct:]]", "", text)
    text <- gsub("[[:digit:]]", "", text)
    text <- gsub("http\\w+", "", text)
    text <- gsub("[ \t]{2,}", "", text)
    text <- gsub("^\\s+|\\s+$", "", text)    
    text <- tolower(text)   
    
    sentiment <- sapply(text, function(x) polarity(x)$all$polarity)
    sentiment <- ifelse(sentiment < 0, "- Negative",
                        ifelse(sentiment > 0, "+ Positive", "Neutral"))
    
    data.frame(
      text = text,
      sentiment = sentiment
    )
  }, options = list(pageLength = 20))
  
})
