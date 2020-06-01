# PCA - Demo
computer_data
str(computer_data)
install.packages('dummies')
library(dummies)
#new_df<-dummy.data.frame(computer_data,names=c('cd','multi','premium'))
View(new_df)
computer_data$cd<-as.numeric(as.factor(computer_data$cd))
computer_data$multi<-as.numeric(as.factor(computer_data$multi))
computer_data$premium<-as.numeric(as.factor(computer_data$premium))
computer_data$ram<-as.numeric(as.factor(computer_data$ram))
sample.split(computer_data$price, SplitRatio = 0.75)->split_tag

train<-subset(computer_data,split_tag==T)
test<-subset(computer_data,split_tag==F)
View(train)
pca_comp<-prcomp(train,scale. = T)

names(pca_comp)
pca_comp$center
pca_comp$rotation
pca_comp$rotation[1:5,1:4]
dim(pca_comp$rotation)
biplot(pca_comp,scale=0)
std_dev<-pca_comp$sdev
pca_var<-std_dev^2
pca_var
prop_var<-pca_var/sum(pca_var)
prop_var
plot(prop_var, xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     type = "b")
plot(cumsum(prop_var), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     type = "b")
train.data<-data.frame(price=train$price,pca_comp$x)
View(train.data)
train.data<-train.data[,c(1:9)]
View(train.data)
test.data <- predict(pca_comp, newdata = test)
class(test.data)
test.data <- as.data.frame(test.data)
View(test.data)
test.data<-test.data[,c(1:9)]
pca_model<-lm(price~.,data=train.data)
summary(pca_model)
predict(pca_model,newdata=test.data)->pca_predict

plot(test$price,type='l',col='blue')
lines(test$predicted_price,col='yellow')
predicted_price<-pca_predict
cbind(predicted_price,test)->test
View(test)
#RMSE(test$predicted_price,test$price)

rmse=sqrt(mean((test$price-predicted_price)^2))
rmse

library(caret)
createDataPartition(computer_data$price,p=0.7,list=F)->ind
traincomp<-computer_data[ind,]
testcomp<-computer_data[-ind,]
lm(price~.,data=traincomp)->lm_comp_model
summary(lm_comp_model)
predict(lm_comp_model,newdata=testcomp)->comp_predict
rmse=sqrt(mean((testcomp$price-comp_predict)^2))
rmse
