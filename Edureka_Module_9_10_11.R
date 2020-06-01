Module - 9
Linear and logistic Regression

how many of you know this equation - y=mx+c

m - stands for slope of the line - change of y/ change of x 
in the graph, draw a right angle triangle where the line cuts the y axis
show the picture. 
c - stands for y intercept- distance between center to where the line cuts y axis
Both are constants - 
  
options(max.print=20000)
options(scipen = 10)

experience<-c(1,2,3,4,5,6,7,8)
hike=c(3.5,4.75,5.3,6.8,8.4,9.2,10.4,11.7)
plot(experience,hike)

to figure out what would be hike in the next two years? 
to figure this out, we use linear regression algorithm. 

draw a line on the points showing the linear relation ship
also draw different straight lines and show unlimited lines can be drawn
the line drawn on the points are predictions or predicted values
the actual points are the ones with the past data (datapoints on the graph). 
now finding the best line is the objective which is called regression line

Let me define linear regression now. 
Linear regression will attempt to measure a correlation between your 
input data and a response variable.  
For example, you might use linear regression to see 
if there is a correlation between height and weight, 
and if so, how much – both to understand the relationship 
between the two, and predict weight if you know height.

Analysis: Linear regression can help you understand and quantify 
the relationship between your numerical data.  
In this case, quantifying how your numeric independent variable(s) 
and correlate to a numerically continuous response (dependent) variable.

Prediction: After you build your model, you can attempt to 
predict (with varying degrees of accuracy!) an output / response based 
on a given set of inputs / independent variables.

A few terms used in linear regression

Independent variable (a.k.a. explanatory, exogenous, input, predictor): 
  your observations and input data, and what linear regression is attempting 
to correlate with your dependent / output data.

Dependent variable (a.k.a. response, endogenous, output): 
  the value you are looking to measure correlation with your independent 
variable(s) and / or the value you are looking to predict.

Residuals: Sometimes called “error.”  
This is the difference between the predicted vs actual response.  
The more (relevant) independent variables you add, the more (hopefully) 
your difference between the two decreases, indicating a model with increased 
accuracy / predictive power.  

Coefficients / weights: 
represents / measures the correlation between your input (explanatory) 
and output (response) variables.

Linear regression is very good to answer the following questions:
  Is there a relationship between 2 variables?
  How strong is the relationship?
  Which variable contributes the most?
  How accurately can we estimate the effect of each variable?
  How accurately can we predict the target?
  Is the relationship linear? 
  
I got the data I have put a graph and drawn a line. what next?
what is the accuracy of the line that's drawn?'
this is calculated with some thing called RMSE (root mean squared error)
explain by drawing the lines from teh data points to the linear lines. the distance is called residual/error. 
(actual - predicted). square this and take the mean of all to get MSE. then sqrt of it will give RMSE. 

Refer to slides - for datasets
use computer_data dataset

install.packages('caTools')
library(caTools)
#to use sample.split() to split the dataset in to train and test datasets
computer<-read.csv('/Users/Edureka/Computer_Data.csv')
split_tag<-sample.split(computer$price, SplitRatio = 0.75) #- explain this

split_tag
train<-subset(computer,split_tag==TRUE)
subset(computer,split_tag==FALSE)->test
View(train)
nrow(computer)
nrow(train)
nrow(test)
names(computer)

# Do the below if lm does not work. 
#Convert categorical variables to continous. yes as 1, no as 0
price$cd<-as.numeric(as.factor(price$cd))
price$premium<-as.numeric(as.factor(price$premium))
price$multi<-as.numeric(as.factor(price$multi))
str(price)
#sqrt(mean((final_price$error)^2))
set.seed(345)
model<-lm(price~speed+hd+ram+screen+trend+cd+multi+premium,data=train)
model<-lm(price~.,data=train)
summary(model)


# explain the summary
# explain the significant codes and its imapct on prediction.
# talk about null hypothesis and alternative hypothesis
# Here null hypothesis is prices will be same or won't change

in the summary - ***, values(
  if *** are there then variable is signicant by 99.99%, ** means, 99%, * - 95% - 
    nothing means  not significant at all.

explain the summary
adjusted R square value - closer to 1 is the best prediction
p-value is the probability value - check again. 

Any questions?
  Are we clear?

Now we predict the price with test data on the model we have built

predict(model,newdata=test)->lm_predict

lm_predict

plot(test$price,col='black',type='l',lty=2.5)
lines(lm_predict,col='red', type='l',lty=1.5)
cbind(actual=test$price,predicted=lm_predict)->final_price
final_price
class(final_price)
as.data.frame(final_price)->final_price
final_price$error<-final_price$actual -final_price$predicted

View(final_price)
sqrt(mean((final_price$error)^2))

RMSE(test$price,final_price$predicted)
both ways you can calculate

model2<-lm(price~hd+ram,data=train)
predict(model2,newdata=test)->predicted2

RMSE(test$price,predicted2)

summary(model2)
summary(model)

model$assign

plot(fitted(model), resid(model))
qqnorm(resid(model))
coef(model)

# Visualize the data 
install.packages('GGally')
library(GGally)
ggpairs(train) ## It's multivaribale regaression

boxplot(as.numeric(as.factor(train$cd)))


#anova(model,model2,test='Chisq')

#Convert categorical variables to continous. yes as 1, no as 0
price$cd<-as.numeric(as.factor(price$cd))
price$premium<-as.numeric(as.factor(price$premium))
price$multi<-as.numeric(as.factor(price$multi))
str(price)
#sqrt(mean((final_price$error)^2))


#=======================

Logistic Regression

it is a regression technique where target or dependent variable is a categorical variable.
this technique is used to solve classification problems. either yes or no, male or female, 1 or 0
eg1: - temp + humidity = rain or not?

eg1: an email is a spam or not
a credit card transaction is fradulent or not


scores of virat kohli - given in x. 
team inda wins or not - given in y
x=c(10,20,39,45,55,45,74,81,90,100)
y=c(0,0,0,0,0,0,1,1,1,1)

plot(x,y)
lines(x,y)

we will use default dataset from package ISlR which has good number of entries. 10000 rows. 
This tutorial primarily leverages the Default data provided by the ISLR package. 
This is a simulated data set containing information on ten thousand customers 
such as whether the customer defaulted, is a student, 
the average balance carried by the customer and the income of the customer.



Use this dataset for logistic regression
install.packages("ISLR")
library(ISLR)
data("Default")
df<-Default
nrow(df)
library(caTools)
#to use sample.split() to split the dataset in to train and test datasets
split_tag<-sample.split(df$default, SplitRatio = 0.80) #- explain this

split_tag
train<-subset(df,split_tag==TRUE)
subset(df,split_tag==FALSE)->test
nrow(train)
nrow(test)
names(df)

generalized linear model -glm
set.seed(9999)
model1<-glm(default~balance,data=train,family = 'binomial')
summary(model1)  

# Null deviance - error in your model when no independent variable is used - pure error
# Residual deviance - error in your model when independent variable is used - error will reduce. 
always residual deviance will be less
compare with differnt models and check residual deviance is good or bad. 

plot(df$balance,df$default)
lines(df$balance,df$default)


predict(model1,newdata=test,type='response')->pred_logistic
pred_logistic

Confusion matrix - 
  explain it first
include type 1 and type 2 error - eg: cancer detection or pregnant woman

it is a performance measurement for machine learning classification problem where 
output can be two or more classes. It is a table with 4 different combinations of 
predicted and actual values.

It is extremely useful for measuring Recall, Precision, Specificity, 
Accuracy and most importantly AUC-ROC Curve.
Let’s understand TP, FP, FN, TN in terms of pregnancy analogy.

show the pregnancy picture 

True Positive:
  Interpretation: You predicted positive and it’s true.
You predicted that a woman is pregnant and she actually is.
True Negative:
  Interpretation: You predicted negative and it’s true.
You predicted that a man is not pregnant and he actually is not.
False Positive: (Type 1 Error)
Interpretation: You predicted positive and it’s false.
You predicted that a man is pregnant but he actually is not.
False Negative: (Type 2 Error)
Interpretation: You predicted negative and it’s false.
You predicted that a woman is not pregnant but she actually is.
Just Remember, We describe predicted values as Positive and Negative 
and actual values as True and False.

let us create a confusionMatrix()

table(test$default,pred_logistic>0.5) 
table(test$default,pred_logistic>0.5) ->acc1
acc1

let us get another model now

model2<-glm(default~.,data=train,family='binomial')
summary(model2)

predict(model2,newdata=test,type='response')->pred_logistic2
View(pred_logistic2)
let me have a glance of the range of probabilites a we have 2500 rows.its difficult to go through
all at once.
range(pred_logistic2)
options("scipen" = 10)  # to not display number with exponensiation  -e+02 and all
  
create a confusion matrix

now I will take the cuoff value for probabilty as 0.7
table(test$default,pred_logistic2>0.7) ->acc2
acc2

sensitivity - true positive rate
specificity - true negative rate
am taking a cut off value for probability as 0.5
table(test$default,pred_logistic2>0.5) ->acc1
acc1

Accuracy calculation - calculate accuracy for both probabilities.

(2407+23)/(2407+23+10+60) will give me accuracy

How will I know the correct cut off for probability to know the accuracy of the model.

ROC Curve - reciever operator characterstic 
  its a curve plotting false positive rate and true positive rate
i will get an idea looking at the curve about the right cut off value

library(ROCR)
There are two functions in the package i will use Here
prediction(pred_logistic2,test$default) ->pred_log
performance(pred_log, measure = "tpr", x.measure = 'fpr')->acc_log
plot(acc_log, colorize  = T)
plot(acc_log, colorize  = T,print.cutoffs.at=seq(0.1, by=0.1),text.adj = c(-0.2,1.8))

table(test$default,pred_logistic2>0.1) ->acc3
acc3

(1817+44)/(1817+44+116+23)

you can create confusionMatrix() in another way.

library(caret)
confusionMatrix(table(pred_logistic2>0.9,test$default))
predicted.classes <- ifelse(pred_logistic2 >=0.5, "Yes", "No")
predicted.classes<-as.factor(predicted.classes)
predicted.classes

library(caret)
confusionMatrix(predicted.classes,test$default)->cm
cm$table
cm


model3<-glm(default~balance+student,data=train,family='binomial')
summary(model3)
predict(model3,newdata=test,type='response')->pred_logistic3
View(pred_logistic3)
range(pred_logistic3)

create a confusion matrix again
#confusionMatrix(test$default,pred.default)
table(test$default,pred_logistic3>0.4) ->acc2
acc2
(1913+33)/(1913+20+34+33)

library(caret)
confusionMatrix(test$default,pred_logistic2) 

anova(model2,model3,test='Chisq')

class(pred_logistic2)
class(pred_logistic3)
class(pred_logistic)

library(ROCR)
prediction(pred_logistic3,test$default) ->pred_log
performance(pred_log,'acc')->acc_log
plot(acc_log)
table(test$default,pred_logistic3>0.9)
(1931+2)/(1931+2+2+65)

=============================
Module 10

ANOVA and Sentiment Analysis

Analysis of variance
show the excel sheet prepared by you. 
when you have different models/group means.
by looking at those means, can you say something or can you conclude
that the two groups are similar, same, or not same and so on. 
Here you dependent variable should be continous variable
and your independent variable should be categorical variable.names

two types
1. 1 way anova() - when the categorical independent variable is 1
2. 2 way anova() - when more than 1 independent vairables are there

#eg:
null hypothesis - all the different gear cars are same 
alternate hypothesis - its different

boxplot(mtcars$mpg~factor(mtcars$gear),xlab='gear',ylab='mpg')

now with these means, I want to find out, whether all the cars in the total population is different or not
for this,
I will do anova test here

mtcars.aov<-aov(mtcars$mpg~as.factor(mtcars$gear))
mtcars.aov
summary(mtcars.aov)

output of summary command
Df Sum Sq Mean Sq F value   Pr(>F)    
as.factor(mtcars$gear)  2  483.2  241.62    10.9 0.000295 ***
  Residuals              29  642.8   22.17                     
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

if the p value is low, then I will reject null hypothesis. 
now which one of these are different from each other. 
to find out which one is different
we have to run TukeyHSD() test - Tukey's honest significant distributed test'
this test when run on anova object will tell you which group is different

mtcars.posthoc<-TukeyHSD(mtcars.aov)
mtcars.posthoc
Tukey multiple comparisons of means
95% family-wise confidence level

Fit: aov(formula = mtcars$mpg ~ as.factor(mtcars$gear))

$`as.factor(mtcars$gear)`
diff        lwr       upr     p adj
4-3  8.426667  3.9234704 12.929863 0.0002088
5-3  5.273333 -0.7309284 11.277595 0.0937176
5-4 -3.153333 -9.3423846  3.035718 0.4295874

above matrix shows the difference of 3,4 and 5 gear cars and p values()
the p value of 5-4 is high which makes me say, I have to go with null hypothesis
which means, 5gear and 4 gear cars are similar/same
same is teh case with 5-3 gear cars
only 4-3 gear cars are different

box plot looks different but statistically proved to be differnt case
this is the importance of anova



  
dose<-read.csv('/Users/Edureka/Dosage.csv')
dose
names(dose)
aov.dose<-aov(Alertness~Dosage,data=dose)
aov.dose
summary(aov.dose)
aov.dose$fitted.values
print(model.tables(aov.dose,'means'),digit=3)

==========================
Sentiment Analysis
very brief notes/slides provided
just run through the slides 
and tell them to google for more info. 
talk about lemmatization, pos words, neg words,
stemming etc
more of NLP. 

============================
Module - 11

Decision Tree

What is decision tree?

a simple and powerful data mining technique. 
a quick intro 


library(tree)
library(caTools)

#build a decision tree on dependent variable - emp_sal
#using rpart
library(rpart)
library(C50)
data(churn)
View(churnTrain)
train<-churnTrain[,-c(1,2,3)]
test<-churnTest[,-c(1,2,3)]
View(train)
table(train$churn)
set.seed(123)
churn_tree<-rpart(churn~.,data=train)
churn_tree
summary(churn_tree)
plot(churn_tree)
text(churn_tree,all=TRUE, use.n=TRUE)
predict(churn_tree,newdata=test, type='class')->churn_predict
table(test$churn,churn_predict)
length(churn_predict)
confusionMatrix(table(churn_predict,test$churn))
(145+1428)/(145+1428+79+15)->churn_acc
churn_acc

================
Now that we have created a decision tree.
How about creating a forest of decision trees?
how would a forest of decision trees look like?

we will create multiple decision trees from the same data
and we will combine the power of individual trees 
what is teh classification made by each tree and combine together.
one decision tree may be created on 3 columns, another one created on 4 columns
and so on
each decision tree will give me a prediction. I will compare the predictions of all
the trees and I will come up the final classification. 

Let us say am creating 10 decision trees, and out of this
the 7 decision trees have the classification that customer would be churned.
and 3 says otherwise.
this means, the overall classification is customer would be churned

are you with me?
  
how do you create forest of decision trees?
you split the data into different datasets, create a decision one for each datset splitted.
which will inturn give me a prediction. and then i average or vote amongst the predictions
I got from these trees. 

This technique is called as Random Forest. also known as ensemble method
Random Forest is a very popular machine learning algorithm.
its the ensemble, its the combination of multiple decision trees

the reason random forest is better cos it uses the formula that the decision of a group
is always better than the decision of an individual. 
multiple predictions from multiple trees is always better than decision from one tree. 

are we clear on this?

Random forest improves the accuracy of teh prediction by creating large number of trees and thus
voting the best prediction

for data classification, we use decision tree and random forest.

let us do hands on 

library(randomForest)
set.seed(321)
randomForest(churn~., data=train,ntree=35)-> mod_forest1

randomForest(churn~., data=train)-> mod_forest1
no of trees specified is 35. by default it creates 500 trees

mod_forest1
importance(mod_forest1)
varImpPlot(mod_forest1)
summary(mod_forest1)
predict(mod_forest1, newdata=test, type="class")->forest_predict

confusionMatrix(table(forest_predict,test$churn))



table(test$Churn,forest_predict)
(879+321)/(879+321+931+333)

