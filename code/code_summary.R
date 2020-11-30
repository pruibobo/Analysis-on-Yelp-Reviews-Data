library(data.table)

data=fread('../data/steak_cleaned.csv')

# function for ploting star frequency in each word 
plotWordStar <- function(stars,DTM,wordList,mfrow = c(4,4)) {
  par(mfrow = mfrow)
  col_DTM = colnames(DTM)
  DTM=as.data.frame(DTM)
  for(i in 1:length(wordList)) {
    index = which(col_DTM == wordList[i])
    if(length(index) == 0) {
      warning(paste(wordList[i],"not detected"))
      next}
    dtm_vec = DTM[,index]
    my_star=stars[which(dtm_vec>0)]
    barplot(table(my_star)/length(my_star),main=wordList[i],xlab="Stars (1 -> 5)",ylab="Star Distribution")
  }
  par(mfrow = c(1,1))
}


##############################################################################
# sanity check
mylist=c("bad","worst","awful",
         "mediocre","average","ordinary",
         "fantastic","excellent","wonderful")
plotWordStar(data$stars_x,data,mylist,c(3,3))

##############################################################################
# Different Types of Steak
steak_list=c('Filet','Ribeye','Strip','Sirloin',
             'Porterhouse','Tomahawk','Skirt','Flank',
             'hanger','round','cube')
steak_list=tolower(steak_list)
plotWordStar(data$stars_x,data,steak_list,c(3,4))

##############################################################################
# Different Types of other food
sidefood_list=c("salad","egg","cheese","potato",
                "chicken","sushi","burger","bread",
                "dessert","shrimp","wine","beer",
                "sandwich","lobster","cake","salmon")
plotWordStar(data$stars_x,data,sidefood_list)

##############################################################################
# Influence of Non-food Items
non_food_list=c("service","time","dinner","menu",
                "price","wait","staff","friendly",
                "friend","atmosphere","recommend","location",
                "party","birthday","parking","reservation")
plotWordStar(data$stars_x,data,non_food_list)

# Influence of Non-food Items
mylist2=c("time","back","dinner","night",
          "lunch","husband","wife","family",
          "evening","madison","brunch","rice",
          "sunday","boyfriend","girlfriend","ambiance")
plotWordStar(data$stars_x,data,mylist2)

##############################################################################################################
boxplot(data$stars_x[which(data$city=="Akron")],data$stars_x[which(data$city=="Champaign")],
        data$stars_x[which(data$city=="Cleveland")],data$stars_x[which(data$city=="Madison")])

summary(data$stars_x[which(data$city=="Akron")])
summary(data$stars_x[which(data$city=="Champaign")])
summary(data$stars_x[which(data$city=="Cleveland")])
summary(data$stars_x[which(data$city=="Madison")])

# # word cloud plot
# mytext=data$text
# a=table(mytext)
# 
# wordcloud2(a,shape = "star")

