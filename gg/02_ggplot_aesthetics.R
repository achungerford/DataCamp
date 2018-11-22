#
#
# author: Alexander C. Hungerford
# 
# date created: 30 October 2018
# 
# course: DataCamp
#         Data Visualization with ggplot2
#         Chapter 3: aesthetics
# 
############################################################################### 

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

# 3 - Map am to col in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = am)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)




# Exercise: All About Aesthetics, Part 2

# for this exercise, we converted some variables.
# am and cyl are factors, wt is numeric
mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)

class(mtcars$am)
class(mtcars$cyl)
class(mtcars$wt)

# 1 - Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)

# 2 - Change shape and alpha of the points in the above plot (alpha = opacity)
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21,
             size = 4,
             alpha = 0.6)

# 3 - Map am to col in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl, col = am)) +
  geom_point(shape = 21,
             size = 4,
             alpha = 0.6)



######################## DC examples ##########################
# Map cyl to size
ggplot(mtcars, aes(x = wt, y = mpg, size = cyl)) + geom_point()

# Map cyl to alpha
ggplot(mtcars, aes(x = wt, y = mpg, alpha = cyl)) + geom_point()

# Map cyl to shape 
ggplot(mtcars, aes(x = wt, y = mpg, shape = cyl)) + geom_point()

# Map cyl to labels
ggplot(mtcars, aes(x = wt, y = mpg, label = cyl)) + geom_text()



###############################################################################

# Exercise: All About Attributes, Part 1
# Define a hexadecimal color
my_color <- "#4ABEFF"

# Draw a scatter plot with color *aesthetic*
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()

# Same, but set color *attribute* in geom layer 
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(col = my_color)

# Set the fill aesthetic; color, size and shape attributes
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   fill = cyl)) +
  geom_point(col = my_color,
             size = 10,
             shape = 23)

# Exercise: All About Attributes, Part 2
# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(alpha = 0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + 
  geom_point(shape = 24, 
             color = 'yellow')

# Expand to draw text with label rownames(mtcars) and color red
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_text(label = rownames(mtcars),
            color = 'red')

###############################################################################

# Exercise: Going All Out

# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl))) +
  geom_point()


# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x = mpg,
                   y = qsec, 
                   col = factor(cyl),
                   shape = factor(am))) + 
  geom_point()


# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x = mpg,
                   y = qsec,
                   col = factor(cyl),
                   shape = factor(am),
                   size = (hp/wt))) +
  geom_point()

###############################################################################

# Exercise: Overplotting 1

# Basic scatter plot:
#   make cyl as.factor()
#   x(wt), y (mgg), col (cyl)
#   size = 4
ggplot(mtcars, aes(x = wt, y = mpg, col = as.factor(cyl))) +
  geom_point(size = 4)


# Hollow circles - shape 1
ggplot(mtcars, aes(x = wt, y = mpg, col = as.factor(cyl))) +
  geom_point(size = 4, shape = 1)


# Add transparency - alpha 0.6
ggplot(mtcars, aes(x = wt, y = mpg, col = as.factor(cyl))) +
  geom_point(size = 4, alpha = 0.6)


###############################################################################

# Exercise: Overplotting 2
load("gg_diamonds.RData")

# scatterplot: x (carat), y (price), color (clarity)
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_point()

# adjusted for overplotting
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_point(alpha = 0.5)



# scatterplot: x (clarity), y (carat), color (price)
# adjusted for overplotting
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5)

# scatterplot: x (clarity), y (carat), color (price)
# adjusted for overplotting
# with jittering
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5, position = 'jitter')



####################### NOTES #################################################
#
# The color aesthetic typically changes the outside outline of an object 
# and the fill aesthetic is typically the inside shading. However, 
# as you saw in the last exercise, geom_point() is an exception. 
# 
# Here you use color, instead of fill for the inside of the point. 
# But it's a bit subtler than that.
# 
# Which shape to use? 
#   The default geom_point() uses shape = 19 (a solid circle with an outline the same
#   colour as the inside).
#   Good alternatives are shape = 1 (hollow) and shape = 16 (solid, no outline).
#   These all use the col aesthetic (don't forget to set alpha for solid points).

# A really nice alternative is shape = 21
#   which allows you to use both fill for the inside and col for the outline!
#   This is a great little trick for when you want to map two aesthetics to a dot.
#


# Overplotting issues with scatterplots
#   1. Large datasets 
#   2. Imprecise data (rounding) so points aren't clearly defined
#   3. Interval data
#   4. Aligned data values on a single axis
#
#   good idea to add transparency when you have solid shapes or
#   use hollow shapes










