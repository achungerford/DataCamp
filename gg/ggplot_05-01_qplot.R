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
