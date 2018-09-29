# 
# author: Alexander C. Hungerford
# created: 14 September 2018
# 
# Summary:
#   matrices - create, name, name columns & rows
#     element selection
#     row selection, column selection
#     arithmetic onmatrices
#   
#
# functions: matrix(), rownames(), colnames(),
#            rowSums(), colSums(),
#            cbind(), rbind()
#   dimnames = naming rows and columns
#   
#
#   
# 

############ What is a Matrix #################################################
# a matrix is a collection of elements of the same data type
# (numeric, character, or logical) arranged into a fixed number
# of rows and columns. Since you are only working with rows and columns,
# a matrix is called two-dimensional.
###############################################################################


#################### Matrix 1 ##########################################

# Construct a matrix with 3 rows that contain numbers 1 to 9
matrix(1:9, byrow = TRUE, nrow = 3)
# argument 1: the elements that R will arrange into rows and columns
# argument 2: byrow indicates the matrix is filled by the rows
#             to fill by columns, byrow = FALSE
# argument 3: nrow = 3 says the matrix should have three rows


############################## Matrix 2 #######################################

# Three vectors are defined. Combine them all into a single vector then
# create a matrix from that vector. Matrix should have 3 rows, filled by row.
# Box office Star Wars (in millions!)

new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# combining the vectors
box.office <- c(new_hope, empire_strikes, return_jedi)

star_wars_matrix <- matrix(box.office, nrow = 3, byrow = TRUE)
# argument 1: the vector R will arrange into rows and columns
# argument 2: matrix should have three rows
# argument 3: matrix is filled by the rows, not by columns

#show the matrix
star_wars_matrix


# Now we want to make the names of the movies for the rows. This helps us
# to easily read the data, and helps us select data.

star.wars.matrix <- matrix(box.office, nrow = 3, byrow = TRUE)

# vectors regions and titles for naming
region <- c('US', 'non-US')
titles <- c('A New Hope', 'The Empire Strikes Back', 'Return of the Jedi')


##################### Naming Matrix Rows & Columns ############################
# Name the columns with region
colnames(star.wars.matrix) <- region
  star.wars.matrix

# Name the rows with the titles vector
rownames(star.wars.matrix) <- titles
  star.wars.matrix

# To calculate the total box office revenue for the three Star Wars movies,
# you have to take the sum of the US revenue and the non-US revenue column.
rowSums(star.wars.matrix)


################### Matrix: dimnames ##########################################
# dimnames stands for dimension names. You can quickly name rows & columns
# without having to create separate vectors. Probably saves memory.

y <- matrix(1:10, nrow = 5, byrow = TRUE,
            dimnames = list(
              c('Yale', 'Harvard', 'Princeton', 'Brown', 'Cornell'),
              c('Rank', 'Size')))
y
rowSums(y)
colSums(y)


############# Add Rows & Columns to a Matrix: cbind() rbind() #################
# cbind stands for column-bind
# rbind stands for row-bind
# In the previous exercise you calculated the vector that contained
# the worldwide box office receipt for each of the three Star Wars movies.
# That vector is not yet part of the star wars matrix. Add the column.

# The coolest thing about cbind() is that it can mere matrices and vectors.
# Example:  big.matrix <- cbind(matrix.1, matrix.2, vector.1, etc.)

# show the matrix
star.wars.matrix

# Sum up matrix row totals, store in new vector
worldwide <- rowSums(star.wars.matrix)

# show cbind() in action
cbind(star.wars.matrix, worldwide)

# store the new matrix
big.star.wars.matrix <- cbind(star.wars.matrix, worldwide)

# show it
big.star.wars.matrix

# sum up columns
total.revenue <- colSums(big.star.wars.matrix)
rbind(big.star.wars.matrix, total.revenue)


############# Selecting Matrix Elements - Rows & Columns ######################
star_wars_matrix

# selects element in first row, second column
star_wars_matrix[1, 2]

# Bind total revenue to the big star wars matrix
big.star.wars.matrix <- rbind(big.star.wars.matrix, total.revenue)

# Select data from rows 1-2, and columns 2-3
big.star.wars.matrix[1:2, 2:3]

################### Recreate the Star Wars Matrix #############################
# rows    = film names
# columns = US, Non-US
# bind another column - worldwide revenue
# bind another row    - total revenue

# Create a matrix with Star Wars film names & revenue (US, Non-US, Worldwide)
film.revenue <-  c(461.0, 314.4,
                   290.5, 247.9,
                   309.3, 165.8,
                   474.5, 552.5,
                   310.7, 338.7,
                   380.3, 468.5)


# create matrix
m <- matrix(film.revenue, ncol = 2, byrow = TRUE,
            dimnames = list(
              c('A New Hope', 'The Empire Strikes Back', 'Return of the Jedi',
                'The Phantom Menace', 'Attack of the Clones', 'Revenge of the Sith'),
              
              c('US', 'Non-US')
              )
            )

# view the new matrix
m

# Sum the rows together and store worlwide revenue in new vector
Worldwide <- rowSums(m)

# Include the column for worldwide revenue to the matrix
# (bind the column to the matrix )
m <- cbind(m, Worldwide)

# view the matrix with new column - worldwide
m

# Sum the columns and save revenues from all movies in Totals vector
Totals <- colSums(m)

# Include the Totals vector as another row to the matrix
# (bind the row to the matrix)
films.matrix <- rbind(m, Totals)

# view the completed matrix
films.matrix

# You can do arithmetic on matrices
# films.matrix * 10 will multiply each element of the matrix by 10
films.matrix*10
films.matrix/2

# Create a ticket price matrix
ticket.price <- c(5, 5, 6, 6, 7, 7, 4, 4, 4.5, 4.5, 4.9, 4.9)
films <- c('A New Hope', 'The Empire Strikes Back', 'Return of the Jedi',
           'The Phantom Menace', 'Attack of the Clones', 'Revenge of the Sith')
loc <- c('US', 'Non-US')

prices <- matrix(ticket.price, ncol = 2, byrow = TRUE)

rownames(prices) <- films
colnames(prices) <- loc

prices

# Select an entire column
us.ticket.price <- prices[ , 1]
us.ticket.price


