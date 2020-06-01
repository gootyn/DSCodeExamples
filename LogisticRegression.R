options(max.print=20000)
options(scipen = 999)
#=====================

df<-read.csv('/Users/Edureka/Customer_Churn.csv')
View(df)
str(df)
#dataset has null values - check
apply(is.na(df),2,sum)
#replace NA with mean value of Total Charges
df$TotalCharges[is.na(df$TotalCharges)]<-mean(df$TotalCharges,na.rm = TRUE)

library(caTools)
set.seed(1234)
split_tag<-sample.split(df$Churn,SplitRatio=0.8)
trainlg<-subset(df,split_tag==TRUE)
testlg<-subset(df,split_tag==FALSE)
nrow(df)
nrow(trainlg)
nrow(testlg)
# Generic Linear Model - Logistic Regression - lm for linear regression
model_lg<-glm(Churn~MonthlyCharges, data=trainlg,family='binomial')
summary(model_lg)

model_lg2<-glm(Churn~MonthlyCharges+TotalCharges+tenure,data=trainlg,family='binomial')
summary(model_lg2)

model_lg3<-glm(Churn~MonthlyCharges+tenure+Contract+PaymentMethod,data=trainlg,family='binomial')
summary(model_lg3)

paste(model_lg$aic,model_lg2$aic,model_lg3$aic, sep=',')

predict(model_lg,newdata=testlg,type='response')->pred_lg
pred_lg
range(pred_lg)

table(testlg$Churn,pred_lg>0.2) ->acc1
acc1

#cut off value - to see >0.2 or 20% is churn=yes <20% = churn= No
#TP - #acutal value in the test dataset is true/yes/1 and predicted value from pred_lg is also yes/true/1
#TN - actual value in the test is false/no/0 and predicted value from pred_lg is also false/no/0
#FP - actual value in test is Yes/true/0 but your predicted value is false/0/no
#FN - actual value in test is no/false/0 but predicted value true/1/yes

#(TP+TN)/(TP+TN+FP+FN)=> ACCURACY
(319+324)/(319+324+716+50)->pred_acc1
pred_acc1
#accuracy of my model_lg1 is 45%

predict(model_lg2,newdata=testlg,type='response')->pred_lg2
#pred_lg2
range(pred_lg2)

table(testlg$Churn,pred_lg2>0.5) ->acc2
acc2
(946+161)/(946+161+89+213)->pred_acc2
pred_acc2

#accuracy of my model_lg2 is 78.5%

predict(model_lg3,newdata=testlg,type='response')->pred_lg3
#pred_lg3
range(pred_lg3)

table(testlg$Churn,pred_lg3>0.26) ->acc3
acc3
(899+202)/(899+202+136+172)->pred_acc3
pred_acc3

(720+307)/(720+307+315+67)
#accuracy of my model_lg3 is 78.1%
#install.packages('ROCR')
library(ROCR)
prediction(pred_lg,testlg$Churn) ->pred_log
performance(pred_log, measure = "tpr", x.measure = 'fpr')->acc_log
plot(acc_log, colorize  = T,main="ROC Curve")
abline(a=0,b=1)
plot(acc_log, colorize  = T,print.cutoffs.at=seq(0.1, by=0.1),text.adj = c(-0.2,1.8))
performance(pred_log,measure='acc')->acc_roc
plot(acc_roc, main='Area Under the Curve')

prediction(pred_lg2,testlg$Churn) ->pred_log2
performance(pred_log2, measure = "tpr", x.measure = 'fpr')->acc_log2
plot(acc_log2, colorize  = T,main="ROC Curve")
abline(a=0,b=1)
plot(acc_log2, colorize  = T,print.cutoffs.at=seq(0.1, by=0.1),text.adj = c(-0.2,1.8))
performance(pred_log2,measure='acc')->acc_roc2
plot(acc_roc2, main='Area Under the Curve')

prediction(pred_lg3,testlg$Churn) ->pred_log3
performance(pred_log3, measure = "tpr", x.measure = 'fpr')->acc_log3
plot(acc_log3, colorize  = T,main="ROC Curve")
abline(a=0,b=1)
plot(acc_log3, colorize  = T,print.cutoffs.at=seq(0.1, by=0.1),text.adj = c(-0.2,1.8))
performance(pred_log3,measure='acc')->acc_roc3
plot(acc_roc3, main='Area Under the Curve')

library(caret)

predicted.classes <- ifelse(pred_lg2 >=0.5, "Yes", "No")
predicted.classes<-as.factor(predicted.classes)
predicted.classes
pred_lg2

confusionMatrix(predicted.classes,testlg$Churn)->cm
cm$table
cm
predicted.classes2 <- ifelse(pred_lg2 >=0.6, "Yes", "No")
predicted.classes2<-as.factor(predicted.classes2)
predicted.classes2
confusionMatrix(predicted.classes2,testlg$Churn)->cm2
cm2$table
cm2
predicted.classes3 <- ifelse(pred_lg3 >=0.39, "Yes", "No")
predicted.classes3<-as.factor(predicted.classes3)
predicted.classes3
confusionMatrix(predicted.classes3,testlg$Churn)->cm3
cm3$table
cm3

cm$overall
cm2$overall
cm3$overall

#============================




library(pROC)
roc1 <- roc(testlg$Churn, pred_lg)
roc2 <- roc(testlg$Churn, pred_lg2)
roc3 <- roc(testlg$Churn, pred_lg3)
auc(roc1)
auc(roc2)
auc(roc2)
