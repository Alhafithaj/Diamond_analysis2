# Diamond Analysis
# Abdulmohsen Alhafith
# 29.09.2020
# A small case study for EDA and stats
install.packages("devtools")
library(devtools)
# load packages
library(tidyverse)

# Read in the data (csv format):
# Newer methods from tidyr package
jems <- read_csv("C:/Users/hme-h/Desktop/Misk/codes/diamonds.csv")
#kk 

# super convenient way
# library(rio) # R i/o
# jems2 <- import("data/diamonds.csv")

# Get familiar with our data:
summary(jems)
names(jems)
glimpse(jems)

# more detail:
attributes(jems)
typeof(jems)
typeof(jems$x)

#Exercise 8.2
#What type of data is contained in each column? 
# Use some of the functions we introduced in the
#dataframes section to explore the basic structure
#of our new object.
typeof(jems)
# more detail:
attributes(jems)
typeof(jems)
typeof(jems$x)



# Basic filtering
# Are there any diamonds with VVS (clarity) & Good (cut)
jems %>%
  filter(clarity== "VVS2" &cut== "Good")

#Exercise 8.3 (Counting individual groups)- How many diamonds with 
#a clarity of category "IF" are present in the data-set? - What fraction of the total do they represent?
clarity<- nrow(jems %>%
                 filter(clarity== "IF"))
nrow(t)

#Exercise 8.4 (Summarizing proportions)- What proportion of the whole is made up of each category of clarity?
jems %>%
  group_by(clarity) %>% 
  count() %>%
  mutate(prop = n/nrow(jems))%>%
  
  #______
  # I want find the min for each clarity
  #mutate(Minmume=  summarise(min(price)))
  
  #jems %>%
  # group_by(clarity) %>%
  #  summarise(minimue = min(price))
  #_____
  
  
jems %>%
  group_by(clarity) %>%
  count() %>%
  mutate(prop = n/nrow(jems)) 




#Exercise 8.5 (Find specific diamonds prices)- What is the cheapest diamond price overall? - What is the range of diamond prices? - What is the average diamond price in each category of cut and color?
jems %>%
  summarise(min(price)) 

rag<-range(jems$price)
rag
jems %>%
  filter(price == min(price )& clarity == IF )

jems %>%
  filter(price < 330)
jems %>%
  group_by(cut,color) %>%
  summarise(avg = mean(price))

jems %>%
  group_by(clarity,cut)%>%
  summarise(minmume = min(price)) 
summarise(maxmume = max(price))
# mutate(summarise(maximume = max(price)))


#Exercise 8.6 (Basic plotting)Make a scatter plot that shows the price of a diamond as described by another continous variable, like the carat.
jems %>%
  ggplot(x = jems$price,y = jems$carat, main = "price vs carat" )
price <- jems$price
carat<- jems$carat

ggplot(jems, aes(x = carat, y = price)) + geom_jitter()

#Exercise 8.8 (Applying transformations)Using the functions we discuss earlier,
#and in class, apply a log10 transformation to both the price and carat. You can
#save these as new columns in the data set called price_log10 and carat_log10.


carat_log10 <- log10(carat)
price_log10 <- log10(price)

# Exercise 8.9
#Make a scatter plot that shows the price of a diamond as described by another continous variable, like the carat.

ggplot(jems, aes(x = carat_log10, y = price_log10)) + geom_jitter()
#Exercise  & 8.11 
#Now that we’ve described the diamond price given a single variable, can you display
#       that on the plot? Tryto use the geom_smooth() function to add this new layer.
#`geom_smooth()` using formula 'y ~ x'

ggplot(jems, aes(x = carat_log10, y = price_log10)) + geom_jitter() +geom_smooth()

ggplot(diamonds, aes(price, carat)) + geom_smooth(method = "gam")

ggplot(jems, aes(x = carat_log10, y = price_log10)) 

#ggplot(jems, aes(carat_log10, price_log10, colour = red)) +
 # geom_point() 




#_____
group_by(price,carat)

plot(sin, -2*pi, 2*pi, main = "Sin(x)" )
#______

#reminder group by function 
jems %>%
  