# 
# 
# 
# author: Alexander C. Hungerford
# 
# created: 20 November 2018
# 
# title: Datacamp
#        Chapter 3 - Functions: writing functions
# 
# 
# 
# 


# General form

# functionName <- function(arg1, arg2){
#   
# }


# Example
quadruple <- function(x){
  4 * x
}

quadruple(6)

# Example with an explicit return statement
fraction <- function(x, y){
  answer <- (x / y)
  return(answer)
}

fraction(20, 2)


# Example of a function that requires 2 arguments, but you're setting a default
# value for one of the arguments

# this would give you an error
fraction(20)

# but now we'll create a function where we use a default value
magical <- function(x, y = 2){
  x*y + x/y
}

# see, no error! because we set a default value for the second argument
magical(4)


# Avoiding pitfalls - like dividing by zero - put an if-statement in your function
surprise <- function(x, y = 1){
  if(y == 0){
    return(0)
  }
  x*y + x/y
}

surprise(4, 1)
surprise(4, 0)

sum_abs <- function(x, y){
  abs(x) + abs(y)
}

sum_abs(-2, 3)
