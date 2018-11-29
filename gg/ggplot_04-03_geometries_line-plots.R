# 
# author: Alexander C. Hungerford 
# 
# created: 28 November 2018
# 
# title: Datacamp
#        Data visualization with ggplot2 (Part 1)
#        Ch. 4 - geometries
#        section 3: line plots


library(tidyverse)
data("mtcars")
load("gg_recess.RData")
load("gg_fish.RData")
load("gg_iris.RData")


###############################################################################

# Exercise: Line plots
# Print out head of economics
head(economics)

# Plot unemploy as a function of date using a line plot
ggplot(economics, aes(x = date, y = unemploy)) + geom_line()


# Adjust plot to represent the fraction of total population that is unemployed
ggplot(economics, aes(x = date, y = unemploy/pop)) + geom_line()


###############################################################################

# Exercise: Periods of recession.

# Basic line plot
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()

# Expand the following command with geom_rect() to draw the recess periods
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_rect(data = recess,
            aes(xmin = begin, xmax = end, ymin = -Inf, ymax = +Inf),
            inherit.aes = FALSE, fill = "red", alpha = 0.2) +
  geom_line()
# The geom_rect() command shouldn't inherit aesthetics from the base ggplot()
# command it belongs to. It would result in an error, since you're using
# a different dataset and it doesn't contain unemploy or pop. That's why you
# should specify inherit.aes = FALSE in geom_rect().


###############################################################################

# Exercise: Multiple time series, part 1

# Check the structure as a starting point
str(fish.species)
#    Each variable (column) is a Salmon Species
#    each observation (row) is one Year


# To get a multiple time series plot, however, both Year and Species
# should be in their own column. You need tidy data: one variable per column.
# Once you have that you can get the plot shown in the viewer by mapping Year
# to the x aesthetic and Species to the color aesthetic.

# gather() takes four arguments: the original data frame (fish.species),
# the name of the key column (Species), the name of the value column (Capture)
# and the name of the grouping variable, with a minus in front (-Year).
# They can all be specified as object names (i.e. no "").

# Use gather to go from fish.species to fish.tidy
fish.tidy <- gather(fish.species, Species, Capture, -Year)

str(fish.tidy)
ggplot(fish.tidy, aes(x = Year, y = Capture, color = Species)) + geom_line()
