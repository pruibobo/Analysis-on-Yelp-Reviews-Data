library(data.table)
library(corrplot)

data=fread('../data/steak_cleaned.csv')

# function for plotting star frequency in each word 
plotWordStar <- function(stars,DTM,wordList) {
  col_DTM = colnames(DTM)
  DTM=as.data.frame(DTM)
  for(i in 1:length(wordList)) {
    index = which(col_DTM == wordList[i])
    if(length(index) == 0) {
      warning(paste(wordList[i],"not detected"))
      next}
    dtm_vec = DTM[,index]
    my_star=stars[which(dtm_vec>0)]
    my_cor=cor(stars,dtm_vec)
    my_cor=round(my_cor,4)
    png(paste0(wordList[i],".png"))
    barplot(table(my_star)/length(my_star),main=paste0(wordList[i],"\n corr=",my_cor),xlab="Stars (1 -> 5)",ylab="Star Frequency",cex.lab = 1.5,cex.main=2)
    dev.off()
  }
}


##############################################################################
# sanity check
mylist=c("bad","worst","awful",
         "mediocre","average","ordinary",
         "fantastic","excellent","wonderful")
plotWordStar(data$stars_x,data,mylist)

##############################################################################
# Different Types of Steak
steak_list=c('Filet','Ribeye','Sirloin','Porterhouse',
             'Tomahawk','hanger','round','cube',"flank",
             "skirt","strip")
steak_list=tolower(steak_list)
plotWordStar(data$stars_x,data,steak_list)

##############################################################################
# Different Types of other food
sidefood_list=c("salad","egg","cheese","potato","sushi","burger","bread",
                "dessert","shrimp","beer","sandwich","lobster","cake","salmon")
plotWordStar(data$stars_x,data,sidefood_list)

##############################################################################
# Influence of meal time
non_food_list=c("lunch","dinner","brunch","breakfast")
plotWordStar(data$stars_x,data,non_food_list)

# environmental factors

mylist3=c("service","time","price","staff","friendly","friend","atmosphere","parking","reservation",
          "ambiance","wait","recommend","party","back")
plotWordStar(data$stars_x,data,mylist3)

