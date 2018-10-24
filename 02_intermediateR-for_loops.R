# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 


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


