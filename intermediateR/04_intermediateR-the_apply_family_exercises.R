#
# author: Alexander C. Hungerford
#
# created: 25 November 2018
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

# create a more generic function for selecting elements, similar to multiply()
# from previous script
select_el <- function(x, index){
  x[index]
}

# use select_el() inside lapply() to get elements 1, 2 from the list split_low
lapply(split_low, select_el, 1)
lapply(split_low, select_el, 2)


###### Exercise 4.5: Apply functions that return NULL #########################

# In all of the previous exercises, it was assumed that the functions
# that were applied over vectors and lists actually returned
# a meaningful result. For example, the tolower() function simply returns
# the strings with the characters in lowercase. This won't always be the case.
# Suppose you want to display the structure of every element of a list.
# You could use the str() function for this, which returns NULL:
# lapply(list(1, "a", TRUE), str)
# This call actually returns a list, the same size as the input list,
# containing all NULL values

# On the other hand, if you call: str(TRUE)
# it only prints the structure of the logical, not NULL.
# why? Bc str() uses invisible() behind the scenes, which returns an
# 'invisible copy' of the return value - NULL in this case.

# Notice what this prints:
lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})

# if the number of characters in the first element (name)
# of vector 'split_low' is bigger than 5, return a NULL,
# otherwise, return the 2nd element of that vector (year)
# gauss = 5 characters, return year
# bayes = 5 characters, return year
# pascal = 6 characters, return NULL
# pearson = 6 characters, return NULL
