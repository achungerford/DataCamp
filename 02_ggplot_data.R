# 
# 
# author: Alexander C. Hungerford
# 
# created: 13 October 2018
#
# course: Data Visualization with ggplot2 - Data
#
# Summary:
#  loading .RData files
#  stacking dataframes vertically: bind_rows(df1, df2)
#  plotting data with linear model trendlines
#  faceting in ggplot: creating plots side-by-side
#  geom_jitter() in ggplot
# 
#  gather() moves information from the columns to the rows
#
#  separate() 
#  splits one column into two or more according to a pattern you define
# 
#  Base R vs. dplyr
#     data.frame() # Base R
#     data_frame() # dplyr
#
# 
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
         col = x)})

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
  
# create the iris.tidy df using gather() and separate() from tidyr package
iris.tidy <- gather(iris, "Measure", "Value", -Species) %>%
  separate("Measure", c("Part", "Measure"), "\\.")

# Create two plots side-by-side, Length, Width. Color by part (petal or sepal).
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)

# create the iris.wide df using gather(), separate(), and spread()
# first, we must create a new unique row identifier (index) column.
iris$Flower <- 1:nrow(iris)

iris.wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value)


# another plot, use iris.wide
ggplot(iris.wide, aes(x = Length, y = Width, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Species)


############################## END ############################################

# ####################### My Improvised Way ###################################
# 
# # my long, improvised way of creating iris.wide and iris.tidy before
# # I knew about the gather() and separate() functions.
# 
# # create a petal df & sepal df
# # remove sepal columns, include Part column, rename and reorder
# iris.petal <- select(iris, -contains("Sepal")) %>%
#                   mutate(Part = "Petal") %>%
#                   rename(Length = Petal.Length, Width = Petal.Width) %>%
#                   select(Species, Part, Length, Width)
# 
# iris.sepal <- select(iris, -contains("Petal")) %>%
#                   mutate(Part = "Sepal") %>%
#                   rename(Length = Sepal.Length, Width = Sepal.Width) %>%
#                   select(Species, Part, Length, Width)
# 
# # create iris.wide df by stacking the sepal and petal dfs vertically
# iris.wide <- bind_rows(iris.sepal, iris.petal)
# View(iris.wide)
# 
# # begin creation of iris.tidy by stacking the iris.wide df
# iris.tidy <- bind_rows(iris.wide, iris.wide) %>%
#   select("Species", "Part")
# 
# # combine Length and Width columns into a Value vector for iris.tidy
# Value <- c(pull(iris.wide, "Length"), pull(iris.wide, "Width"))
# 
# # creating Measure vector for iris.tidy
# Measure <- c(rep("Length", 300), rep("Width", 300))
# 
# # make new variables in iris.tidy
# iris.tidy <- iris.tidy %>%
#   mutate(Measure = Measure, Value = Value)
# 
# # create two plots, Length & Width, 
# ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
#   geom_jitter() +
#   facet_grid(. ~ Measure)
# 
# 
############################ End Improvised ###################################


#################### creating iris.tidy Datacamp way ##########################
# 
# # gather() 
# # takes multiple columns and gathers them into a single column by adding rows
# # rearranges the data frame by specifying the columns that are
# # categorical variables with a "-" notation
# 
# iris.tidy.dc <-
#   gather(iris, "Measure", "Value", -Species) %>%
#   separate("Measure", c("Part", "Measure"), "\\.")
# 
###############################################################################