library(tidytext)
library(dplyr)
library(data.table)

data=fread('../data/steak_cleaned.csv')

# plotWordStar <- function(stars,DTM,wordList,mfrow = c(4,4)) {
#   par(mfrow = mfrow)
#   col_DTM = colnames(DTM)
#   for(i in 1:length(wordList)) {
#     index = which(col_DTM == wordList[i])
#     if(length(index) == 0) {
#       warning(paste(wordList[i],"not detected"))
#       next
#     } 
#     dtm_vec = as.numeric(DTM[,index])
#     names(dtm_vec) = rownames(DTM)
#     starsY = rep(0,5)
#     for(j in 1:5) {
#       # I've changed this code to scale by total number of stars. This
#       # I think provides better resolution than before.
#       element = dtm_vec[as.character(stars$uniqueID[which(stars$stars == j)])]
#       starsY[j]  = sum(element > 0,na.rm=TRUE) / sum(stars$stars == j)
#     }
#     barplot(starsY,main=wordList[i],xlab="Stars",ylab="Word Freq")
#   }  
# }
# Y = data %>% select(uniqueID,stars);









#####################################
# star distribution on different cities

table(data$city)
star_madison=data$stars_x[which(data$city=="Madison")]
boxplot(star_madison)
hist(star_madison,freq = T)
b=table(star_madison)
barplot(b)









