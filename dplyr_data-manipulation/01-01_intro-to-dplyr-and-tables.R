# 
# author: Alexander C. Hungerford
#
# title: DataCamp
#        course: Data Manipulation in R with dplyr
#        ch. 1 - Intro to dplyr & tbls


# import libraries & data
library("tidyverse")
library("hflights") #every flight that left Houston, TX in 2011
data("hflights")

# list installed packages, alphabetically
sort((.packages()))

# look at data
str(hflights)
head(hflights)
summary(hflights)

#################### using tibbles to view data ###############################
# Base R

# create tibble, tibbles show only data that fits to your console window
hflights <- tbl_df(hflights)

# use glimpse() on tibble; like str()
glimpse(hflights)

# convert back
hflights <- as.data.frame(hflights)

# turn data.frame into tibble, see above
hflights <- tbl_df(hflights)

# isolate UniqueCarriers
carriers <- hflights$UniqueCarrier

# creating a lookup table via a named vector
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights - notice new column 'Carrier'
glimpse(hflights)

# new lookup table
lut <- c("A" = "carrier",
         "B" = "weather",
         "C" = "FFA",
         "D" = "security",
         "E" = "not cancelled")

# use new lookup table to change CancellatoinCode column labels
# may take a while, many rows
hflights$Code <- lut[hflights$CancellationCode]
glimpse(hflights)
