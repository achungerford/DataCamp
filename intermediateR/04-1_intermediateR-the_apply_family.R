#
# author: Alexander C. Hungerford
#
# created: 24 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family

library(tidyverse)

# when you get vectors or lists - for loops, or lapply

nyc <- list(pop = 8405837,
            borgouhs = c("Manhattan", "Bronx", "Brooklyn",
                         "Queens", "Staten Island"),
            capital = FALSE)

# say you want the class of each element in the list - for loop or lapply
for(info in nyc){
  print(class(info))
}

# less code - calling class() over each of the list elements
lapply(nyc, class)

# example 2: city names
cities <- c("New York", "Paris", "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

# suppose we want to build a vector of the same lenght as 'cities' above
# option 1
num_chars <- c()
for(i in 1:length(cities)){
  num_chars[i] <- nchar(cities[i])
}
num_chars

# option 2 - less code
# notice the output is a list, although the input was a vector
# the output of lapply() always returns a list irrespective of the data structure
lapply(cities, nchar)

# if you want to convert the list to a vector, just wrap it in an unlist()
unlist(lapply(cities, nchar))

# you can use lapply() with functions you wrote yourself - create function
oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)
triple <- function(x){
  3 * x
}
# get result
result <- lapply(oil_prices, triple)
str(result)
# make output a vector instead of list
unlist(result)

# try to make 'triple' more geneirc, call it multiply, and have it use 2 arguments
multiply <- function(x, factor){
  x * factor
}
# now we can choose which factor we want to multiply by

# what if you want to use multiple inside lapply()?
# specify other arguments after
times3 <- lapply(oil_prices, multiply, factor = 3)
unlist(times3)

times4 <- lapply(oil_prices, multiply, factor = 4)
unlist(times4)
