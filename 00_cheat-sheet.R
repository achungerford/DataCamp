# 
# author: "Alexander C. Hungerford"
# 
# title: "Personal cheat sheet"

####################### R Studio commands #####################################

"ctrl shift D"
# duplicates a your highlighted lines of code below your cursor

"hold alt with up/down arrow"
# this allows you to move lines of code

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


################### Creating an R-markdown-notebook############################

# An R markdown notebook is different from just a .Rmd file.

# Add > 'R Notebook'
# is the one you want. It's similar to a Jupyter Notebook in python
# At the top you will see:
#
# ---
# title: "R Notebook"
# output: html_notebook
# ---


# It will create the file, but it won't be saved yet. When you click the
# save button, you'll see a pop-up window. Just name it. Don't try to put an
# extension on the file yourself. Rstudio will make it a .Rmd while also creating
# a ".nb.html" file alognside it.

# IMPORTANT
# This is completely different from doing Add > 'R markdown...'
# You DO NOT want the 'R markdown...'
# Why?
# Because instead of simply creating a 'fileName.Rmd' & 'fileName.nb.html';
# the 'R markdown...' creates 'fileName_files/' instead. This is not good if
# you want some html that can be pushed to github.



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