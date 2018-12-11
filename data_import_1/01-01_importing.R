# 
# author: Alexander C. Hungerford
#
# title: DataCamp
#        Importing Data in R (part 1)
#        Ch. 1 - Importing Data from flat files with utils

###############################################################################

#                 THIS IS IN BASE-R, not tidyverse

###############################################################################



# read a csv - if the file is in your current working directory
# read.csv("filename.csv", stringsAsFactors = FALSE)


# if the file is not in your current working directory,
  # you can build a path to a file in a 'file-independent' way with file.path()
  # say it's in the "datasets" folder of the home directory
# path <- file.path("~", "datasets", "filename.csv")
      # now: read.csv(path, stringsAsFactors = FALSE)


# import data
pools <- read.csv("data_import_1/swimming_pools.csv", stringsAsFactors = FALSE)

# look at structure
str(pools)

# look at first few
head(pools)


# look at which variables change type if stringsAsFactors = TRUE,
    # the strings change from strings to factors
        # which would be for categorical variables
p <- read.csv("data_import_1/swimming_pools.csv", stringsAsFactors = TRUE)
str(p)

# rm(p)


# reading delimiters ------------------------------------------------------

# tab-delimitted
states <- read.delim("data_import_1/states.txt", stringsAsFactors = FALSE)


# delimitter is a forward slash "/" in a .txt file
    # use read.table() -- read any tabular file as data frame
states2 <- read.table("data_import_1/states_slash.txt",
                      header = TRUE,
                      sep = "/",
                      stringsAsFactors = FALSE)

# import hotdogts dataset, no header
hotdogs <- read.delim("data_import_1/hotdogs.txt", header = FALSE)
head(hotdogs)

# summary
summary(hotdogs)


# read in using path-independent style
path <- file.path("data_import_1", "hotdogs.txt")

# Import the hotdogs.txt file, give headers
hotdogs2 <- read.table(path,
                       sep = "",
                       col.names = c("type", "calories", "sodium"))

# Call head() on hotdogs
head(hotdogs2)

###############################################################################

# Lily wants to have the one with the fewest calories while
  # Tom wants to have the one with the most sodium.
hd3 <- read.delim("data_import_1/hotdogs.txt",
                  header = FALSE,
                  col.names = c("type", "calories", "sodium"))

# notice factors
str(hd3)

# Select the hot dog with the least calories: lily
lily <- hd3[which.min(hd3$calories), ]

# Select the observation with the most sodium: tom
tom <- hd3[which.max(hd3$sodium), ]

lily
tom

###############################################################################

# Previous call to import hotdogs.txt
hotdogs <- read.delim("data_import_1/hotdogs.txt",
                      header = FALSE,
                      col.names = c("type", "calories", "sodium"))

# Edit the colClasses argument to import the data correctly, store as hotdogs2
    # incorrect version:
# hotdogs2 <- read.delim("data_import_1/hotdogs.txt",
#                         header = FALSE,
#                         col.names = c("type", "calories", "sodium"),
#                         colClasses = NA)

    # corrected:
hotdogs2 <- read.delim("data_import_1/hotdogs.txt",
                       header = TRUE, 
                       col.names = c("type", "calories", "sodium"),
                       colClasses = c("factor", "NULL", "numeric"))

# compare structures - calories variable gone,
                      # sodium was int, but now numeric
str(hotdogs)
str(hotdogs2)

# read.csv() and read.delim() are wrapper functions to read.table()
    # they call read.table() behind the scenes

