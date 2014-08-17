require(shiny)
require(rMaps)
require(rCharts)
require(dplyr)

edu_data <- read.csv("required_data/USDE_stats.csv")

edu_data$State.Abb <- state.abb[match(edu_data$State.Name,state.name)]

cor.metrics.util <- function(){setdiff(colnames(edu_data),'State.Name')}

cor.map <- function(){
  
  ichoropleth(Pupil.to.Teacher ~ State.Abb, data = edu_data, pal="RdYlGn", ncuts=11)
}

