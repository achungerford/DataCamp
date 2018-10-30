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


####################### NOTES #################################################
#