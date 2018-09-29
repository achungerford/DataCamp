# 
# author: Alexander C. Hungerford
# created: 17 September 2018
# 
# Summary: Lists
#   Creating a list with components
#   Naming the components
#   Creating a named list.
#   Selecting elements from a list
#   Adding more to a list. Extending a list.
#   
#
# functions:
#   list(), matrix()
#
#
#
#

########## Creating a list with components ####################################
# vector with numbers 1-10
my_vector <- 1:10
my_vector

# matrix with numbers 1-9 arranged vertically
my_matrix <- matrix(1:9, ncol = 3)
my_matrix


# get the first 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10, ]
my_df

# contstruct a list that contains the variables my_vector, my_matrix, & my_df
my_list <- list(my_vector, my_matrix, my_df)
my_list


########### Creating a named list #############################################

## Option 1 for naming components of a list
my_list <- list(my_vector, my_matrix, my_df)
names(my_list) <- c("vec", "mat", "df")
my_list


## Option 2 for naming components of a 
# Adapt list() call to give the components names
my_list <- list(vec = my_vector,
                mat = my_matrix,
                df = my_df)
my_list


################## Create a matrix for The Shining ############################
# moviename <- c("The Shining")
# actors <- c("Jack Nicholson",
#            "Shelley Duvall",
#            "Danny Lloyd",
#            "Scatman Crothers",
#            "Barry Nelson" )
# 
# 
# 
# scores <- c(4.5, 4.0, 5.0)
# matrix(scores)
# 
# sources <- c("IMDb1", "IMDb2", "IMDb3")
# matrix(sources)
# 
# comments <- c("Best Horror Film I Have Ever Seen",
#               "A truly brilliant and scary film from Stanley Kubrick",
#               "A masterpiece of psychological horro")
# matrix(comments)
# 
# colnames("scores", "sources", "comments")
##############################################################################


###################### Selecting elements from a List #########################
my_list

## To select elements from vectors, you use brackets []

# get the first element from the list
my_list[[1]]

# you can also use the names of the components
my_list[['mat']]

# or
my_list$mat

## Sometimes you need to slect specific elements out of these components.
# Examples
my_list[[3]][4]
my_list$df[1]





################ Adding more to a list ########################################

my_list

# ext_list <- c(my_list, my_val).
# This line will simply extend the original list with the component my_val.
# This component gets appended to the end of the list.
# If you want to give the new list item a name like before:
#
# ext_list <- c(my_list, my_name = my_val)

my_list_new <- c(my_list, year = 2005)
str(my_list_new)
my_list_new
