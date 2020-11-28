library(tidytext)
library(dplyr)
library(data.table)

data=fread('../data/steak_cleaned.csv')

#####################################
# star distribution on different cities

table(data$city)
star_madison=data$stars_x[which(data$city=="Madison")]
boxplot(star_madison)
hist(star_madison,freq = T)
b=table(star_madison)
barplot(b)


