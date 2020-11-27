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
