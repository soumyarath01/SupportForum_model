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


webdata <-read.csv("finalskype.csv")

webtext <- Corpus(VectorSource(webdata$pageFunctionResult.question))

webtext <- tm_map(webtext, PlainTextDocument)

webtext <- tm_map(webtext, removePunctuation)

webtext <- tm_map(webtext, removeWords, stopwords (kind = "en"))

webtext <- tm_map(webtext, stemDocument)


#sentiment analysis



print(webtext)

questions_web<-iconv(webtext$pageFunctionResult.question, to='utf-8-mac')

s<- get_nrc_sentiment(questions_web)

head(s)

#Barplot of sentiment for skype_web
barplot(colSums(s),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype Web')

print(colSums(s))

mean(colSums(s))