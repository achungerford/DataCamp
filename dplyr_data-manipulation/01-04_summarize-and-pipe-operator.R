# 
# author: Alexander C. Hungerford
#
# title: DataCamp
#        course: Data Manipulation in R with dplyr
#        ch. 4 - summarise()

# import libraries & data
library("tidyverse")
library("hflights") #every flight that left Houston, TX in 2011
data("hflights")

str(hflights)
class(hflights)

# create tibble
hflights_tbl <- tbl_df(hflights)
hflights_tbl


# select -    removes columns, choose only what you want
# filter -    removes rows
# arrange -   reorders rows
# mutate -    builds new columns
# summarize - calculates summary statistics


# select & mutate   - for manipulating variables(columns)
# filter & arrange  - for manipulating observaions (rows) 
# summarize         - for manipulating groups

# na.rm = TRUE   removes NA values

# dplyr helper functions:
#   use inside select()
#   to select groups of variables
#
# when choosing columns directly inside select(), you don't use quotes.
# But helper functions require quotes:
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


###### logical operators are important with filter()
# > 
# >=
# ==
# !=
# <
# <=
# is.na
# !is.na
# x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)

###### boolean operators
# & "and" 
# | "or"
# ! "not"


# is.na() will also come in handy. 
#   This example keeps the observations in df
#   for which the variable x is not NA
#
#   filter(df, !is.na(x))



# You can use any function you like in summarize() so long as
# the function can take a vector of data
#       and return a single number!
#
# R contains many aggregating functions, as dplyr calls them:
# 
#   min(x) - minimum value of vector x.
#   max(x) - maximum value of vector x.
#   mean(x) - mean value of vector x.
#   median(x) - median value of vector x.
#   quantile(x, p) - pth quantile of vector x.
#   sd(x) - standard deviation of vector x.
#   var(x) - variance of vector x.
#   IQR(x) - Inter Quartile Range (IQR) of vector x.
#   diff(range(x)) - total range of vector x. 
 

#### more dplyr functions with summarise()
# dplyr provides several helpful aggregate functions of its own,
# in addition to the ones that are already defined in R. These include:
#   
#   first(x) - The first element of vector x.
#   last(x) - The last element of vector x.
#   nth(x, n) - The nth element of vector x.
#   n() - The number of rows in the data.frame or group of observations that summarize() describes.
#   n_distinct(x) - The number of unique values in vector x.


#################### Exercise: The syntax of summarize

# Use summarize() to print out a summary of hflights containing two variables:
#   min_dist, the shortest distance flown, and
#   max_dist, the longest distance flown.
summarize(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary of hflights with a single variable, max_div:
#   the longest Distance for diverted flights.
#   You will need one of the four other verbs to do this!
summarize(filter(hflights, Diverted == 1), max_div = max(Distance))


########### Exercise: Aggregate functions

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarize(temp1, 
          earliest = min(ArrDelay), 
          average = mean(ArrDelay), 
          latest = max(ArrDelay), 
          sd = sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarize()
summarize(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))


##### Exercise: dplyr aggregate functions

# Generate summarizing statistics for hflights
summarize(hflights,
          n_obs = n(),
          n_carrier = n_distinct(UniqueCarrier),
          n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarize(aa,
          n_flights = n(),
          n_canc = sum(Cancelled),
          avg_delay = mean(ArrDelay, na.rm = TRUE))




######### pipe operator %>%

# Use dplyr functions and the pipe operator to transform the following English sentences into R code:
#   
# Take the hflights data set and then ...
# Add a variable named diff that is the result of subtracting TaxiIn from TaxiOut, and then ...
# Pick all of the rows whose diff value does not equal NA, and then ...
# Summarize the data set with a value named avg that is the mean diff value.
hflights %>% 
  mutate(diff = TaxiOut - TaxiIn) %>%
  filter(!is.na(diff)) %>%    # all NA get removed
  summarize(avg = mean(diff))





#### more dplyr functions with summarise()
# dplyr provides several helpful aggregate functions of its own,
# in addition to the ones that are already defined in R. These include:
#   
#   first(x) - The first element of vector x.
#   last(x) - The last element of vector x.
#   nth(x, n) - The nth element of vector x.
#   n() - The number of rows in the data.frame or group of observations that summarize() describes.
#   n_distinct(x) - The number of unique values in vector x.


# Chain together mutate(), filter() and summarize()

hflights %>%
  mutate(RealTime = 100 + ActualElapsedTime,
         mph = (60 * Distance / RealTime)) %>%
  filter(!is.na(mph) & mph < 70) %>%
  summarise(n_less = n(),
            n_dest = n_distinct(Dest),
            min_dist = min(Distance),
            max_dist = max(Distance))

# pt 2
hflights %>%
  mutate(
    RealTime = ActualElapsedTime + 100, 
    mph = 60 * Distance / RealTime
  ) %>%
  filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>%
  summarize(n_non = n(),
            n_dest = n_distinct(Dest),
            min_dist = min(Distance),
            max_dist = max(Distance))


# Exercise: Advnaced piping

############## how many overnight fligths?
# filter() the hflights tbl to keep only observations
      # whose DepTime is not NA,
      # whose ArrTime is not NA and
      # for which DepTime exceeds ArrTime.
# Pipe the result into a summarize() call to create a single summary variable:
      # num, that simply counts the number of observations.
hflights %>%
  filter(!is.na(DepTime),         # removes NAs from DepTime
         !is.na(ArrTime),         # removes NAs from ArrTime
         DepTime > ArrTime) %>%
  summarize(num = n())


########### group_by() #######################

# example
hflights %>% group_by(UniqueCarrier) %>%
  summarise(avgDep = mean(DepDelay, na.rm = T),
            avgArr = mean(ArrDelay, na.rm = T)) %>%
  arrange(avgArr, avgDep)


# example - group_by multiple variables
hflights %>% group_by(UniqueCarrier, Dest) %>%
  summarize(n_flights = n()) %>%
  summarize(n_dests = n())


# Exercise: Unite and conquer using group_by
hflights %>%
  group_by(UniqueCarrier) %>%
  summarize(
    p_canc = 100 * mean(Cancelled == 1), 
    avg_delay = mean(ArrDelay, na.rm = TRUE)
  ) %>%
  arrange(avg_delay, p_canc)


# combine group_by() and mutate()
# You can also combine group_by() with mutate().
#
# When you mutate grouped data, mutate() will calculate the new variables
# independently for each group. 
#
# This is particularly useful when mutate() uses the rank() function,
# that calculates within-group rankings.

# rank() takes a group of values and calculates
# the rank of each value within the group -- ascending, small to big
rank(c(21, 22, 24, 23))


# 
# filter() the hflights tbl to only keep observations for which
# ArrDelay is not NA and positive.
#
# Use group_by() on the result to group by UniqueCarrier.
# Next, use summarize() to calculate the average ArrDelay per carrier.
# Call this summary variable avg.
#
# Feed the result into a mutate() call:
# create a new variable, rank, calculated as rank(avg).
#
# Finally, arrange by this new rank variable

hflights %>%
  filter(!is.na(ArrDelay), ArrDelay > 0) %>%
  group_by(UniqueCarrier) %>%
  summarize(avg = mean(ArrDelay)) %>%
  mutate(rank = rank(avg)) %>%
  arrange(avg)

