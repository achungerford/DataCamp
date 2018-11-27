#
# author: Alexander C. Hungerford
#
# created: 26 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family - vapply()


# What vapply() does?
# applies the same function over a list or vector, but you MUST specify
# explicitly what type the return value will be

# example of sapply() and vapply() acting similarly

cities <- c("New York", "Paris", "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

# nchar function returns a single number -- a numeric vector of length 1
# so, following documentation for vapply, we need to set fun.value
# to numeric(1)
sapply(cities, nchar)

# the speficied output makes vapply() a bit safer to use than sapply()
vapply(cities, nchar, numeric(1))


first_and_last <- function(name){
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  c(first = min(letters), last = max(letters))
}

sapply(cities, first_and_last)

vapply(cities, first_and_last, character(2))
vapply(cities, first_and_last, character(2))

# but this will give you an error
vapply(cities, first_and_last, character(1))

# also get an error if you say output is numeric
vapply(cities, first_and_last, numeric(2))

# what's the benefit of explicitly stating the output from your function?
# it makes you really think about the output that you'll get

unique_letters <- function(name){
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  unique(letters)
}

# incorrectly assumes sapply() would simplify to a vector, but that's not the
# case bc 'unique_letters' function returns vectors of different sizes
sapply(cities, unique_letters)

# if we assumed that unique_letters always returned a vector of 4 character
# strings then we get an error with vapply()
vapply(cities, unique_letters, character(4))
