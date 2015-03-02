require(shiny)
require(rMaps)
require(rCharts)
require(dplyr)

varlist = function(x) {
  x = str_c('^(',paste(x, collapse='|'),')$')
  str_replace_all(x,'\\.','\\\\.')
}
