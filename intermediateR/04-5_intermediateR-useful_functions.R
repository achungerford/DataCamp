#
# author: Alexander C. Hungerford
#
# created: 26 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 4 - The Apply Family - useful functions


# functions for data structures
li <- list(log = TRUE,
           ch = "hello",
           int_vec = sort(rep(seq(8, 2, by = -2), times = 2)))
li

# seq()
# generates a sequence of numbers: first and second args are where to
# start and stop sequence respectively.
# "by" argument specifies the increment value for the sequence on each step
seq(1, 10, by = 3)
seq(8, 2, by = -2)

# rep()
# replicates the inputs
rep(c(3, 9, 14), times = 3)
rep(6, times = 4)
rep(2, times = 7)

# instead of repeating the entire vector, each element gets repeated
rep(c(3, 9, 14), each = 2)
rep(c(8, 4, 3), each = 5)

# sort()
sort(c(8, 4, 3, 8, 5, 2))

#sort() decreasing
sort(c(8, 4, 3, 8, 5, 2), decreasing = TRUE)

#structure
str(li)

# is.*() and as.*()
is.list(li)
is.list(cities)
is.list(c(3, 5, 9))

li2 <- as.list(c(3, 5, 9))
is.list(li2)










