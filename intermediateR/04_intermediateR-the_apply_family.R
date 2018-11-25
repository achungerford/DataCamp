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

# less code
lapply(nyc, class)
