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
  filter(!is.na(diff)) %>%
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



