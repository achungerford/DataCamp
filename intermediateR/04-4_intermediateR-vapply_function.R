#
# author: Alexander C. Hungerford
#
# created: 25 November 2018
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


