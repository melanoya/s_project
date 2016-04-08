library(shiny)

x <-  read.csv('http://hsequantling.wikispaces.com/file/view/all_words.csv', encoding="UTF-8")
# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- x
    if (input$lang != "All") {
      data <- data[data$language == input$lang,]
    }
    data
  }))
  
})