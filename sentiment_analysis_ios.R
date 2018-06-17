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

iostext <-read.csv("skype_ios.csv")

print(iostext)

questions_ios<-iconv(iostext$pageFunctionResult.question, to='utf-8-mac')

s2<- get_nrc_sentiment(questions_ios)

head(s2)

#Barplot of sentiment 
barplot(colSums(s2),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype ios')

print(colSums(s2))

mean(colSums(s2))