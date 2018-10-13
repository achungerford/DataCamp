# author: Alexander C. Hungerford
# title: Intermediate R - Datacamp
# created: 26 September 2018
# 
# summary: relational operators
# 
# functions:
#    tail()
# 
# 
# 
# 
#
# 



# this evaluates to TRUE.
# Why? bc R uses alphabetical to sort character strings. since H comes after
# G in the alphabet, hello is considered greater than goodbye

"hello" > "goodbye"


# TRUE = 1
# FALSE = 0
# so this evaluates to FALSE
TRUE < FALSE


# relational operatos with vectors
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

linkedin > 10

facebook <- c(17, 7, 5, 16, 8, 13, 14)

facebook <= linkedin


# comparison operators: & = and ; | = or ; ! = not
x <- 12

x > 5 & x < 15
# TRUE, TRUE = TRUE

x > 5 & x < 12
# TRUE, FALSE = FALSE

x > 13 & x <10
# FALSE, FALSE = FALSE


# "or" operator | ; if either statement is true, expression is true
x > 5 | x > 16
# TRUE, TRUE = TRUE


# "not" operator: !
is.numeric(5)
# TRUE

!is.numeric(5)
# FALSE

!is.numeric("hello")
# TRUE


################# IMPORTANT about R language ##################################

# you can use a single or double logical operator, but the results can
# sometimes be different for && and ||
# why? because the && only examines the first element of each vector
# not the entire vector

# examples
a <- c(TRUE, TRUE, FALSE)
b <- c(TRUE, FALSE, FALSE)

a & b
a && b

a | b
a || b



# Watch out: 3 < x < 7 to check if x is between 3 and 7 will not work;
# you'll need 3 < x & x < 7 for that.


last <- tail(linkedin, 1)
last

# is last less than 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <= 20


##################### IF and IF-ELSE Statements ###############################

# if (condition == TRUE) {
#     expr1
# } else if (condition2 == TRUE) {
#     expr2
# } else {
#     expr3
# }
# 
# #############################################################################
