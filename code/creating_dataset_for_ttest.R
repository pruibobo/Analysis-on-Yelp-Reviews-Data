#code for creating dateset for t-test

library(rjson)
path <- "../data/business_city.json"
c <- file(path, "r")
l <- readLines(c, -1L)
json <- lapply(X=l, fromJSON)
data=json

data[[1]]
#single store attributes
data[[7]][12]
#tide the attributes
res_name=data.frame(data[[7]][2])
tmp=t(data.frame(data[[7]][[12]]))

data1=data.frame()

for (i in 1:length(data)) {
  res_name=data.frame(data[[i]][2]) #store name
  tmp=t(data.frame(data[[i]][[12]]))#attributes and level
  stars=t(data.frame(data[[i]][[9]]))#stars
  categ=t(data.frame(data[[i]][[13]])) #category
  if (!length(tmp)==0){
    tmp2=cbind(res_name,stars,rownames(tmp),tmp,categ)
    data1=rbind(data1,tmp2)
    print(i)
  } 
  else { next }
}

data2=data1 %>% 
  filter(grepl('steak|Steak|STEAK',categ)) # select the ones related to steak

colnames(data2)=c('restaurant','stars','attribute','level','category')

write.csv(data2,'attributes_data_for_ttest.csv')


####check overall steak stars
rm(list = ls())
library(dplyr)

data=read.csv('../data/attributes_data_for_ttest.csv')
data2=data %>% 
  group_by(restaurant,stars) %>% 
  summarise(n=n()) %>% 
  select(restaurant,stars)

hist(data2$stars,main = 'Steak restaurant stars histgram',breaks=c(0:5),freq = F,xaxt = "n",xlab = 'Stars',ylab = 'Freq',ylim = c(0,0.6))

####conduct t-test
p=c()

##RestaurantsReservations
data3=data %>% 
  filter(attribute=='RestaurantsReservations') %>% 
  filter(!level=='None')

table(data3$level)

t <- subset(data3, level == "True")
f <- subset(data3, level == "False")
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = FALSE,alternative = 'greater')
p=c(p,t.test(t$stars, f$stars, var.equal = FALSE,alternative = 'greater')$p.value)
#significant

##NoiseLevel
data3=data %>% 
  filter(attribute=='NoiseLevel') %>% 
  filter(!level=='None')

table(data3$level)

t <- subset(data3, grepl('quiet',level))
f <- subset(data3, !grepl('quiet',level))
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')$p.value)
#not significant


##RestaurantsAttire
data3=data %>% 
  filter(attribute=='RestaurantsAttire') %>% 
  filter(!level=='None')

table(data3$level)

t <- subset(data3, !grepl('casual',level))
f <- subset(data3, grepl('casual',level))
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')$p.value)
#significant 

##WiFi
data3=data %>% 
  filter(attribute=='WiFi') #%>% 
#  filter(!level=='None')

table(data3$level)

t <- subset(data3, grepl('free',level))
f <- subset(data3, !grepl('free',level))
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')$p.value)
#not significant

##OutdoorSeating
data3=data %>% 
  filter(attribute=='OutdoorSeating') #%>% 
  #  filter(!level=='None')
  
table(data3$level)

t <- subset(data3, grepl('True',level))
f <- subset(data3, !grepl('True',level))
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')$p.value)
#significant


##RestaurantsDelivery
data3=data %>% 
  filter(attribute=='RestaurantsDelivery') %>% 
  filter(!level=='None')

table(data3$level)

t <- subset(data3, grepl('True',level))
f <- subset(data3, !grepl('True',level))
var.test(t$stars, f$stars)
t.test(f$stars, t$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(f$stars, t$stars, var.equal = TRUE,alternative = 'greater')$p.value)
# significant

##RestaurantsGoodForGroups
data3=data %>% 
  filter(attribute=='RestaurantsGoodForGroups') %>% 
  filter(!level=='None')

table(data3$level)

t <- subset(data3, grepl('True',level))
f <- subset(data3, !grepl('True',level))
var.test(t$stars, f$stars)
t.test(t$stars, f$stars, var.equal = TRUE,alternative = 'greater')
p=c(p,t.test(f$stars, t$stars, var.equal = TRUE,alternative = 'greater')$p.value)
#not significant
p=format(p, scientific = FALSE)
attribute=c("RestaurantsReservations","NoiseLevel","RestaurantsAttire","WiFi","OutdoorSeating","RestaurantsDelivery","RestaurantsGoodForGroups")
pvalue_ttest=data.frame(attribute,p.value=p)
