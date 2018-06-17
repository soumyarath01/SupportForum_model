getwd()

install.packages("ROAuth")
install.packages("plyr")
install.packages("dplyr")
install.packages("stringr")
install.packages("ggplot2")
install.packages("httr")
install.packages("SnowballC")
install.packages("tmap")
install.packages("tm")
install.packages("devtools")
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


androiddata <-read.csv("skype_android.csv")

androidCorpus <- Corpus(VectorSource(androiddata$pageFunctionResult.question))

androidCorpus <- tm_map(androidCorpus, PlainTextDocument)

androidCorpus <- tm_map(androidCorpus, removePunctuation)

androidCorpus <- tm_map(androidCorpus, removeWords, stopwords (kind = "en"))

androidCorpus <- tm_map(androidCorpus, stemDocument)







