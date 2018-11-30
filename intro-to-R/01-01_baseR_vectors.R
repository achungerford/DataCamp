'''
Author: Alexander C. Hungerford
Title: Intro to R - Data Camp
Created: 13 September 2018

Summary:
  variable assignment, vectors
  
  creating vectors, naming vectors and elements
  arithmetic with vectors 
  slicing vectors - numerically, by name, by comparison

  functions: class(), names(), sum(), mean()
'''


# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of variables
class(my_numeric)
class(my_character)
class(my_logical)

# Create vectors
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)



###################### Naming Vectors #########################################

# In the previous exercise, we created a vector with your winnings this week.
# Each vector element refers to a day of the week but it is hard to tell which
# element belongs to which day. It would be nice if you could show that in the
# vector itself.
# 
# You can give a name to the elements of a vector with the names() function

# data is in some_vector
some_vector <- c("John Doe", "poker player")

names(some_vector) <- c("Name", "Profession")
some_vector

# Assign days as names of poker_vector
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday",
                         "Thursday", "Friday")
poker_vector




# It is boring and frustrating to type and retype information such
# as the days of the week. However, when you look at it from a higher
# perspective, there is a more efficient way to do this, namely,
# to assign the days of the week vector to a variable!
# 
# Just like you did with your poker and roulette returns,
# you can also create a variable that contains the days of the week.
# This way you can use and re-use it.


# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Create the variable days_vector using weekdays
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# show
poker_vector
roulette_vector




# If you sum two vectors in R, it takes the element-wise sum.
# the following three statements are completely equivalent:
# 
# c(1, 2, 3) + c(4, 5, 6)
# c(1+4, 2+5, 3+6)
# c(5, 7, 9)



# You can also do calculations with varialbes that represent vectors
a <- c(1, 2, 3)
b <- c(4, 5, 6)
c <- a + b
# show
c

# Calculate winnings from poker & roulette for Monday-Friday
#show
poker_vector
roulette_vector
total_daily <- poker_vector + roulette_vector
total_daily


########################### sum() #############################################

# calculate total winnings using sum()
total_poker <- sum(poker_vector)
total_poker

total_roulette <- sum(roulette_vector)
total_roulette

total_week <- sum(total_poker, total_roulette)
total_week

# check if your gains from poker are larger than roulette -- TRUE FALSE
total_poker > total_roulette



##################### Vector Selection ##############################

# Goal is to select specific elements of the vector.

# To select elements of a vector (and later matrices, data frames, ...),
# you can use square brackets. Between the square brackets, you indicate what
# elements to select.


# Select poker winnings from Wednesday
poker_wednesday <- poker_vector[3]
poker_wednesday

# Select poker winnings from 1st day and 5th day of the week
poker_vector_mon_fri[c(1, 5)]

# Select poker winnings from Tues, Wed, Thurs. Assign to poker_midweek
poker_midweek <- poker_vector[c(2, 3, 4)]
poker_midweek

# Get roulette results from Tues-Friday, assign roulette_selection_vector_slice
roulette_selection_vector_slice <- roulette_vector[2:5]
roulette_selection_vector_slice

# Notice you can solve the same problem by using element names
roulette_vector["Monday"]
roulette_vector[c('Tuesday', 'Wednesday', 'Thursday', 'Friday')]

# Calculate poker winnings M-W using names. Assign to poker_start.
poker_start <- poker_vector[c('Monday', 'Tuesday', 'Wednesday')]
poker_start

# Calculate the average of the elements in poker_start
mean(poker_start)



################### Selection by Comparison, Logical Operators ################

# You can use comparison operators on vectors.
c(4, 5, 6) > 5

# Which days did you make money on poker?
poker_vector > 0
selection_vector <- poker_vector > 0
selection_vector

# Now, you would like to know not only the days on which you won,
# but how much you won on those days. R knows what to do when you pass
# a logical vector in square brackets:
# it only selects the elements from selection_vector that correspond to TRUE
poker_vector[selection_vector]



# Now find out which days you had positive winnings from roulette
# Do it by TRUE or FALSE
roulette_selection_vector <- roulette_vector > 0
roulette_selection_vector

roulette_winning_days <- roulette_vector[roulette_selection_vector]
roulette_winning_days