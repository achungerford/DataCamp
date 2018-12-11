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

