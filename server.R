require(shiny)
source("map_utils.R")

shinyServer(function(input, output) {
  output$cor.map <- renderChart2({
    cor.map()
  })
  

})
