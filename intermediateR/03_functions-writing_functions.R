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






