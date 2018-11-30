# 
# author: Alexander C. Hungerford
#
# title: Personal cheat sheet

######################## Checking Packages ###################################

# checking installed packages, with versions, very detailed
sessionInfo()

# list the packages only
(.packages())

# check conlicts
conflicts(detail=TRUE)


############################## Loading files ##################################

# R's built-in datasets
data(iris, mtcars)

# .Rdata files
load("fileName.RData")



############################ Data Manipulation ###############################

# dplyr

# select -    removes columns, choose only what you want
# filter -    removes rows
# arrange -   reorders rows
# mutate -    builds new columns
# summarize - calculates summary statistics


# select & mutate   - for manipulating variables(columns)
# filter & arrange  - for manipulating observaions (rows) 
# summarize         - for manipulating groups