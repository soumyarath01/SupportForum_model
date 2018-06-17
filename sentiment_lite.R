

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


litetext <-read.csv("skype_lite.csv")

print(litetext)

questions_lite<-iconv(litetext$pageFunctionResult.question, to='utf-8-mac')

s4<- get_nrc_sentiment(questions_lite)

head(s4)

#Barplot of sentiment 
barplot(colSums(s4),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype lite')

print(colSums(s4))
mean(colSums(s4))