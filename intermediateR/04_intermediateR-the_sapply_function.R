#
# author: Alexander C. Hungerford
#
# created: 25 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family - sapply()

# an R function can "return" any class of R object - list, numeric, etc.

# lapply() applies the same function over a list or vector
# it can return R objects of different classes
# needs a list to store heterogeneous returned output

# often however, you're returning the same homogenous class of output

# instead of doing unlist(lapply(data, function)) to get a list output
cities <- c("New York", "Paris", "London",
            "Tokyo", "Rio de Janeiro",
            "Cape Town")

unlist(lapply(cities, nchar))

# we can use 'simplify apply' aka sapply() because all the inputs
# are the same type and we get a special output -- a named vector
sapply(cities, nchar)

# under the hood, sapply calls lapply() to use nchar over the cities vector,
# then uses the 'simplify to array' function to conver the list that lapply()
# generated into an array

# in this case, sapply() converted the list to a 1D array - aka, a vector

# if you don't want the output of sapply() to be a named vector then set
# the USE.NAMES argument to FALSE

sapply(cities, nchar, USE.NAMES = FALSE)


# What happens if the function you want to apply over the vector returns
# two ore more values instead of just one value
# 'first_and_last' splits a string into it's letters and then returns
# the min and max letters according to alphabetical order
first_and_last <- function(name){
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  c(first = min(letters), last = max(letters))
}

first_and_last("New York")
# result - e, y, are first and last if letters arranged alphabetically

sapply(cities, first_and_last)
# output is now a matrix instead of a vector

# what happens when simplification of lapply is not possible?
# sometimes, the function you want to apply doesn't always return a
# vector of the same length at all times. Let's see how sapply() responds
# to that situation:
unique_letters <- function(name){
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  unique(letters)
}

unique_letters("London")

# first let's see how lapply() behaves on the cities variable
lapply(cities, unique_letters)
# notice the output vectors have different lenghts, so trying to
# simplify this list could lead to strange results. How does sapply()
# handle it? Same output as the lapply()
sapply(cities, unique_letters)
# so you might one day write a program where you expect the sapply
# output to be a vector when in fact it is still a list bc simplification
# didn't work out.