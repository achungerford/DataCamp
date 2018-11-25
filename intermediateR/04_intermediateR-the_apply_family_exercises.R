#
# author: Alexander C. Hungerford
#
# created: 24 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family - Exercises

library(tidyverse)
# strplit()


########### Exercise 4.1: Use lapply() with a built-in R function #############

# list of famous mathematicians and year they were born
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

#split names from birth year
split_math <- strsplit(pioneers, split = ':')

# convert to lowercase strings
split_low <- lapply(split_math, tolower)

# look at structure
str(split_low)


########## Exercise 4.2: Use lapply() with your own function ##################

# write a function, select_first()
select_first <- function(x){
  x[1]
}

# apply function above to split_low, assign to 'names'
names <- lapply(split_low, select_first)

# write a function, select_second()
select_second <- function(x){
  x[2]
}

# apply it to split_low, assign to 'years'
years <- lapply(split_low, select_second)


######## Exercise 4.3: lapply() and anonymous functions #######################

# defining functions to use them only once is overkill,
# that's why you can use so-called anonymous functions in R
# you don't name a function; this creates an "anonymous function"

# use anonymous functions inside lapply() that select elements 1 and 2
lapply(split_low, function(x){x[1]})
lapply(split_low, function(x){x[2]})

####### Exercise 4.4: use lapply() with additional arguments ##################










