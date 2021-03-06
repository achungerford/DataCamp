# 
# author: Alexaner C. Hungerford
# 
# Intermediate R: for loops
# 
# Date: 24 October 2018
# 
# 
# for loop
# for loop over a list
# for loop over a list using index information
# 
# for loop with nested if-statement
# for loop, nested if, with break
# for loop, nested if, with a next-statement
# 
# create simple matrix
# fill-in specific matrix cells
#
# for loop nested in another for loop
# 
# split a string with strsplit() into intdividual characters
# count specific letters in a string with for loop




# for(var in seq){
#   expr
# }

cities <- c("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janiero", "Cape Town")

for(city in cities){
  print(city)
}


# for loop over a list


cities <- list("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janiero", "Cape Town")

for(city in cities){
  print(city)
}




# break statement in a for loop example

cities <- list("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janiero", "Cape Town")

# leaving the loop as soon as we encounter a city with 6 characters
for(city in cities){
  if( nchar(city) == 6){
    break
  }
  print(city)
}



# next statement in a for loop
cities <- list("New York", "Paris",
               "London", "Tokyo",
               "Rio de Janiero", "Cape Town")

# a next statement skips remainder of the code to next iteration.
# London is not printed
for(city in cities){
  if( nchar(city) == 6){
    next
  }
  print(city)
}





# another way to loop over data: for loop v2.0
# imagine that instead of just printing out the city name, we also want
# to give information about the city's position in the vector


cities <- c("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janiero", "Cape Town")

# now we let i progress from 1 to the length of the vector, 6, by steps of 1
# this way it's asier to add more information to the loop
for(i in 1:length(cities)){
  print(cities[i])
}

# more info
for(i in 1:length(cities)){
  print(paste(cities[i], "is on position ", i, " in the cities vector."))
}



# again looping over a list
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

for(i in nyc){
  print(i)
}

# same as above, but notice the need for the double brackets
for(i in 1:length(nyc)){
  print(nyc[[i]])
}



# create a blank tic-tac-toe matrix
ttt <- matrix( , 3, 3)
ttt

# fill in specific values
ttt[1, 1] = "O"
ttt[1, 3] = "X"
ttt[2, 2] = "O"
ttt[2, 3] = "O"
ttt[3, 1] = "X"
ttt[3, 3] = "X"

# show matrix filled in
ttt

# tell us what is in each matrix cell
for(i in 1:nrow(ttt)){
  for(j in 1:ncol(ttt)){
    print(paste("On row ", i, " and column ", j ," the board contains ", ttt[i,j]))
  }
}


# for loop, nested if-else
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for(li in linkedin){
  if(li > 10){
    print("You're popular!")
  } else{
    print("Be more visible!")
  }
  print(li)
}


# Adapt/extend the for loop
for (li in linkedin){
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if(li > 16){
    print("This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if(li < 5){
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}




######################## new for loop from scratch ############################
#
# instructions:
# We defined a variable rquote.
# This variable has been split up into a vector that contains separate letters.
# It has been stored in a vector chars with the strsplit() function.
#
# Can you write code that counts the number of r's that come before the first u in rquote?


# Guidance:
#
# initialize the variable rcount, as 0.
#
# Finish the for loop:
#   if char equals "r", increase the value of rcount by 1.
#   if char equals "u", leave the for loop entirely with a break.
#
# Finally, print out the variable rcount to the console to see if your code is correct.

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for(char in chars){
  if(char == "r"){
    rcount <- rcount + 1
  }
  if(char == "u"){
    break
  }
}

# Print out rcount
rcount
