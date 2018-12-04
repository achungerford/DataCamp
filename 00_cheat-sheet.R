# 
# author: Alexander C. Hungerford
#
# title: Personal cheat sheet

################################## Packages ###################################

# checking installed packages, with versions, very detailed
sessionInfo()

# list the packages only
(.packages())

# check conlicts
conflicts(detail=TRUE)

# check pkg dependencies
tools::package_dependencies("packageName", db = installed.packages())

# check if pkg is a dependency for other packages
tools::package_dependencies("packageName", db = installed.packages(), reverse = TRUE)

############################## Loading files ##################################

# R's built-in datasets
data(iris, mtcars)

# .Rdata files
load("fileName.RData")

# View()
# str()

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