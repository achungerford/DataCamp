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


# ggplot: basic scatterplot
ggplot($dataframe, aes(x = $xvar, y = $yvar, col = $colorvar)) +
  geom_point()
