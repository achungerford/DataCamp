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



