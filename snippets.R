#
# author: Alexander C. Hungerford
# 
# created: 13 November 2018
#
# title: My R snippets
#
# description:
#
#   My most repeated code.
#   Every snippet must be tab-indented. No spaces for indentation.




# ggplot: basic scatterplot
  ggplot(${1:df}, aes(x = ${2:x-axis}, y = ${3:y-axis})) +
    geom_point()
  
# ggplot: bar chart
  ggplot(${1:df}, aes(x = ${2:x-axis}, y = ${3:y-axis})) +
    geom_bar()
  
# loading a .Rdata filetype
  load(${1:"filename.Rdata"})

# creating functions
  ${1:functionName} <- function(${2:argument}){
    ${3:body}
  }

