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

androidtext <-read.csv("skype_android.csv")

print(androidtext)

questions_android<-iconv(androidtext$pageFunctionResult.question, to='utf-8-mac')

s1<- get_nrc_sentiment(questions_android)

head(s1)

#Barplot of sentiment for skype_web
barplot(colSums(s1),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype android')

print(colSums(s1))

mean(colSums(s1))

