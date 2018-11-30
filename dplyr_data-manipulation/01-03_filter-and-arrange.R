# 
# author: Alexander C. Hungerford
#
# title: DataCamp
#        course: Data Manipulation in R with dplyr
#        ch. 3 - filter & arrange

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

# is.na() will also come in handy. 
#   This example keeps the observations in df
#   for which the variable x is not NA
#
# filter(df, !is.na(x))



# isolate UniqueCarriers
carriers <- hflights$UniqueCarrier

# creating a lookup table via a named vector
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

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


################ Exercise: Logical Operators

# All flights that traveled 3000 miles or more
filter(hflights, Distance >= 3000)

# All flights where taxiing took longer than flying
filter(hflights, TaxiIn + TaxiOut > AirTime)



############### Exercise: Combining tests using boolean operators

# Use R's logical and boolean operators to select just the rows where
# a flight left before 5:00 am (500) or arrived after 10:00 pm (2200).
filter(hflights, DepTime < 500 | ArrTime > 2200)


# Print all of the flights that departed late but arrived ahead of schedule.
# Use DepDelay and ArrDelay for this.
filter(hflights, DepDelay > 0 & ArrDelay < 0)


# Find all of the flights that were cancelled after being delayed.
# These are flights that were cancelled, while having a
# DepDelay greater than zero.
filter(hflights, DepDelay > 0 & Cancelled == 1)



############## Exercise: Blend together what you've learned!

# First, use filter() to select the flights that had JFK as their destination
# Save this result to c1 (cOne)
c1 <- filter(hflights, Dest == "JFK")

# Second, add a new column named Date to c1:
# paste() together the Year, Month and DayofMonth variables,
# separate them by a "-" by using the sep attribute of paste().
# Save the resulting data frame as c2.
c2 <- mutate(c1, Date = paste(Year, Month, DayofMonth, sep = "-"))

# Finally, select some columns to provide an overview:
# Date, DepTime, ArrTime and TailNum, in this order.
# Do not assign the resulting data frame to a variable;
# just print it to the console.
select(c2, Date, DepTime, ArrTime, TailNum)



########## Exercise: Recap on select, mutate, and filter

# Q: How many weekend flights flew a distance of more than 1000 miles
# but had a total taxiing time below 15 minutes?
wknd <- filter(hflights_tbl, DayOfWeek == 6 | DayOfWeek == 7)
wknd
answer <- filter(wknd, (Distance > 1000) & ((TaxiIn + TaxiOut) < 15))
answer


########################## arrange() ####################################

# rearranges rows - smallest to biggest
# arrange(df, var1, var2) -- arranges first by var1
#   if tie, then arranges by var2

# If you pass a factor variable, R will rearrange the rows according
# to the order of the levels in your factor.
# Running levels() on the variable reveals this order.

dtc <- filter(hflights_tbl, Cancelled == 1, !is.na(DepDelay))
str(dtc)
# Arrange dtc by departure delays
arrange(dtc, DepDelay)
glimpse(arrange(dtc, CancellationCode))



