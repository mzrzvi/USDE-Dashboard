require(shiny)
require(rMaps)
require(rCharts)

shinyUI(
  navbarPage(
    theme = "bootstrap.css",
    title = "USDE Dashboard",
    
    tabPanel("Correlation Builder",
             sidebarLayout(
               sidebarPanel(
#                  uiOutput("cor.choose.metric")
#                  dateRangeInput("cor.dates",
#                                 label = "Date Range:",
#                                 start = min.date,
#                                 end = max.date
#                  )
                  selectInput("cor.metric", 
                             label = "Metric:",
                             choices = cor.metrics.util(),
                             selected = "Pupil.to.Teacher",
                             multiple = F
                 )
               ),
               mainPanel(
                 showOutput("cor.map","datamaps")
               )
             )
    )
  )
)