# 
# 
# author: Alexander C. Hungerford
# 
# created: 13 October 2018
#
# course: Data Visualization with ggplot2 - Introduction


library(tidyverse)
data("mtcars")
load("gg_diamonds.RData")
# load("gg_fish.RData")
# load("gg_recess.RData")


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



######################## Diamonds df subset  ##################################

# need to change the default color palette bc its not good for visualization

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()

# same plot, no points, just smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()

# same plot, map clarity to color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_smooth()

# same plot, same color setting, plot only points with alpha
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.4)


# same basic plot, no points
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
dia_plot

# include points in a different way
dia_plot + geom_point()

# include aesthetics a different way
dia_plot + geom_point(aes(color = clarity))


# add geom_point with alpha 0.2 to dia_plot
dia_plot_2 <- dia_plot + geom_point(alpha = 0.2)

# plot with geom_smooth, with se = FALSE; se prevents error shading
dia_plot_2 + geom_smooth(aes(color = clarity), se = FALSE)


######################### Notes ############################################

# factor() turned a numeric variable into categorical

# ggplot( shape = someCategoricalVar )

# RData files preserve the R data structures of your data.
# filename.RData    --> load("filename.RData") 



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
# geom_smooth()
#    smoothing method to use, eg: lm, glm, gam, loess, Mass::rlm
















