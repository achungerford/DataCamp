# 
# author: Alexander C. Hungerford
# created: 21 September 2018
# 
# Summary:
#   filtering, arranging, mutating data
#   intro to ggplot2
#     scatterplots, line plots,
#     bar plots, histograms, box plots
#     
#
#   adding aesthetics:
#      x, y, color, size, labels
#   log scale variables
#   faceting (subdividng) a plot into separate plots
#   summarizing data: many rows into one row
#   group_by
#   
#
#   
#
# functions: filter(), pipes %>%, arrange(), ggplot(), aes(),
#            summarize(), group_by(),
#   
#   ggplot(dataset,
#     aes(x = x-var, y = y-var, color = categorical, size = numerical)) +
#   geom_plot() +
#   scale_x_log10() +
#   scale_y_log10() +
#   facet_wratp(~ category) +
#   expand_limits(y = 0)
#   
#   summarize functions: mean, median, min, max, sum
#   
#   
#
###############################################################################


library(gapminder)
library(dplyr)
library(ggplot2)

# Show the gapminder dataset
gapminder

########################## filter() #####################################
# filter() to look at a subset of your data based on conditions
# you'll use a pipe each time you apply a ver. A pipe: %>%
# pipe -- take whatever is before it and feed it into the next step

# filter for year 2007
gapminder %>%
  filter(year == 2007)

# filter for one country
gapminder %>%
  filter(country == "United States")

# filter by multiple conditions
gapminder %>%
  filter(year == 2007, country == "United States")


########################## arrange() #####################################
# arrange() sorts a table in ascending or descending order
gapminder %>%
  arrange(gdpPercap)

# sort in descending order
gapminder %>%
  arrange(desc(gdpPercap))

# find the highest GDP per cap countries in just one year
# combinde filter() and arrange()
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

########################## mutate() #####################################
# mutate() changes or adds variables

# population per 1 mil
gapminder %>%
  mutate(pop = pop / 1000000)

# adding a new variable: find total GDP
gapminder %>%
  mutate(gdp = gdpPercap * pop)

# combining
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
  filter(year == 2007) %>%
  arrange(desc(gdp))



########################## ggplot2 ############################################
# scatterplots

# since we're only working with 2007 data, we want to filter & save
gapminder_2007 <- gapminder %>%
  filter(year == 2007)


# scatterplot: compare wealth & life expectancy
# x-axis: gdpPercap
# y-axis: life expectancy
# aes stands for aesthetic
# geom_point specifies the type of graph you're creating. Adding a layer.
# geom means you're adding a type of geometric object to the graph.
# point indicates scatterplot, where each obsv corresponds to one point.

ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()



############## Log scales #####################################################

# log scale: each fixed distance represents a multiplication of the value

# example: regular number line, each increment adds 10
#  0 + 10 = 10
# 10 + 10 = 20
# 20 + 10 = 30
# 30 + 10 = 40

# example: log scale, start at 1, each increment multiplies by 10
#    1 * 10 = 10     = 10^1
#   10 * 10 = 100    = 10^2
#  100 * 10 = 1000   = 10^3
# 1000 * 10 = 10000  = 10^4


# Now, each unit represents 10x of GDP
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10()


################### Color & Size ##############################################

# represent categorical variables by color. It goes inside aes()
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10()

# good way to represent numerical variables is by size. Goes inside aes()
ggplot(gapminder_2007, aes(x = gdpPercap,
                           y = lifeExp,
                           color = continent,
                           size = pop)) +
  geom_point() +
  scale_x_log10()


########################### Faceting ##########################################

# ggplot2 lets you divide your plot into sub-plots. This is faceting.

ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

ggplot(gapminder, aes(x = pop, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ year)


####################### Summarize ############################################

# summarize many observations into a single data point
# turns many rows into one row

# example: average life expectancy across all countries and years
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))

# look at averages for a particular year. Average life expectancy 2007.
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp))

# doing multiple summaries at once: In addition to avg lifeExp, want
# to find total population that year. Separate with comma.
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))


############################## group_by #######################################

# say you want to find the average life expectancy by year
# you wouldn't want to have to change the year in the code each time,
# that's tedious and would take forever. This is where group_by comes in.

# group_by() BEFORE summarize() turns groups into one row each
# this replaces the filter(year == 2007)

gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))

# population went from 2.4B in 1952 to 6.25B in 2007



# say you want to find avg lifeExp and population by continent
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# groupinb by both continent and year
gapminder %>%
  group_by(continent, year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))


############################# Visualizing #####################################

by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(as.numeric(pop)),
            meanLifeExp = mean(lifeExp))
by_year

# scatterplot: global population
ggplot(by_year, aes(x = year , y = totalPop)) +
  geom_point()

# make y-axis start at zero
ggplot(by_year, aes(x = year , y = totalPop)) +
  geom_point() +
  expand_limits(y = 0)


# by year, by continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(as.numeric(pop)),
            meanLifeExp = mean(lifeExp))

by_year_continent

ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent)) +
  geom_point() +
  expand_limits(y = 0)



#################### Line Plots ###############################################

# for visualizing change over time (time series)
# makes it clear that what you care about is the trend over time

ggplot(by_year_continent, aes(x = year, y = meanLifeExp, color = continent)) +
  geom_line() +
  expand_limits(y = 0)

# median GDP per capita over time
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year,
       aes(x = year,
           y = medianGdpPercap)) +
  geom_line() +
  expand_limits(y = 0)


# use group_by() and summarize() to find the median GDP per capita within
# each year and continent, calling the output column medianGdpPercap.
# Save the dataset as by.year.continent
by_year_and_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# plot medianGdpPercap by year & continent over time
ggplot(by_year_and_continent,
       aes(x = year,
           y = medianGdpPercap,
           color = continent)) +
  geom_line() +
  expand_limits(y = 0)



################################### Bar plots #################################

# useful fore comparing across discrete categories

# example:
by_continent <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp))

by_continent


# x = categorical variable,
# y = determines height of the bars
ggplot(by_continent, aes(x = continent, y = meanLifeExp)) +
  geom_col()

# Summarize the median gdpPercap by year and continent in 1952
by_continent2 <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent2, aes(x = continent, y = medianGdpPercap)) +
  geom_col()


# Filter for observations in the Oceania continent in the year 1952.
# Save this as oceania_1952.
# Use the oceania_1952 dataset to create a bar plot,
# with country on the x-axis and gdpPercap on the y-axis.

# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(year == 1952, continent == 'Oceania') %>%
  group_by(continent)

# show filtered data
oceania_1952

# # Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x = country, y = gdpPercap)) +
  geom_col()



######################### Histograms ##########################################

# histograms show distribution
# every bar represents a bin
# heigth represents the count of how many items fall into that bin

# histograms have only 1 aesthetic, the x-axis
# width of each bin is chosen automatically, but you may need to customize it
# do this with bin_width(x = 5)
# also may need to use a log scale to make it understandable

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop)
ggplot(gapminder_1952, aes(x = pop)) +
  geom_histogram()

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x = pop)) +
  geom_histogram() +
  scale_x_log10()


######################### Box plots ###########################################

# say you want to compare the distribution of life expectancies across
# continents

# x = categories (continents)
# y = values we're comparing (life expenctancy)
ggplot(gapminder_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot()

# black line = median of that continent's distribution
# top & bottom of each box represent 75th percentile & 25th percentile, respectively
# therefore half of the distribution lies within that box
# the whiskers coming from each box represent the countries not in that middle 50%
# the dots below the whiskers represents outliers


gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()

# Add a title to your graph
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() +
  labs(title = 'Comparing GDP per capita across continents')