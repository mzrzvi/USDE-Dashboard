require(shiny)
require(rMaps)
require(rCharts)
require(dplyr)

edu_data <- read.csv("required_data/USDE_stats.csv")

edu_data$State.Abb <- state.abb[match(edu_data$State.Name,state.name)]

cor.metrics.util <- function(){setdiff(colnames(edu_data),'State.Name')}

cor.map <- function(){
  ichoropleth(eval(parse(text = input$cor.metric)) ~ State.Abb, data = edu_data, pal="RdYlGn", ncuts=11)
}

cor.choose.metric <- function(){
  selectInput("cor.metric", 
              label = "Metric:",
              choices = c("Total Schools" = "Total.Number.of.Schools",
                          "Total Students" = "Total.Students",
                          "Total Male" = "Total..All.Grades..male.",
                          "Total Female" = "Total..All.Grades..female.",
                          "Total American Indian" = "Total.Students..Amer.Ind.AK.Native",
                          "Total Asian/Pacific Islander" = "Total.Students..Asian.Pacific.Islander",
                          "Total Black" = "Total.Students..Black",
                          "Total Hispanic" = "Total.Students..Hispanic",
                          "Total White" = "Total.Students..White",
                          "Total Multiracial" = "Total.Students..Two.or.more.Races",
                          "Prekindergarten" = "Prekindergarten.Students",
                          "Kindergarten" = "Kindergarten.Students",
                          "First Grade" = "First.Grade.Students",
                          "Second Grade" = "Second.Grade.Students",
                          "Third Grade" = "Third.Grade.Students",
                          "Fourth Grade" = "Fourth.Grade.Students",
                          "Fifth Grade" = "Fifth.Grade.Students",
                          "Sixth Grade" = "Sixth.Grade.Students",
                          "Seventh Grade" = "Seventh.Grade.Students",
                          "Eighth Grade" = "Eighth.Grade.Students",
                          "Ninth Grade" = "Ninth.Grade.Students",
                          "Tenth Grade" = "Tenth.Grade.Students",
                          "Eleventh Grade" = "Eleventh.Grade.Students",
                          "Twelfth Grade" = "Twelfth.Grade.Students",
                          "Ungraded Students" = "Ungraded.Students",
                          "Free Lunch Eligible" = "Free.Lunch.Eligible",
                          "Reduced price Lunch Eligible" = "Reduced.price.Lunch.Eligible",
                          "LEP ELL Students" = "LEP.ELL.Students",
                          "Individualized Education Programs" = "Individualized.Education.Program",
                          "Total Teachers" = "Total.Teachers",
                          "Total Staff" = "Total.Staff",
                          "Pupil-to-Teach Ratio" = "Pupil.to.Teacher"
                          ),
              selected = "Pupil.to.Teacher",
              multiple = F
  )
}


