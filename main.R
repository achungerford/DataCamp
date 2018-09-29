# =============================================================================
# Title: main R
#  
# Description: To import data
# 
#
# Author: Alexaner C. Hungerford
# Contact: achungerford@gmail.com
# Date: 10 September 2018
# =============================================================================


library(tidyverse)
library(dplyr)
library(ggplot2)
library(readxl)
library(rvest)

# scrape website for 2017 coach compensation data:
#   https://ucannualwage.ucop.edu/wage/

# Save the URL being scraped as object
url <- 'https://ucannualwage.ucop.edu/wage/'

# Reading the HTML code from the site. Creating an HTML document from the URL
html <- read_html(url)
