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


###################### Exercise: grepl() & grep() #############################

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov",
            "dalai.lama@peace.org", "invalid.edu",
            "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", emails)

# Use grep() to match for "edu", save result to hits
# Do the same thing with grep(), but this time save the resulting indexes
# in a variable hits
hits <- grep(pattern = "edu", x= emails)

# Subset emails using hits
# Use the variable hits to select from the emails vector
# only the emails that contain "edu"
emails[hits]


################## Exercise: grepl() & grep() (2) #############################

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov",
            "dalai.lama@peace.org", "invalid.edu",
            "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
# Use grepl() with the more advanced regular expression to
# return a logical vector. Simply print the result.
grepl(pattern = "@.*\\.edu$", x = emails)
# ".*"  which matches any character (.) zero or more times (*).
# Both the dot and the asterisk are metacharacters.
# You can use them to match any character between
# the @-sign and the ".edu" portion of an email address.


# Use grep() to match for .edu addresses more robustly, save result to hits
# Do a similar thing with grep() to create a vector of indices.
# Store the result in the variable hits
hits <- grep(pattern = "@.*\\.edu$", emails)

# Subset emails using hits
emails[hits]

# A careful construction of our regular expression leads to more
# meaningful matches. However, even our robust email selector will often match
# some incorrect email addresses, for instance, 
# kiara@@fakemail.edu
# Let's not worry about this too much and continue 


############### Exercise: sub() & gsub() ######################################

# for specifying "replacement" arguments

emails

sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails)


awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)


#   .*
#   It can be read as "any character that is matched zero or more times".

#   \\s: Match a space. 
#       The "s" is normally a character, escaping it (\\) makes it a metacharacter.

#   [0-9]+: Match the numbers 0 to 9, at least once (+).

#   ([0-9]+): The parentheses are used to make parts of the matching string available
#             to define the replacement.
#
#             ([0-9]+) selects the entire number that comes before the word
#             “nomination” in the string
#
#   \\1 in the replacement argument of sub() is set to the string
#       captured by the regular expression [0-9]+





############ NOTES ############################################################
#
# You can use the caret, ^, and the dollar sign, $ to match the content located
# in the start and end of a string, respectively.
#
# This could take us one step closer to a correct pattern for matching
# only the ".edu" email addresses from our list of emails.
# But there's more that can be added to make the pattern more robust:
#
# @, because a valid email must contain an at-sign.
#
# ".*"  which matches any character (.) zero or more times (*).
# Both the dot and the asterisk are metacharacters.
# You can use them to match any character between
# the @-sign and the ".edu" portion of an email address.
#
# \\.edu$
#     to match the ".edu" part of the email at the end of the string.
#
#     The \\ escapes the dot: it tells R that you want to use the "."
#     as an actual character.
#

