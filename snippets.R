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
#
#


# ggplot: basic scatterplot
snippet my_scatterplot
  ggplot($df, aes(x = $xvar, y = $yvar , col = )) +
    geom_point()
