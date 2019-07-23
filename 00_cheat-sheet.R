
################### Creating an R Notebook ####################################




# IMPORTANT
# This is completely different from doing Add > 'R markdown...'
# You DO NOT want the 'R markdown...', which produces a heading of
#
# ---
# title: "ggplot-basics"
# author: "Alexander C. Hungerford"
# date: "June 1, 2019"
# output: html_document
# ---


# 'R Notebook' will create the file, but it won't be saved yet. When you click
# the save button, you'll see a pop-up window. Just name it. Don't try 
# to put an extension on the file yourself. Rstudio will make it a 
# .Rmd while also creating a ".nb.html" file alognside it.

#### YOU DO NOT WANT output: html_document ####

# Why?
# Because instead of simply creating a 'fileName.Rmd' & 'fileName.nb.html';
# the 'R markdown...' creates 'fileName_files/' instead. This is not good if
# you want some html that can be pushed to github.


# Note, there is still the problem with R Notebooks and Github.
# R Notebooks still don't render on github (whereas Jupyter Notebooks do).
# There's an issue that's been open for it since 2017. There are a few
# workarounds, but the issue remains open here:
# https://github.com/rstudio/rmarkdown/issues/1020



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