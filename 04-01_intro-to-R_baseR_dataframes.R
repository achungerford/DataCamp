# 
# author: Alexander C. Hungerford
# created: 17 September 2018
# 
# Summary: Data frames - BaseR
#   create a df
#   select elements in a df
#   select entire row of df
#   select column of df
#   subsetting
#   sorting data
#   
#
# functions:
#   head(), str(), data.frame(), $ selector
#   
#   subset(), order()



# columns = variables, rows = observations
mtcars
head(mtcars)

# look at the structure of mtcars
str(mtcars)



##################### Create a data frame ####################################

name <- c("Mercury", "Venus", "Earth", "Mars",
          "Jupiter", "Saturn", "Uranus", "Neptune")

type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant",
          "Gas giant")

diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

planets_df <- data.frame(name, type, diameter, rotation, rings)
planets_df

# check the structure of the data frame
str(planets_df)

# print out the diameter of Mercury (row 1, col 3)
planets_df[1, 3]

# Print out data for Mars (entire fourth row)
planets_df[4, ]

# select the first 3 elements of the 'type' column
head(planets_df)
planets_df[1:3, 2]

# select the first 5 elements of the diameter column
planets_df[1:5, 3]

# select entire rings column (many ways to do this)
planets_df[, 'rings']
planets_df[, 5]
planets_df$rings

rings_vector <- planets_df$rings

# select the 'name' column for all the planets that have rings
rings_vector
planets_df[rings_vector, "name"]

# downside is that we don't see the rest of the data, 
# just a list of the names. Adapt the code to see the rest of the data.
# recall, we know there are 5 varialbes.

planets_df[rings_vector, 1:5]

subset(planets_df, subset = rings)



# select planets with a diameter < 1; use subset()
subset(planets_df, subset = diameter < 1)



################## order() function ##########################################
#
# order()
#   gives you the ranked position of each element when it is applied on a variable

# Example
a <- c(100, 10, 1000)

order(a)
# output: [1] 2 1 3

### 10 is the 2nd element. It is the smallest. So it is ordered first.
## 100 is the 1st element. It is the middle. It is ordered second.
# 1000 is the 3rd element. It is the largest. It is ordered third (last).


# Example
k <- c(50, 30, 80, 10, 75)
order(k)
# output: [1] 4 2 1 5 3

#### Smallest: 10 is the 4th element. 4
####           30 is the 2nd element. 2
####           50 is the 1st element. 1
####           75 is the 5th element. 5
#### Largest:  80 is the 3rd element. 3


###################
# call order() on planets_df$diameter. Store results as positions.
positions <- order(planets_df$diameter)

# view it. Notice diameter column is not yet sorted.
planets_df

# sort planets by diameter (ascending). Notice diameter column.
# Also notice the index.
planets_df[positions, ]