

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

windeskdata <-read.csv("skype_windesk.csv")

windesktext <- Corpus(VectorSource(windeskdata$pageFunctionResult.question))

windesktext <- tm_map(windesktext, PlainTextDocument)

windesktext <- tm_map(windesktext, removePunctuation)

windesktext <- tm_map(windesktext, removeWords, stopwords (kind = "en"))

windesktext <- tm_map(windesktext, stemDocument)


#sentiment analysis



print(windesktext)

questions_windesk<-iconv(windesktext$pageFunctionResult.question, to='utf-8-mac')

s6<- get_nrc_sentiment(questions_windesk)

head(s6)

#Barplot of sentiment for skype_web
barplot(colSums(s6),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype windows desktop')

print(colSums(s6))

mean(colSums(s6))

#mean median and other quadrant scores
summary(colSums(s6))
