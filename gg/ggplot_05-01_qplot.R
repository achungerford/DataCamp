# 
# author: Alexander C. Hungerford 
# 
# created: 28 November 2018
# 
# title: Datacamp
#        Data visualization with ggplot2 (Part 1)
#        Ch. 5 - qplot


library(tidyverse)
data("mtcars")
load("gg_recess.RData")
load("gg_fish.RData")
load("gg_iris.RData")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

# qplot()
# it does quick and dirty versions of ggplot
qplot(Sepal.Length, Sepal.Width, data = iris, color = Species)

# "I" in qplot() stands for "inhibits" -- it prevents R from
# alterting the data type
qplot(Sepal.Length, Sepal.Width, data = iris, color = Species,
      geom = "jitter", alpha = I(0.5))

# straight line - means you're plotting a continuous variable
# against a discrete variable, can adjust with jitter
qplot(Species, Value, data = iris.tidy, col = Part)

qplot(Species, Value, data = iris.tidy, col = Part,
      geom = "jitter")


###############################################################################

# Exercise: Using qplot

# The old way (shown)
plot(mpg ~ wt, data = mtcars) # formula notation
with(mtcars, plot(wt, mpg)) # x, y notation

# Using ggplot:
ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

# Using qplot:
qplot(wt, mpg, data = mtcars)


###############################################################################

# Exercise: Using aesthetics

# basic qplot scatter plot:
qplot(wt, mpg, data = mtcars)

# Categorical variable mapped onto size:
# cyl
qplot(wt, mpg, data = mtcars, size = factor(cyl))

# gear
qplot(wt, mpg, data = mtcars, size = factor(cyl))


# Continuous variable mapped onto col:
# hp
qplot(wt, mpg, data = mtcars, col = hp)

# qsec
qplot(wt, mpg, data = mtcars, col = qsec)


###############################################################################

# Choosing geoms, part 1

# qplot() with x only
qplot(factor(cyl), data = mtcars)

# qplot() with x and y
qplot(factor(cyl), factor(vs), data = mtcars)

# qplot() with geom set to jitter manually
qplot(factor(cyl), factor(vs), data = mtcars, geom = "jitter")


###############################################################################

# Choosing geoms, part 2 - dotplot

# Some naming conventions:
#   
# Scatter plots:
# Continuous x, continuous y.
# Dot plots:
# Categorical x, continuous y.

# cyl and am are factors, wt is numeric
class(mtcars$cyl)
class(mtcars$am)
class(mtcars$wt)

# A "basic" dot plot is shown in the viewer (see the code is below). 
# Here, cyl (categorical) is mapped onto the x and
# wt (continuous) is mapped onto the y aesthetic.
# For this exercise we've already converted am to a factor variable for you.


# "Basic" dot plot, with geom_point():
ggplot(mtcars, aes(cyl, wt, col = factor(am))) +
  geom_point(position = position_jitter(0.2, 0))

# 1 - "True" dot plot, with geom_dotplot():
ggplot(mtcars, aes(cyl, wt, fill = factor(am))) +
  geom_dotplot(
    binaxis = "y",
    stackdir = "center")

# 2 - qplot with geom "dotplot", binaxis = "y" and stackdir = "center"
qplot(cyl, wt, data = mtcars,
      fill = factor(am), geom = "dotplot",
      binaxis = "y", stackdir = "center")

###############################################################################

# Exercise: Chicken weight

# ChickWeight is available in your workspace
# 1 - Check out the head of ChickWeight
head(ChickWeight)

# 2 - Basic line plot
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_line(aes(group = Chick))

# 3 - Take plot 2, map Diet onto col.
ggplot(ChickWeight, aes(x = Time, y = weight, color = Diet)) +
  geom_line(aes(group = Chick))



# 4 - Take plot 3, add geom_smooth()
ggplot(ChickWeight, aes(x = Time, y = weight, color = Diet)) +
  geom_line(aes(group = Chick), alpha = 0.3) + geom_smooth(lwd = 2, se = FALSE)

?geom_smooth


###############################################################################

# Exercise: Titanic

str(titanic)
