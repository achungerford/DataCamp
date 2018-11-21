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


# functions with no arguments; print "Hi there!" and return TRUE.
greet <- function(){
  print("Hi there!")
  return(TRUE)
}

greet()


pow_two <- function(x, print_info = TRUE){
  y <- x ^ 2
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

# notice the different outputs
pow_two()
pow_two(5)
pow_two(5, TRUE)
pow_two(5, FALSE)

# scope of a function
# variables defined inside a function are not accessible outside the function
# x and y are not available to us
pow_two(4)
y
x

# example 2
two_dice <- function() {
  possibilities <- 1:6
  dice1 <- sample(possibilities, size = 1)
  dice2 <- sample(possibilities, size = 1)
  dice1 + dice2
}
two_dice()
dice1


# R passes arguments to functions by value
# What does this mean? Simply put, it means that an R function
# cannot change the variable that you input to that function. 
quarter <- function(x) {
  x <- 0.25 * x
  x
}
a <- 8
quarter(a)
a

# notice that the value of a is not altered by what happens after sending
# 'a' through the quarter function, that is bc we "passed 'a' by value"

# had we "passed 'a' by reference" then the override of x inside the
# function would ripple through 'a' outside the function.
# But, R does not pass by reference, it passes by value.

# notice the changes in values of a, b, and count as you call the function
increment <- function(x, inc = 1) {
  x <- x + inc
  x
}
count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count, 2)


# Exercise: R you functional
# writing a function that can interpret a single value of the vector
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

interpret <- function(num_views){
  if(num_views > 15){
    print("You're popular!")
    return(num_views)
  } else{
    print("Try to be more visible!")
    return(0)
  }
}

interpret(linkedin[1])
interpret(facebook[2])
# what is "annoying" about the function 'interpret'? It only takes one argument

# now, let's write a function that interprets the entire vector
# using interpret() inside interpret_all(
interpret_all <- function(views, return_sum = TRUE){
  count <- 0
  
  for(v in views){
    count <- count + interpret(v)
  }
  if(return_sum == TRUE){
    return(count)
  }else{
    return(NULL)
  }
}
# it appears that the sum of views on popular days
# are the same for Facebook and LinkedIn, what a coincidence!
interpret_all(linkedin)
interpret_all(facebook)
