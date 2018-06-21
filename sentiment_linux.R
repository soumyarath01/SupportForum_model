

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


linuxdata <-read.csv("skype_linux.csv")

linuxtext <- Corpus(VectorSource(linuxdata$pageFunctionResult.question))

linuxtext <- tm_map(linuxtext, PlainTextDocument)

linuxtext <- tm_map(linuxtext, removePunctuation)

linuxtext <- tm_map(linuxtext, removeWords, stopwords (kind = "en"))

linuxtext <- tm_map(linuxtext, stemDocument)


#linuxtext <-read.csv("skype_linux.csv")

print(linuxtext)

questions_linux<-iconv(linuxtext$pageFunctionResult.question, to='utf-8-mac')

s3<- get_nrc_sentiment(questions_linux)

head(s3)

#Barplot of sentiment 
barplot(colSums(s3),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment scores for questions on skype linux')

print(colSums(s3))

mean(colSums(s3))

summary(colSums(s3))

str(s3)