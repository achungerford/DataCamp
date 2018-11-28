# 
# author: Alexander C. Hungerford 
# 
# created: 28 November 2018
# 
# title: Datacamp
#        Data visualization with ggplot2 (Part 1)
#        Ch. 4 - geometries
#        section 2: bar plots


library(tidyverse)
data("iris", "mtcars")

# histograms - bin distribution of a continuous variable
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram()

# note, you will always get a message with geom_histogram
diff(range(iris$Sepal.Width)) / 30

# let's change binwidth
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.1)

# y-axis shows us the absolute count of each bin (frequency aka density)
# i.e. what proportion of the total is represented in each bin

# to gain access to the density under the hood of a historgram, we'll assign
# a y-aesthetic
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.1)
# notice the shape of the histogram hasn't changed, but the y-axis has been relabled

# the "..density.." tells ggplot that the column containing the density values
# is not to be found in my original dataframe,
# but rather in the internal dataframe


# we can color our bars according to Species, but we need to use the "fill"
# aesthetic, instead of color, bc we're dealing with shapes, color would
# only outline the bars
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.1)

# what's not clear about the above plot is whether or not the bars are
# stacked or overlapping -- the default is stacked
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.1, position = "stack")

# dodge bars - offset each dataset in a category
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.1, position = "dodge")


# position = "fill"
ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.1, position = "fill")

# normalizes each bin to represent the proportion of all observations in each
# bin, taken by each category. Y-axis label didn't change, but it should say
# "proportion", not count.


# bar plots - two common types: absolute counts, distributions

# example, absolute
ggplot(df, aes(x = x-axis, y = y-axis)) +
  geom_bar(stat = "bin")

# example, distribution
# when you have descriptive statistics already calculated?

# look up
# geom_errorbar(aes(ymin = avg - stdev, ymax = avg + stdev),
#   width = 0.2)


##################################33###########################################

# Exercise: Histograms
# 1 - Make a univariate histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

# 2 - Plot 1, plus set binwidth to 1 in the geom layer
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 1)



# 3 - Plot 2, plus MAP ..density.. to the y aesthetic (i.e. in a second aes() function)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), binwidth = 1)



# 4 - plot 3, plus SET the fill attribute to "#377EB8"
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = "#377EB8")


###############################################################################

# Exercise: Position

# Draw a bar plot of cyl, filled according to am
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar() +
  scale_fill_discrete(name = "am")


# Change the position argument to stack
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "stack") +
  scale_fill_discrete(name = "am")


# Change the position argument to fill
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "fill") +
  scale_fill_discrete(name = "am")


# Change the position argument to dodge
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "dodge") +
  scale_fill_discrete(name = "am")


###############################################################################

# Exercise: Overlapping bar plots

# 1 - The last plot form the previous exercise
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "dodge") +
  scale_fill_discrete(name = "am")


# 2 - Define posn_d with position_dodge()
posn_d <- position_dodge(width = 0.2)


# 3 - Change the position argument to posn_d
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = posn_d) +
  scale_fill_discrete(name = "am")


# 4 - Use posn_d as position and adjust alpha to 0.6
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = posn_d, alpha = 0.6) +
  scale_fill_discrete(name = "am")


###############################################################################

# Exercise: Overlapping histograms

# A basic histogram, add coloring defined by cyl
ggplot(mtcars, aes(mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 1) +
  scale_fill_discrete(name = "cyl")


# Change position to identity
ggplot(mtcars, aes(mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 1, position = "identity") +
  scale_fill_discrete(name = "cyl")


# Change geom to freqpoly (position is identity by default)
ggplot(mtcars, aes(mpg, color = factor(cyl))) +
  geom_histogram(binwidth = 1) +
  geom_freqpoly(binwidth = 1)


###############################################################################

# Exercise: Bar plots with color ramp, part 1

# Example of how to use a brewed color palette
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")


# if you want to see a full list of palettes
?brewer.pal


# Plot education on x and vocabulary on fill
# Use the default brewed color palette
ggplot(df, aes(x = something, fill = factor(something))) +
  geom_bar(position = "fill") +
  scale_fill_brewer(palette = "Set1")

# sometimes your plot will look incomplete bc for continuous data, the default
# palette from scale_fill_brewer() may not have enough colors for
# the number of categories you have, but you can manually create your
# own palette

###############################################################################

# Exercise: Bar plots with color ramp, part 2

# Final plot of last exercise
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_brewer()

# create your own palette
# In this exercise, you'll manually create a color palette that can generate
# all the colours you need. To do this you'll use a function called
# colorRampPalette().
#     The input is a character vector of 2 or more colour values,
#     e.g. "#FFFFFF" (white) and "#0000FF" (pure blue)
#
#     The output is itself a function! So when you assign it to an object,
#     that object should be used as a function.

new_col <- colorRampPalette(c("#FFFFFF", "#0000FF"))
new_col(4) # the newly extrapolated colours
munsell::plot_hex(new_col(4)) # Quick and dirty plot

# newcol() takes one argument: the number of colours you want to extrapolate.

# Definition of a set of blue colors
# We've assigned the entire "Blues" colour palette from the RColorBrewer
# package to the character vector blues:
blues <- brewer.pal(9, "Blues") # from the RColorBrewer package

# 1 - Make a color range using colorRampPalette() and the set of blues
blue_range <- colorRampPalette(blues)

# 2 - Use blue_range to adjust the color of the bars, use scale_fill_manual()
# ggplot(Vocab, aes(x = education, fill = vocabulary)) +
#   geom_bar(position = "fill") +
#   scale_fill_manual(values = blue_range(11))


###############################################################################

# Exercise: Overlapping histograms (2)

# 1 - Basic histogram plot command
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 1)


# 2 - Plot 1, Expand aesthetics: am onto fill
ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 1)


# 3 - Plot 2, change position = "dodge"
ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 1, position = "dodge")


# 4 - Plot 3, change position = "fill"
ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 1, position = "fill")


# 5 - Plot 4, plus change position = "identity" and alpha = 0.4
ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 1, position = "identity", alpha = 0.4)


# 6 - Plot 5, plus change mapping: cyl onto fill
ggplot(mtcars, aes(mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 1, position = "identity", alpha = 0.4)