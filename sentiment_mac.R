

# install.packages("Rstem")
# install.packages("sentimentr")
# install.packages(file.choose(), repos = NULL, type="source")
# 
# class_emo = classify_emotion(webtext$pageFunctionResult.question, algorithm = "bayes",prior = 1.0)

# install.packages("syuzhet")
# install.packages("lubridate")
# install.packages("scales")
# install.packages("reshape2")

library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(SnowballC)
library(tm)
library(tmap)
library(lubridate)
library(scales)
library(reshape2)
# library(ROAuth)
# library(plyr)
# library(dplyr)
library(ggplot2)
library(httr)
library(syuzhet)
library(SnowballC)
# library(tm)
# library(tmap)
library(RTextTools)
library(slam)

#preprocessing data

macdata <-read.csv("skype_mac.csv")

mactext <- Corpus(VectorSource(macdata$pageFunctionResult.question))

mactext <- tm_map(mactext, PlainTextDocument)

mactext <- tm_map(mactext, removePunctuation)

mactext <- tm_map(mactext, removeWords, stopwords (kind = "en"))

mactext <- tm_map(mactext, stemDocument)


#sentiment analysis



print(mactext)

questions_mac<-iconv(mactext$pageFunctionResult.question, to='utf-8-mac')

s5<- get_nrc_sentiment(questions_mac)

head(s5)

#Barplot of sentiment score
barplot(colSums(s5),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype mac')

print(colSums(s5))

mean(colSums(s5))