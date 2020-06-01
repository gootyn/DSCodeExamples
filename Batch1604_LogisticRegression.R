
# Classification - ML 
# 6 classfiction techniques -
# Logistic Regression 
# DT
# RF
# KNN
# Naive Bayes
# SVM 

#Probability - 
score<-c(10,20,39,45,57,73,22,109,95,49)
result<-c(0,0,0,0,1,1,1,1,1,0)   
1,0,1

plot(score,result)

#generic linear model
glm(result~score,family='binomial')->lg_model

#classificaiton - 0.05, this is loss/No/0, 0.95 is for yes/win/1
# 
summary(lg_model)

#abline(score,lg_model$fitted.values)

lg_model$fitted.values
result

score<-c(15,28,32,47,68,18,87,93,44,89) # testing
result<-c(0,1,0,0,1,0,1,1,0,1)
predict(lg_model,newdata=as.data.frame(score),type='response')->lg_predict
lg_predict

#win/loss - 1/0 - 12 runs - result - loss/0 

#0<y<1 - result of logistic regression

#13th May 2020

#10over - 2nd innings - chance team batting 2nd winning is 67% - 25% - 8%

unique(result) - 
  
  0 is 1st category
1 is a 2nd category

#come up with a threshold value to decide the class of the predictions

model
#summary of model - R squared value 0.76 - 76%
predicted
predictions
accuracy - ? how accurate is my model?
  
  #confusion matrix - 
  
  # you ask for directions with a person on a street new to you. 
  1. giving a route/ Yes  - TRUE POSITIVE - YES/YES
2. not giving a route/No - TRUE NEGATIVE - NO/NO
3. 1st error - he does not know the route but stills gives the route  - NO/YES -TYPE1 error - FALSE POSITIVE
4. 2nd error - he gives a wrong direction - Yes/No - false negative - TYPE 2 Error

1,1, 1,0, 0,1, 0,0

[YES,YES],  [NO,NO],  [NO, YES], [YES,NO]

table(result,lg_predict>0.6)

(tp+tn)/(tp+tn+fp+fn)

(1+2)/(3+2)
result
lg_predict  
score


sensitivity - TPR - true positive rate - recall- health care datasets than accuracy 
specitify - FPR - flase positive rate

precision()

formulae - 
  
  how to get the right threshold value - ROC  - AUC 

library(caret)
ifelse(lg_predict>0.75,1,0)->lg_pred_updated
confusionMatrix(factor(result),factor(lg_pred_updated))

#14th May 2020
yes,no, maybe,

sunny,rainy,windy-> target

#sensitivity/Recall/TPR - TP/TP+FN
#specificity/FPR - TN/TN+FP 
#Precision - TP/TP+FP

TARGET -  100 datapoints  - 65 yes, 35 No - actual values
prediction - 100 datapoints - 47 yes, 25 No - prediction, rest 28 cases willbe
  either FP or FN  - 16 -FP,  12 -FN
  
#ROC - Reciever Operator Characterstic - 

plot/graph plotted between TPR and FPR - 

install.packages('ROCR')
install.packages('pROC')

library(ROCR)
prediction(lg_predict,result)->acc_log
performance(acc_log,'tpr','fpr')->acc_roc
plot(acc_roc,colorize=T,text.adj=c(-0.2,1.9),print.cutoffs.at=seq(0.1,by=0.1))

#AUC - area under curve - 
roc(lg_pred_updated,result)->demo_roc
auc(demo_roc)
