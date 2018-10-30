###############################################
################# Summary #####################
############################################### 
#
# author: Alexander C. Hungerford
# 
# date created: 30 October 2018
# 
# course: DataCamp
#         Data Visualization with ggplot2
#         Chapter 3: aesthetics
# 
############################################### 

# Note, plots will look different than the Datacamp course in color gradients.
# It's not clear why, probably because of the version of ggplot that was used.


library(tidyverse)

# load and view the data
data(mtcars)
View(mtcars)


# 1 - Map mpg to x and cyl to y
ggplot(mtcars, aes(x = mpg,y = cyl)) + geom_point()

# 2 - Reverse: Map cyl to x and mpg to y
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()

# 3 - Map wt to x, mpg to y and cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()

# 4 - Change shape and size of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# 'am' and 'cyl' are factors; 'wt' is numeric
# next, map cyl to fill, change shape, and alpha
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)


####################### NOTES #################################################
# The color aesthetic typically changes the outside outline of an object 
# and the fill aesthetic is typically the inside shading. However, 
# as you saw in the last exercise, geom_point() is an exception. 
# 
# Here you use color, instead of fill for the inside of the point. 
# But it's a bit subtler than that.
# 
# Which shape to use? 
# The default geom_point() uses shape = 19 (a solid circle with an outline the same 
# colour as the inside). 
# Good alternatives are shape = 1 (hollow) and shape = 16 (solid, no outline). 
# These all use the col aesthetic (don't forget to set alpha for solid points).
#
# A really nice alternative is shape = 21
# which allows you to use both fill for the inside and col for the outline!
# This is a great little trick for when you want to map two aesthetics to a dot.
#

















