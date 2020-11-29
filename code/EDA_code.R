
# We would like to perform some Exploratory data analysis first

#######################################################
library(tidyverse)
library(dplyr)
library(data.table)

data=fread('../data/steak_cleaned.csv')

plotWordStar <- function(stars,DTM,wordList,mfrow = c(4,4)) {
  par(mfrow = mfrow)
  col_DTM = colnames(DTM)
  DTM=as.data.frame(DTM)
  for(i in 1:length(wordList)) {
    index = which(col_DTM == wordList[i])
    if(length(index) == 0) {
      warning(paste(wordList[i],"not detected"))
      next
    }
    dtm_vec = DTM[,index]
    starsY = rep(0,5)
    for(j in 1:5) {
      element = dtm_vec[which(stars==j)]
      element = na.omit(element)
      starsY[j]  = sum(element > 0,na.rm=TRUE)/length(element)
    }
    barplot(starsY,main=wordList[i],xlab="Stars (1 -> 5)",ylab="Word Freq")
  }
}

covariates=names(data)

# sanity check
mylist=c("bad","worst","awful",
         "mediocre","average","ordinary",
         "fantastic","excellent","wonderful")
plotWordStar(data$stars_x,data,mylist,c(3,3))

# Different Types of Steak
steak_list=c('Filet','Ribeye','Strip','Sirloin',
             'Porterhouse','Tomahawk','Skirt','Flank',
             'hanger','round','cube')
steak_list=tolower(steak_list)
plotWordStar(data$stars_x,data,steak_list,c(3,4))

# Different Types of other food
sidefood_list=c("salad","drink","cheese","potato",
                "chicken","sushi","burger","bread",
                "dessert","shrimp","wine","beer",
                "sandwich","lobster","cake","salmon")
plotWordStar(data$stars_x,data,sidefood_list)


#####################################
# star distribution on different cities

table(data$city)
star_madison=data$stars_x[which(data$city=="Madison")]
boxplot(star_madison)
hist(star_madison,freq = T)
b=table(star_madison)
barplot(b)









