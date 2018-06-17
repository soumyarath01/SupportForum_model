#preparing the data
data_overall <- read.csv("sentiment_of_skype_overall.csv")

str(data_overall)

data_overall$ratingf <- factor(data_overall$rating)

data_overall$out <-relevel(data_overall$ratingf, ref = "1")

#regression model

install.packages("nnet")

library(nnet)
 
mymodel<- multinom(out~anger+anticipation+disgust+fear+joy+sadness+surprise+trust+negative+positive+mean, data = data_overall)

summary(mymodel)

#predict only based on rating

predict(mymodel, data_overall)

#prediction based on probability

predict(mymodel, data_overall, type = "prob")

#predict for only some skype components

predict(mymodel,data_overall[c(3, 100, 400),],type = "prob")

#misclassification between the regression model and the real data
cm <- table(predict(mymodel), data_overall$ratingf)

print(cm)

#misclassification percentage
1-sum(diag(cm))/sum(cm)

#2-tailed z test(in order to find out which variable is contributing more for ratinge )
z<-summary(mymodel)$coefficients/summary(mymodel)$standard.errors

p<- (1 - pnorm(abs(z),0, 1))* 2

p
