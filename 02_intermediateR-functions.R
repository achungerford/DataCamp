# 
# author: Alexander C. Hungerford
# 
# date: 26 October 2017
#
# course:
#   Datacamp: Intermediate R
#             Chapter 3: Functions
#
# summary: 
# 


library(tidyverse)


# args(sd)
# will show you the arguments needed in the standard deviation function sd()


# The ... is called the ellipsis. 
# It is a way for R to pass arguments along without the function having to name them explicitly.
# The ellipsis will be treated in more detail in future courses.


# For the remainder of this exercise, just work with the second usage of the mean function.
# Notice that both trim and na.rm have default values.
# This makes them optional arguments.


# create linkedin and facebook vectors
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
linkedin + facebook
avg_sum <- mean(linkedin + facebook)
avg_sum

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, 0.2)
avg_sum_trimmed

# Inspect both new variables, notice the effect of trimming
avg_sum
avg_sum_trimmed


# update the vectors with NA values
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# basic average of linkedin before using other arguments
mean(linkedin)

# advanced version
mean(linkedin, na.rm = TRUE)

# mean asbsolute deviation: functions in functions, arguments by name
mean(abs(linkedin - facebook) , na.rm = TRUE)


# mean(x, trim = 0, na.rm = FALSE, ...)
# x is required; if you do not specify it, R will throw an error.
# trim and na.rm are optional arguments: they have a default value
# which is used if the arguments are not explicitly specified.
