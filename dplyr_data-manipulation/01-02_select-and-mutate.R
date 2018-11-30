# 
# author: Alexander C. Hungerford
#
# title: DataCamp
#        course: Data Manipulation in R with dplyr
#        ch. 2 - select & mutate

# dplyr's 5 main functions
#   select, filter, arrange, mutate, summarize

# select -    removes columns, choose only what you want
# filter -    removes rows
# arrange -   reorders rows
# mutate -    builds new columns
# summarize - calculates summary statistics


# select & mutate   - for manipulating variables(columns)
# filter & arrange  - for manipulating observaions (rows) 
# summarize         - for manipulating groups


# "tidy data"
#   when all the columns are variables
#   and all the rows are observations


# dplyr functoins can recognize variable names without "" or $, just names


# mutate(my_df, x = a + b, y = x + c)


# import libraries & data
library("tidyverse")
library("hflights") #every flight that left Houston, TX in 2011
data("hflights")

str(hflights)
class(hflights)

# give me only the variables I want
h1 <- select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)



##################### Exercise: The five verbs and their meanings

# What order of operations should we use to find the average value of
#the ArrDelay (arrival delay) variable for all American Airline
# flights in the hflights tbl?
#   answer - filter() then summarize()

# create tibble
hflights_tbl <- tbl_df(hflights)
hflights_tbl

zz




################### Exercise: Choosing is not loosing! The slect verb.

# Print out a tbl with the four columns of hflights related to delay
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)

# ind the most concise way to select: columns Year up to and including DayOfWeek,
# columns ArrDelay up to and including Diverted. You can examine the order
# of the variables in hflights with names(hflights) in the console.
names(hflights)
select(hflights, Year:Diverted, -DepTime:-AirTime)





################## Exercise: Helper Functions
# 
# dplyr comes with a set of helper functions that can help
# you select groups of variables inside a select() call:
#
# When you refer to columns directly inside select(), you don't use quotes.
# When you use helper functions, you must use quotes:
#   
# starts_with("X"):       every name that starts with "X",
# ends_with("X"):         every name that ends with "X",
# contains("X"):          every name that contains "X",
#
# matches("X"):           every name that matches "X",
#                         where "X" can be a regular expression
#
# num_range("x", 1:5):    the variables named x01, x02, x03, x04 and x05,
#
# one_of(x):              every name that appears in x, which should be a character vector.


# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ArrDelay, DepDelay)


# Print out a tbl using both helper functions and variable names, to get
# columns - UniqueCarrier, FlightNum, TailNum, Cancelled, and CancellationCode
select(hflights, UniqueCarrier, ends_with("Num"), contains("ell"))


# Print out a tbl using only helper functions.
# Return the following columns with select() and helper functions:
# DepTime, ArrTime, ActualElapsedTime, AirTime
# ArrDelay, DepDelay.
select(hflights, contains("Time"), contains("Delay"))




################### Exercise: Comparison to BaseR

# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, contains("Taxi"), Distance)


# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, Year:ArrTime, -DayofMonth)


# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, TailNum, contains("Taxi"))




################# Exercise: Mutating is creating

# Create a new data frame, g1, which is the data frame hflights
# with an additional column: ActualGroundTime,
# the difference between ActualElapsedTime and AirTime.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)


# Extend g1 further, by adding an additional column GroundTime.
# This column is the sum of the TaxiIn and TaxiOut columns.
# Store the resulting data frame in g2.
# Check in the console that the GroundTime and ActualGroundTime columns are equal.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# compare
select(g2, GroundTime, ActualGroundTime)


# Add a new variable to g2 named AverageSpeed
# that denotes the average speed that each plane flew in miles per hour.
# Save the resulting dataset as g3.
# Use the following formula: 60 * Distance / AirTime.
g3 <- mutate(g2, AverageSpeed = 60 * Distance / AirTime)



################ Exercise: Add multiple variables using mutate


# Add a second variable loss_ratio to the dataset: m1
# Adapt the code that builds m1:
# add a variable loss_ratio, which is the ratio of loss to DepDelay.
m1 <- mutate(hflights,
             loss = ArrDelay - DepDelay,
             loss_ratio = loss/DepDelay)


# Add the three variables as described in the third instruction: m2
# Create a tbl m2 from hflights by adding three variables:
#   TotalTaxi, which is the sum of TaxiIn and TaxiOut;
#   ActualGroundTime, which is the difference of ActualElapsedTime and AirTime
#   Diff, the difference between the two newly created variables.
#     This column should be zero for all observations
m2 <- mutate(hflights,
             TotalTaxi = TaxiIn + TaxiOut,
             ActualGroundTime = ActualElapsedTime - AirTime,
             Diff = TotalTaxi - ActualGroundTime)
