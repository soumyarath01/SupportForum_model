# install.packages("Rstem")
# install.packages("sentimentr")
# install.packages(file.choose(), repos = NULL, type="source")
# 
# class_emo = classify_emotion(webtext$pageFunctionResult.question, algorithm = "bayes",prior = 1.0)

# install.packages("syuzhet")
# install.packages("lubridate")
# install.packages("scales")
# install.packages("reshape2")
getwd()

# install.packages("ROAuth")
# install.packages("plyr")
# install.packages("dplyr")
# install.packages("stringr")
# install.packages("ggplot2")
# install.packages("httr")
# install.packages("SnowballC")
# install.packages("tmap")
# install.packages("tm")
#install.packages("devtools")
# devtools::install_github('okugami79/sentiment140')

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


androiddata <-read.csv("skype_android.csv")

androidtext <- Corpus(VectorSource(androiddata$pageFunctionResult.question))

androidtext <- tm_map(androidtext, PlainTextDocument)

androidtext <- tm_map(androidtext, removePunctuation)

androidtext <- tm_map(androidtext, removeWords, stopwords (kind = "en"))

androidtext <- tm_map(androidtext, stemDocument)

# androidtext <-read.csv("skype_android.csv")


# sentiment analysis
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

