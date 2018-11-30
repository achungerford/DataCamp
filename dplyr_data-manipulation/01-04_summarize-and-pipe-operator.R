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


# You can use any function you like in summarize() so long as
# the function can take a vector of data and return a single number.
# R contains many aggregating functions, as dplyr calls them:
# 
# min(x) - minimum value of vector x.
# max(x) - maximum value of vector x.
# mean(x) - mean value of vector x.
# median(x) - median value of vector x.
# quantile(x, p) - pth quantile of vector x.
# sd(x) - standard deviation of vector x.
# var(x) - variance of vector x.
# IQR(x) - Inter Quartile Range (IQR) of vector x.
# diff(range(x)) - total range of vector x. 
 



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
