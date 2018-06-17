

# install.packages("Rstem")
# install.packages("sentimentr")
# install.packages(file.choose(), repos = NULL, type="source")
# 
# class_emo = classify_emotion(webtext$pageFunctionResult.question, algorithm = "bayes",prior = 1.0)

# install.packages("syuzhet")
# install.packages("lubridate")
# install.packages("scales")
# install.packages("reshape2")

library(lubridate)
library(scales)
library(reshape2)
library(ROAuth)
library(plyr)
library(dplyr)
library(ggplot2)
library(httr)
library(syuzhet)
library(SnowballC)
library(tm)
library(tmap)
library(RTextTools)
library(slam)


xboxtext <-read.csv("skype_xbox.csv")

print(xboxtext)

questions_xbox<-iconv(xboxtext$pageFunctionResult.question, to='utf-8-mac')

s8<- get_nrc_sentiment(questions_xbox)

head(s8)

#Barplot of sentiment 
barplot(colSums(s8),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype xbox')

print(colSums(s8))

mean(colSums(s8))