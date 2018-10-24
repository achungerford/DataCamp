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









