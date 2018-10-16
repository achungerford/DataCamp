# 
# 
# author: Alexander C. Hungerford
# 
# created: 13 October 2018
#
# course: Data Visualization with ggplot2 - Data
###############################################################################

# load libraries & packages
library(tidyverse)

# import pre-loaded datasets
data("mtcars")
data("iris")

# how to import datasets that are .RData files
load("gg_diamonds.RData")
# load("gg_fish.RData")
# load("gg_recess.RData")


# There is an advantage to plotting out a graph with just the df and aes(), bc
# you can always add the other layers later


################################## Base R #####################################

# x-axis: wt, y-axis: mpg, color by cylinders
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# change cylinder to factor (discrete)
mtcars$fcyl <- as.factor(mtcars$cyl)

# same plot with color as.factor(cylinder)
plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)


# lm() is linear model; abline() is trendline
carModel <- lm(wt ~ mpg, data = mtcars)

# basic
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)


# but let's say you want a trendline for each subgroup. You have a few options.
# you can subset your data then calculate lm() and plot each subset separately.
# or you can vectorize over the 'cyl' variable using lapply() -- one step.

# lapply () takes as input: a vector and a function,
# then it applies the function you gave it to each element of the vector

# plotting each subset with lapply for efficiency
# but notice the legend must be set mannually

# call abline() with carModel as first argument and line-type (lty) to 2
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
abline(carModel, lty = 2)

lapply(mtcars$cyl, function(x){
  abline(lm(mpg ~ wt,
            mtcars,
            subset = (cyl == x)),
         col = x)
})

legend(x = 5,
       y = 33,
       legend = levels(mtcars$cyl),
       col = 1:3,
       pch = 1,
       bty = "n")




#################### the ggplot way ###########################################

# plot 1: scatterplot -- geom_point
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()


# plot 2: same but add a linear model trendlines, turn off shading error
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)
# the linear models are grouped by cyl, ggplot knows this bc of color mapping


# plot 3: linear model for entire dataset with another layer of geom_smooth()
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  geom_smooth(aes(group = 1), method = lm, se = FALSE, lty = 2)
# to get a single trendline for the entire dataset we need aes(group = 1)
# dotted line, linetype = 2



############################### iris dataset ##################################

str(iris)
View(iris)

# create a petal df & sepal df
# remove sepal columns, include Part column, rename and reorder
iris.petal <- select(iris, -contains("Sepal")) %>%
                  mutate(Part = "Petal") %>%
                  rename(Length = Petal.Length, Width = Petal.Width) %>%
                  select(Species, Part, Length, Width)

iris.sepal <- select(iris, -contains("Petal")) %>%
                  mutate(Part = "Sepal") %>%
                  rename(Length = Sepal.Length, Width = Sepal.Width) %>%
                  select(Species, Part, Length, Width)

# stack the petal and sepal dataframes vertically
iris.wide <- bind_rows(iris.petal, iris.sepal)
View(iris.wide)

# doesn't tell us anything
ggplot(iris.wide, aes(x = Species , y = Length, color = Part)) +
  geom_point()

# more useful, but not great
ggplot(iris.wide, aes(x = Length, y = Width, color = Part)) +
  geom_point()

ggplot(iris.wide, aes(x = Width, y = Length, color = Part)) +
  geom_point()

