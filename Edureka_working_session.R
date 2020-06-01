#windows - CTRL+Enter
#MAC - Command+Enter - Ctrl+Enter

#THIS IS A COMMENT

What is a package?
  
function to calculate square of a number
function name(x,y)
...
...
function to calculate square root of a number
function name()
variable.names(
  ....
  
  
There is a new package to calculate square and sqrt of numbers
10K+ package

install.packages("package_name")

caret - install package "caret"

getwd()

install.packages("dpylr")

library(caret)

Built -in function 

user defined function

mean(1:10)

mean(1:10)

seq(1:20)

max(1:50)
min(34:87)

square<-function(x){
  x*x
}

square(15)

square(100)


  
x<-55
66->y
z=88
  
x
print(x)
print(y)
print(z)
print(x,y,z) # will this work?

paste(x,y,z)
x
y
z

hold types of numbers, characters, strings, logical/Boolean values (TRUE/FALSE) 

#DataTypes
Vectors - 
lists
Matrices
DataFrames
Arrays

var1<-c(1,2,3,4,5)
vector
vector3<-c(1,TRUE,5.68)
vector2
vector3
vector4

vector5<-x
vector5
x


  
list1<-list(c(1,TRUE,5.689))

list2<-list(c('a','e','i','o','u'))
lists
list1

list3<-list(c()
list3

list3[[1]]

vector2
list3

#matrix
list3

matrix(c(1:4),ncol=2)

matrix(c(1:4),nrow=2)

mat1<-matrix(c(1:6),nrow=3)

t(mat1)



Data Frame - what is dataset and data frame? 

price<-c(1,2,3,4,5)
data<-c('Apple','Mango','Grapes','Pear','Litchi')
df<-data.frame(price,data)
df  

df<-read.csv("filename")

getwd()
setwd("directoryname wher your files are stored")

df<-read.csv("full path of the file")

df<-read.csv("/Users/Edureka/transaction_data.csv")

"c:\\users\\edureka\\datasets" - full path of your files

df<-read.csv("/Users/Edureka/transaction_data.csv")

df
View(df)

df$creditLine

df$state

order(df$creditLine)

sort(df$creditLine)


grepl('dplyr',installed.packages())

index<-order(df$creditLine)

df[index,]

df[row,col]

df[2,]

df

df[,5]

#1:3- range of numbers 1 to 3

#Note, the index in R stars from 1 not 0. 
#Python, index starts with 0

df[1:4,3:6]
df

getwd()
setwd('/Users/Edureka')
df<-read.csv('full directory path/file_name.')
View(df)
str(df)
grepl("%",df$name)
replaced_name<-sub("Bran","bran",df$name)
replaced_name

courses<-c('R Programming Python Programming','C Programming C++ Programming','Java Programming C# Programming')
gsub('Programming','Examples',courses)
str<-'This is an example string'
strsplit(str," ")


plasma<-read.csv('/Users/Edureka/Plasma.csv')
diabetes<-read.csv('/Users/Edureka/Diabetes.csv')

View(plasma)
View(diabetes)

cbind # column bind - combine on the basis of columns
#no of rows in datasets should be same. 

plasma_diabetes<-cbind(plasma,diabetes)
View(plasma_diabetes)

rbind # binding based on rows
#no of columns should be same

transaction<-read.csv('/Users/Edureka/transaction_data.csv')
hour<-read.csv('/Users/Edureka/hour_transaction.csv')
View(transaction)
View(hour)
hour_transaction<-rbind(transaction,hour)
View(hour_transaction)

colnames(hour$state)<-'State'

merge()

all_trans<-read.csv('/Users/Edureka/all_transactions.csv')
credit_data<-read.csv('/Users/Edureka/creditdata.csv')
View(all_trans)
View(credit_data)
merged_df_all<-merge(all_trans,credit_data,all=TRUE)
View(merged_df)
View(merged_df_all)

#factor data type
# do you all know what is continous variable and categorical variable?
cereal<-read.csv('cereal.csv')

gender<-c('Male','Female','Female','Male','Male','Female')

factor(gender)



victims<-readLines('victims.txt')
victims
df<-as.data.frame(victims)
df
View(df)

# grep and grepl - grepl('pattern',variable) - logical result - T/F

comments<-grepl('^%',victims) 
comments

lines<-victims[!comments]
lines

string1<-'I love Mathematics'
string1
strsplit(string1,split=" ")

splitLines<-strsplit(lines,split=',')
class(splitLines)
class(string1)
#data.frame(v2,v1)

Lines<-matrix(unlist(splitLines),nrow=length(splitLines),byrow = TRUE)
Lines

colnames(credit_data)

colnames(Lines)<-c("Name","Birth_Year","Death_Year")
Lines
titanic_victims<-as.data.frame(Lines,stringsAsFactors = FALSE)
titanic_victims
View(titanic_victims)

str(titanic_victims)

titanic_victims$Birth_Year<-as.numeric(titanic_victims$Birth_Year)
titanic_victims$Death_Year<-as.numeric(titanic_victims$Death_Year)

#Imputation - replace null values with mean or median - 
# KNN imputation
# Bayes
# Marcov chains
mean(titanic_victims$Birth_Year)

titanic_victims$Death_Year<-mean(titanic_victims$Death_Year, na.rm=TRUE)
View(titanic_victims)

#apply function

titanic_victims$Death_Year[1:4]<-NA

is.na(titanic_victims$Death_Year)

#apply(dataframe/matrix, MARGIN= 2, FUNCTION )
apply(titanic_victims,MARGIN = 2, function(x) ifelse(is.na(x),mean(x,na.rm=TRUE),x)) 

titanic_victims[is.na(titanic_victims)]<-mean(titanic_victims$Death_Year,na.rm=T)

titanic_victims

telecom_data<-read.csv('/Users/Edureka/telecomCalls.csv')  
telecom_data

apply(telecom_data,MARGIN=2,mean)

#sub, gsub, regexpr, gregexpr

var1<-c('R Programming','C Programming','Java Programming')
var1

sub('Programming','Examples',var1)

#sub('Pattern','replacement',Vector)

var2<-c('R Programming,C Programming','Java Programming,C++ Programming')
var2

sub('Programming','Examples',var2)
gsub('Programming','Examples',var2)

#regexpr, gregexpr

var3<-"12354123451234512345"

gregexpr('5',var3)

var4<-"this is an R programing course where we are learning R step by step"
gregexpr('R',var4)

data()

data(package = .packages(all.available = TRUE))

What is web scraping?
  
What is EDA - Exploratory Data Analysis? 
  
install.packages('datasets')

age<-c(12,14,17,11,15,65,3)

# Till this point, we have learned R Programmming - with or without the knowledge of statistics.
# but from now on, you really have to have some knowledge on stats - outliers 

boxplot(age)


data(mtcars)
mtcars
View(mtcars)

head(mtcars)
tail(mtcars)

str(mtcars)

summary(mtcars)

structure(mtcars)

mean(mtcars$mpg)
var(mtcars$cyl)
sd(mtcars$hp)


#correlation - ?
cor(mtcars)

install.packages('corrgram')
library(corrgram)

corrgram(mtcars)

plot(mtcars$cyl)

plot(mtcars$mpg, main="Miles per Gallon")
boxplot(mtcars$mpg)

summary(mtcars$mpg)

#=====================================

x=runif(50)
y<-runif(50)

km<-kmeans.ani(cbind(x,y))

km<-kmeans(iris,4)

str(animals)

km<-kmeans.ani(votes.repub)

data(cars)
str(cars)
kmeans.ani(cars,2)

kmeans(cars,3)
cars


df<-read.csv('016_c7_ds_v2.0.csv')
str(df)
kmeans.ani(c(df$Premiums.Paid,df$Income))
km<-kmeans(df,3)
View(df)
plot(df$Age,df$Premiums.Paid)

str(km)

data(mtcars)
km<-kmeans(mtcars,3)
kmeans.ani(mtcars,centers=4,col = 1:9)
km
mtcars

wine<-read.csv2('winequality-red.csv',header = T)

View(wine)
str(wine)
kmeans(wine,28)

sqrt(1599/2)

df2<-df[-c(81,82),]
df2

#==============================================

http://archive.ics.uci.edu/ml/index.php

data(iris)
summary(iris)
View(iris)
attach(iris)
Sepal.Length

iris$Sepal.Length
plot(iris)

plot(Sepal.Length,Sepal.Width, type='l')

plot(Sepal.Length)
plot(Species,Sepal.Width)
boxplot(Sepal.Width)
plot(Petal.Length,type='s')
?plot
barplot(Petal.Width)
pie(table(Species))
hist(Sepal.Length)
?hist()
boxplot(Sepal.Length)
rug(Sepal.Length,side=2)
par(mfrow=c(3,2))
plot(Sepal.Length)
par('mar')
par(mar=c(1,1,1,1))
boxplot(Sepal.Width)
hist(Petal.Length)
plot(Sepal.Width,type='l')
pie(table(Species))

data(iris)

plot(Sepal.Width, main = 'Sepal Width')
plot(Sepal.Width, main = 'Sepal Width',col='orange', xlab='Count',ylab='Width of Sepal')
par(bg='white')
boxplot(Petal.Length, col='orange')

install.packages('RColorBrewer')
library(RColorBrewer)
hist(Petal.Length, col=brewer.pal(5,"Set3"))

install.packages('raster')
library(raster)
alt<-getData('alt', country='IND')
plot(alt)

data()
library(tabplot)
install.packages('tabplot')
library(tabplot)
tabplot::tableplot(iris)
# read_html() - to read html files
??read_html

=============================
  
y= mx + c - equation  what is this?  
  m is the slope of the line or tan theeta
  c is y intercept

experience<-c(1,2,3,4,5,6,7,8)
hike<-c(3.5,4.85,5.3,6.2,8.4,9.2,10.4,11.7)
  
plot(experience,hike)

to predict the hike of a person at the end of 11th year?
Linear Regression. 

IDV - independent variable -  variable  - predictor
DV - dependent variable  - target
change of IDV will definitely change the vlaue of DV. 

IDV - predictor - input
DV - target - output

Residual - or error - 
  
coefficients or weights 
cor() - corelation - 
RMSE - Root Mean Square Error - as close to 0 or as minimal as possible. the accuracy of your mooffs(is that best())
multiple r square 
adjusted r square 

figure out the IDV and DV - predictors and target. predict the price of the computer

install.packages('caTools')
library(caTools)
computer<-read.csv('/Users/Edureka/Computer_Data.csv')
View(computer)

computer$cd<-as.numeric(as.factor(computer$cd))
computer$multi<-as.numeric(as.factor(computer$multi))
computer$premium<-as.numeric(as.factor(computer$premium))
split_tag<-sample.split(computer$price,SplitRatio = 0.75)
split_tag  
train<-subset(computer,split_tag==TRUE)
test<-subset(computer,split_tag==FALSE)
nrow(computer)
nrow(train)
nrow(test)
names(computer)

set.seed(5678)
lr_model<-lm(price~speed+hd+ram+screen+cd+trend, data=train)
lr_model
summary(lr_model)
cor(computer)

weights and significance might be different. - let me come back on this. 

lm_predict<-predict(lr_model,newdata=test)
length(lm_predict)
length(test$price)
plot(test$price,col='black',type='l', lty=2.5)
#lines(lm_predict,col='green',type='l',lty=.15)

lines(lm_predict,col='orange',type='l',lty=1.5)
cbind(actual=test$price,predicted_value=lm_predict)->final_price
View(final_price)
as.data.frame(final_price)->final_price
#calculate RMSE 
final_price$residual<-final_price$actual - final_price$predicted_value
sqrt(mean((final_price$residual)^2))->RMSE_value
RMSE_value

RMSE(test$price,final_price$predicted_value)

lr_model2<-lm(price~speed+hd+ram+screen+cd+trend+multi+premium+ads, data=train)
summary(lr_model2)
lr_predict<-predict(lr_model2,newdata=test)
RMSE(test$price,lr_predict)
RMSE_value



lr_model3<-lm(price~., data=train)
summary(lr_model3)

=========================================
View(computer)
Yes or No, Male or Female, 1 or 0, T or F, Active or Inactive

you are trying to solve a classification problem
temp + humidity => it will rain or it won't rain

an email in your inbox is a spam or not  - typical classification problem. 
you use Logistic Regression

runs<-c(10,20,39,45,55,45,74,81,90,100)
result<-c(0,0,0,0,0,0,1,1,1,1)
plot(runs,result)
lines(runs,result)


confusion Matrix - 

precision, - 
recall
f-ratio 
sensitivity
specifcitiy - 
TP - TN - FP - FN

(tp+tn)/(tp+tn+fp+fn)=> accuracy of logistic model 

What is churn? - attrition - or cusomters leaving your business
churn - yes - left your business or doesn't want your service. 
no - he/she still there with you. 

ANOVA - ANALYSIS OF VARIANCE
1 WAY anova
2 way anova

data(mtcars)

null hypothesis - all the different gear cars are same with respect to MPG -miles per gallon
alternate hypothesis  = its different

View(mtcars)
unique(mtcars$gear)
boxplot(mtcars$mpg~factor(mtcars$gear),xlab='gear',ylab='mpg')
aov(mtcars$mpg~as.factor(mtcars$gear))->mtcars.aov
summary(mtcars.aov)
mtcars.aov

3,4,5 - they are different - 

TukeyHSD - Tukey's Honest Significant Distributed Test'
TukeyHSD(mtcars.aov)->mtcars.tukey
mtcars.tukey


Sentiment Analysis - in Theory only

Decision trees
RandomForest - in R is only used as classifier - 
  in Python RandomForest used both as classifer and regressor 
Project - 

#=========================

you have graduated B.Tech this year june 2019. you want to pursue higher studies in foriegn country. us, australia
, europe, london - 
  
a tree - conditions, situation, scenarios - then take step further based on its result

eg: which country -1st question  - USA - which university - boston - what are the thing you need to go/prepare for it. 
you wanted to make a decision - to go or not to go. 

Decision - to resolve - classifcation problem - 1 or 0, Yes or No 

Logistic Regression - Churn - Yes or No  - 1 million records - it may take 2-3 days to come up with a model. 
we are dealing in real world. 
Decison Tree - faster than logistic regression - more clear results 

#=================================
install.packages('rpart')
library(rpart)
library(C50)
data(churn)
View(churnTrain)
View(churnTest)
train<-churnTrain[,-c(1,2,3)]
test<-churnTest[,-c(1,2,3)]
View(train)
View(test)
set.seed(4567)
rpart(churn~international_plan+voice_mail_plan+total_night_charge+total_intl_charge+total_eve_charge,data=train)->churn_tree
rpart(churn~.,data=train)->churn_tree
summary(churn_tree)
plot(churn_tree)
text(churn_tree,all=TRUE)
names(train)
predict(churn_tree,newdata=test,type='class')->churn_predict
table(test$churn,churn_predict)
(66+1415)/(66+1415+158+28)->acc1
library(caret)
confusionMatrix(churn_predict,test$churn)
#===============
create 10 different trees with the same data
7 trees would be give me  Yes - customer will be churned
3 tree would give me No - customer will not be churned.

final value I take is Yes - custoer will be churned. 

RandomForest - in R - RandomForest Classifier - classification problem.
in python - RandomForest Classifier and Regressor 
#================================
install.packages('randomForest')
library(randomForest)
set.seed(909)  
randomForest(churn~.,data=train,ntree=35)->churn_forest1
churn_forest1
importance(churn_forest1)
varImpPlot(churn_forest1)
predict(churn_forest1,newdata=test,type='class')->churn_rf_predict
confusionMatrix(churn_rf_predict,test$churn)

randomForest(churn~.,data=train)->churn_forest2
churn_forest2
importance(churn_forest2)
varImpPlot(churn_forest2)
predict(churn_forest2,newdata=test,type='class')->churn_rf_predict2
confusionMatrix(churn_rf_predict2,test$churn)

setwd('directory path')

getwd()
