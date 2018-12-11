# Some rules of thumb for new R users:

# If you are working with data.frames, forget there is a function called apply - whatever you do - don't use it. Especially with a margin of 1 (the only good usecase for this function is to operate over matrix columns- margin of 2).

# Some good alternatives: ?do.call, ?pmax/pmin, ?max.col, ?rowSums/rowMeans/etc, the awesome matrixStats packages (for matrices), ?rowsum and many more
# For loops are not bad- don't listen to anyone who says otherwise. They are bad only in certain cases:

# If you use them to iterate over rows.
# If you are performing unvectorized/inefficient operation within each iteration
# If you are writing a loop for something that is already vectorized
# R is a vectorized language- meaning many operation were already written in C loops- so don't reinvent the wheel and write stuff in R loops if it was already written. With one exception- many of these function work only matrices. Hence, if you have a data.frame you should think twice if you want it to be converted to a matrix first, or you can avoid it

# Learn base R before you learn any fancy packages such as dplyr. It is a nice package and all, but it was designed for very specific things. Most of the rest operation could be done much more efficiently using base R.

# Get familiar with R classes. Learn what is factor and how to use it. Know the difference between a matrix and a data.frame.

# Learn how and when to work with lists or arrays.

# Know the difference between numeric and integer. Read about floating points.

# Learn how and when yo use lapply/sapply/vapply - these could come useful many times

# You have to learn some ?regex. Must.

# Read ?S4groupGeneric in order to discover which functions have data.frame methods (a very useful to know).

# Learn about ?methods

# Read ?strptime very carefully.