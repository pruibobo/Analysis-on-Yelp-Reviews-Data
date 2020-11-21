library(tidytext)
library(dplyr)
library(data.table)

word_frec=read.csv('../data/word_freq.csv')
colnames(word_frec)=c('word','freq')
data=fread('../data/steak_cleaned.csv')

#######################
hist(data$stars_x[data$salad==1],breaks=c(0:5),freq = F,xlab = 'Stars',ylab = 'Freq',main = 'Salad')

steak_list=c('Filet','Ribeye','Strip','Sirloin','Porterhouse','Tomahawk','Skirt','Flank','hanger','round','cube')
steak_list=tolower(steak_list)

word_frec %>% 
  filter(word %in% steak_list)

wordList=steak_list
col_wordnet = colnames(data)
par(mfrow=c(2,6))
for(i in 1:length(wordList)){
  ind=which(col_wordnet==wordList[i])
  print(paste(wordList[i],ind))
  hist(data$stars_x[data[,..ind]==1],breaks=c(0:5),freq = F,xaxt = "n",xlab = 'Stars',ylab = 'Freq',main = wordList[i],ylim = c(0,0.6))
  
}

