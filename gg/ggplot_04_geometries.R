#
#
# author: Alexander C. Hungerford
# 
# date created: 30 October 2018
# 
# course: DataCamp
#         Data Visualization with ggplot2
#         Chapter 4: Geometries
# 
###############################################################################

data("mtcars")

# Exercise: Scatterplots and Jittering (1)

# a continuous var (wt) is mapped to y; a categorical var (cyl) is mapped to x
# this does NOT produce a scatterplot
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_point()

# 1. with jittering - geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter()

# 2. with jittering - setting width in geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter(width = 0.1)

# 3. with jittering - as a position function
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_point(position = position_jitter(0.1))

# with jittering, we get a scatterplot, but the width of the jitter is too wide
# so we'll reduce it
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter(width = 0.1)


# takeaways from this exercise?
#   1. jitter can be an argument in geom_point(position = 'jitter')
#   2. jitter can be a geom itself; geom_jitter()
#   3. jitter can be a position function; position_jitter(0.1)


###############################################################################

# Exercise: Scatterplots and jittering (2)

# using the Vocab dataset
# The Vocab dataset contains information about the years of education
# and integer score on a vocabulary test for over 21,000 individuals
# based on US General Social Surveys from 1972-2004.


###################### NOTES #################################################
#
# In the video you saw a dataset that suffered from overplotting
# because of the precision of the dataset.
# 
# Another example you saw is when you have integer data.
# This can be continuous data measured on an integer (i.e. 1 ,2, 3 ...),
# as opposed to numeric (i.e. 1.1, 1.4, 1.5, ...),
# scale, or two categorical (e.g. factor) variables,
# which are just type integer under-the-hood.
#
# In such a case you'll have a small,
# defined number of intersections between the two variables.