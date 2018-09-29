# 
# author: Alexander C. Hungerford
# created: 14 September 2018
# 
# Title: Factors
# 
# Summary:
#   categorical varialbes: nominal, ordinal
#   comparing nominal factor elements gives an error
#   
#
# Functions:  factor(), levels(), summary(),




######################### What is a Factor? ###################################
# The term factor refers to a statistical data type used to store categorical
# variables. The difference between a categorical variable and a continuous
# variable is that a categorical variable can belong to a limited number of
# categories. A continuous variable, on the other hand, can correspond to an 
# infinite number of values.

############# How do you create a factor? #####################################
# First thing that you have to do is create a vector that contains all the
# observations that belong to a limited number of categories.
# They must be categorical variables (not continuous variables)

# create vector, use factor()
theory <- 'factors for categorical variables'
factor(theory)


# convert sex_vector to a factor
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)

# show it
factor_sex_vector





# There are two types of categorical varialbes: nominal, ordinal
# Notice the difference in how R displays the categories.
# nominal = alphabetized
# ordinl = greater than less than signs

# nominal
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector,
                                    order = TRUE,
                                    levels = c("Low", "Medium", "High"))
# ordinal
factor_temperature_vector












# When you first get a data set, you will often notice that it contains factors
# with specific factor levels. However, sometimes you will want to change the
# names of these levels for clarity or other reasons.
# R allows you to do this with the function levels().
# Example: levels(factor_vector) <- c("name1", "name2",...)


# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
factor_survey_vector
# notice the output is alphabetical

 
# Watch out: the order with which you assign the levels is important.
# If you type levels(factor_survey_vector), you'll see that it outputs "F" "M".
# If you don't specify the levels of the factor when creating the vector,
# R will automatically assign them alphabetically.
# To correctly map "F" to "Female" and "M" to "Male", 
# the levels should be set to c("Female", "Male"), in this order.

# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c('Female', 'Male')
factor_survey_vector

# Demonstrate use of function: summary()
summary(survey_vector)
summary(factor_survey_vector)

# comparing elements of a nominal factor  gives an error
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
male <- factor_survey_vector[1]
female <- factor_survey_vector[2]
# comparing male and female
male > female






########### Creating & Comparing  Ordered factors #############################
# create speed_vector
speed_vector <- c('medium', 'slow', 'slow', 'medium', 'fast')

# convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector,
                              ordered = TRUE,
                              levels = c('slow', 'medium', 'fast'))

# show it
factor_speed_vector
summary(factor_speed_vector)

# compare ordered vectors
# factor value for data analyst 2 and 5
da2 <- factor_speed_vector[2]
da5 <- factor_speed_vector[5]
da2 > da5
