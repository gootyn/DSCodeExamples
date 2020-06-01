
setwd('/Users/Edureka')
read.table('adult.data',sep=',',header=F)->adult
names(adult)<-c("age","workclass","fnlwgt","education","educationnum","maritalstatus","occupation","relationship","race","sex","capitalgain","capitalloss","hoursperweek","nativecountry","Income")
dim(adult)
str(adult)
prop.table(table(adult$Income))
library(DMwR)
SMOTE(Income~., data=adult,perc.over=1000,perc.under = 100)->adult.new

table(adult.new$Income)
head(adult.new$Income)
unique(adult.new$Income)

str(adult.new)
adult.orig<-adult.new
sapply(adult.new,is.factor)->ind
ind
lapply(adult.new[ind],function (x) as.numeric(as.factor(x)))->adult.new[ind]
dim(adult.new)
#scale(adult.new)->adult.new #standardization
#as.data.frame(adult.new)->adult.new
library(caret)
createDataPartition(adult.new$Income,p=0.60,list=F)->index
trainset<-adult.new[index,]
testset<-adult.new[-index,]
dim(trainset)

train_target<-trainset[,15]
test_target<-testset[,15]
#trainset<-trainset[,-15]
#testset<-testset[,-15]

#PCA 
prcomp(trainset[,-15],scale=T)->adult.pca
summary(adult.pca)
screeplot(adult.pca)
screeplot(adult.pca, npcs = 24, type = "lines")
predict(adult.pca,newdata=testset[,-15])->adult.pca.test
train.data<-data.frame(Income=as.factor(train_target),adult.pca$x[,(1:3)])
test.data<-data.frame(Income=as.factor(test_target),adult.pca.test[,(1:3)])

str(train.data)
dim(train.data)
dim(test.data)

View(train.data)

glm(Income~., data=train.data,family='binomial')->glm_pca.data

summary(glm_pca.data)
predict(glm_pca.data,newdata=test.data,type='response')->glm_pca.data.predict
glm_pca.data.predict
predicted_value_glm_pca<-ifelse(glm_pca.data.predict>0.6,'1','2')
predicted_value_glm_pca<-as.factor(predicted_value_glm_pca)
str(test.data$Income)
str(predicted_value_glm_pca)
confusionMatrix(factor(predicted_value_glm_pca),factor(test.data$Income))


View(trainset)
trainset$Income<-as.factor(trainset$Income)
testset$Income<-as.factor(testset$Income)
str(testset)
str(trainset)
glm(Income~., data=trainset,family='binomial')->glm_normal
summary(glm_normal)
predict(glm_normal,newdata=test,type='response')->glm_normal_predict
glm_normal_predict

predicted_value_glm<-ifelse(glm_normal_predict>0.6,' <=50K',' >50K')
predicted_value_glm<-as.factor(predicted_value_glm)
confusionMatrix(factor(predicted_value_glm),factor(test$Income))

str(predicted_value_glm)
str(test$Income)
factor(glm_normal_predict)
factor(train$Income)
predict(glm_adult,newdata=test.data,type='response')->glm_adult_predcit
library(caret)
confusionMatrix(as.numeric(factor(glm_adult_predcit)),as.numeric(factor(test.data$Income)))
predicted_value_glm<-as.numeric(factor(glm_adult_predcit))
actual_value_glm<-as.numeric(factor(test.data$Income))
View(glm_adult_predcit)

confusionMatrix(predicted_value_glm,actual_value_glm)


trcontrol<-trainControl(method = "loocv",number = 10,repeats = 10,preProcOptions = c('centre','scale'))
train(factor(Income)~.,data=trainset,method='glm',trControl=trcontrol)->glm_model
train(factor(Income)~.,data=trainset,method='rpart')->rpart_model
train(factor(Income)~., data=trainset,method='rf',verbose=F)->rf_model
train(factor(Income)~.,data=trainset,method='knn')->knn_model
train(factor(Income)~.,data=trainset,method='nb')->nb_model
train(factor(Income)~.,data=trainset,method='svmLinear')->svm_model

summary(glm_model)



model.out<-data.frame('Model'=c('Logistic Regression','Decision Tree','RandomForest',
                                'KNN','Naive Bayes','SVM Linear'),
                      'Accuracy'=c(round(max(head(glm_model$results)$Accuracy), 5),
                                   round(max(head(rpart_model$results)$Accuracy), 5),
                                   NA,#round(max(head(rf_model$results)$Accuracy), 5),
                                   NA,#round(max(head(knn_model$results)$Accuracy), 5),
                                   NA,#round(max(head(nb_model$results)$Accuracy), 5),
                                   NA#round(max(head(svm_model$results)$Accuracy), 5)
                                   ))
model.out                                   
                      
str(adult.new)

glm_model

rpart_model

