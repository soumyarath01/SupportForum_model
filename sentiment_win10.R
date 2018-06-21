

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

win10data <-read.csv("skype_window10.csv")

win10text <- Corpus(VectorSource(win10data$pageFunctionResult.question))

win10text <- tm_map(win10text, PlainTextDocument)

win10text <- tm_map(win10text, removePunctuation)

win10text <- tm_map(win10text, removeWords, stopwords (kind = "en"))

win10text <- tm_map(win10text, stemDocument)


#sentiment analysis



print(win10text)

questions_win10<-iconv(win10text$pageFunctionResult.question, to='utf-8-mac')

s7<- get_nrc_sentiment(questions_win10)

head(s7)

#Barplot of sentiment
barplot(colSums(s7),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype windows 10')

print(colSums(s7))

mean(colSums(s7))