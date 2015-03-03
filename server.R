require(shiny)
source("map_utils.R")

shinyServer(function(input, output) {
  output$cor.map <- renderChart2({
    ichoropleth(eval(parse(text = input$cor.metric)) ~ State.Abb, data = edu_data, pal="RdYlGn", ncuts=11)
  })

})
