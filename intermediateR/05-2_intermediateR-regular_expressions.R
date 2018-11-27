#
# author: Alexander C. Hungerford
#
# created: 27 November 2018
# 
# title: DataCamp
#        Intermediate R
#        Ch. 5 - Utilities - regular expressions


# what are Regular Expressions?
# a sequence of characters and meta-characters that form a
# search pattern that you can use to match strings
#
# why? check if pattern exists; replace a pattern, or to extract patterns
# especially useful for cleaning data

library(tidyverse)

animals <- c("cat", "moose", "impala", "ant", "kiwi")


############ checking for the existence of pattrens in strings ################

# let's figure out which animals have an 'a' in their name

# grepl(pattern = <regex>, x = <string>)
grepl(pattern = "a", x = animals)


# let's match for strings that start with an "a"
grepl(pattern = "^a", x = animals)

# ^ matches at beginning of line
# $ matches at end of line

# let's match for strings that end with an "a"
grepl(pattern = "a$", x = animals)

# to learn more about the meta-characters (like ^ or $), check out R docs
?regex


# grep()
# returns a vector of indices of the elements of x that yield a match
# grepl() gives a vector of LOGICALS
# grep() gives a vector of INDICES
grep(pattern = "a", x = animals)


# one way to compare grepl() and grep() is using the which() function

# given a logical vector as input, which() will return the indices
# for which that vector is TRUE
which(grepl(pattern = "a", x = animals))
grep(pattern = "a", x = animals)

grep(pattern = "^a", x = animals)


############################ Replacing matched patterns #######################

animals

# sub()
# sub(pattern = <regex>, replacement = <str>, x = <str>)
sub(pattern = "a", replacement = "o", x = animals)
# we just replaced all the 'a's with 'o's
# but notice that in "impala", it only replaced the first 'a', why is that?
# bc sub() only looks for the first match in a string, finds it, then stops looking

# gsub()
# to replace all of them
gsub(pattern = "a", replacement = "o", x = animals)

# vertical bar meta-character -- OR -- "|"
# say you want to replace every single "a" or "i" with an underscore "_"
gsub(pattern = "a|i", replacement = "_", x = animals)

# using vertical bar more 
gsub(pattern = "a|i|o", replacement = "_", x = animals)
