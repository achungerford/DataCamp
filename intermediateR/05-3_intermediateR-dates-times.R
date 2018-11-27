#
# author: Alexander C. Hungerford
#
# created: 27 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 5 - Utilities - times & dates

library(tidyverse)

today <- Sys.Date()

today
class(today)

now <- Sys.time()
now
class(now)

# create Date objects: say we want a date object for 14 May 1971
my_date <- as.Date("1971-05-14")
my_date

class(my_date)

# say we scramble the order of the date elments -- error
my_date <- asDate("1971-14-05")

# Default format: %Y-%m-%d
# %Y 4-digit year
# %m 2-digit month
# %d 2-digit day

# but we can fix it if we alter these explicitly
my_date <- as.Date("1971-14-05", format = "%Y-%d-%m")
my_date


# creating POSIXct objects
my_time <- as.POSIXct("1971-05-14 11:25:15")
my_time



# calculations with dates

# increment by 1 day
my_date
my_date + 1

# get difference between: 29 Sept. 1998 and my_date
my_date2 <- as.Date("1998-09-29")

my_date2 - my_date


# calculations wth POSIXct objects
# time unit is 1 second
my_time + 1

my_time2 <- as.POSIXct("197-07-14 21:11:55")

my_time - my_time2


#################### Exercise: Create & format dates ##########################

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")


# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")


################## Exercise: Create & format times ############################

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
# Using format(), create a string from time1 containing only the minutes.
format(time1, "%M")

# From time2, extract the hours and minutes as "hours:minutes AM/PM".
# Refer to the assignment text above to find the correct conversion symbols!
format(time2, "%I:%M %p")


################## Exercise: Calculations with dates ##########################

# log in to see exercise

################## Exercise: Calculations with times ##########################

# log in to see exercise


################################# NOTES #######################################

# DATES:

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)


# TIMES:

# For a full list of conversion symbols -- ?strptime documentation
?strptime


# use as.POSIXct() to convert from a character string to a POSIXct object,
# use and format() to convert from a POSIXct object to a character string:

# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

