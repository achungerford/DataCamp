#
# author: Alexander C. Hungerford
#
# created: 26 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family - useful functions

library(tidyverse)

# functions for data structures
li <- list(log = TRUE,
           ch = "hello",
           int_vec = sort(rep(seq(8, 2, by = -2), times = 2)))
li

cities <- c("New York", "Paris", "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

# seq()
# generates a sequence of numbers: first and second args are where to
# start and stop sequence respectively.
# "by" argument specifies the increment value for the sequence on each step
seq(1, 10, by = 3)
seq(8, 2, by = -2)

# rep()
# replicates the inputs
rep(c(3, 9, 14), times = 3)
rep(6, times = 4)
rep(2, times = 7)

# instead of repeating the entire vector, each element gets repeated
rep(c(3, 9, 14), each = 2)
rep(c(8, 4, 3), each = 5)

# sort()
sort(c(8, 4, 3, 8, 5, 2))

#sort() decreasing
sort(c(8, 4, 3, 8, 5, 2), decreasing = TRUE)

#structure
str(li)

# is.*() and as.*()
is.list(li)
is.list(cities)
is.list(c(3, 5, 9))

li2 <- as.list(c(3, 5, 9))
is.list(li2)

# when unlisting something, you're changing it to a single vector
unlist(li)
# vectors must have all the same character types; so notice how
# all the outputs are converted to strings in this case


# append()
# let's you add elements to vector or list in a readable way
append(cities, "Los Angeles")

# rev()
# reverses elements in a data structure
rev(cities)


################ Exercise: Mathematical Utilities #############################
# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))


#################### Exercise: Find the error #################################

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

# Fix the error in this -- mean(abs(vec1), abs(vec2))
mean(c(abs(vec1), abs(vec2)))
# the documentation of mean() shows only the first argument, x,
# should be a vector. If you also specify a second argument,
# R will match the arguments by position and expect a specification
# of the trim argument. Therefore, merging the two vectors is a must!


