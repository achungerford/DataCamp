# 
# 
# author: Alexander C. Hungerford
# 
# created: 13 October 2018
#
# course: Data Visualization with ggplot2 


library(tidyverse)
load("gg_diamonds.RData")
load("gg_fish.RData")
load("gg_recess.RData")
data("mtcars")


############################## Mtcars #########################################

# notice x-axis is numeric, and contains values that are not in the dataset
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()


# Although cyl (the number of cylinders) is categorical, it is classified
# as numeric in mtcars. You'll have to explicitly tell ggplot2 that cyl
# is a categorical variable.

# notice x-axis now only contains valuses that are present in the dataset
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_point()


# wt & mpg
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# engine displacement mapped onto a color gradient
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()

# engine displacemment mapped onto a continuous size scale
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()



######################### Iris Dataset ########################################



######################## Diamonds df subset  ##################################

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()




######################### Notes ############################################

# factor() turned a numeric variable into categorical

# ggplot( shape = someCategoricalVar )
# 
# 



# ggplot2 Layers
#   theme         all the non-data ink on the plot
#   coordinates   scale_x_continuous(), scale_y_continuous, coord_equal()
#   statistics    stat_
#   facets        facet_
#   geometries    geom_
#   aesthetics    aes()
#   data          ggplot(df, )
# 
# 
# 
















