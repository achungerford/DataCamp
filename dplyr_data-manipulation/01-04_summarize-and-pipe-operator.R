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


#################### Exercise: The syntax of summarize

# Use summarize() to print out a summary of hflights containing two variables:
#   min_dist, the shortest distance flown, and
#   max_dist, the longest distance flown.
summarize(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary of hflights with a single variable, max_div:
#   the longest Distance for diverted flights.
#   You will need one of the four other verbs to do this!
summarize(filter(hflights, Diverted == 1), max_div = max(Distance))
