library(ggplot2)

?ggplot2
?geom_bar

age<-c(15,45)
print(x)

mean(age)

mean(14,45)

#Vector - a number, a string, a character, boolean - 

#TRUE or FALSE or T or F
#index - 1 in R

height<-c(5.6,6.2,4.9,5.11)
height

x
y
z
print(x,y,z)

vector1<-c(10.8,4,'Hellow World','M',TRUE,2)
vector1

# of only one data type either all - real number/integer/string/char/boolean
#precednence - 
#1. String
#2. REal Number
#3. integers
#4 Boolean

vector2<-c(15.3,7,F,5)
vector2

vector3<-c(4,5,9,10,T,F)
vector3

#homogeneous elements - by defintion - 

x<-10 # a vector
y<-15 # another vector
x*y

xyz<-list(1,'Edureka',7.6,TRUE,'a')
xyz[[3]]

list2<-list(a='USA',b='India',c='World',sublist=list1)
list2

list2$sublist
list2$b

more than one datatype in a vector or list.dirs(
  
1:3
seq(1:10)  
inc<-3
seq(1,10,inc)

cars<-list('Merc','BMW','Jeep','Lexus','Honda')
price<-list(10.4,8.3,5.5,8.2,6.6)
cars_price<-list(cars,price)
cars_price

vectors and list are dimensionless - it has only 0 dimension
if I add dimensions to my variable. then it becomes matrix. 

# matrix datatype
matrix(1:6, nrow=3)->mat2

mat2

#data frame - 
fruits<-c('Apple','Banana','Grapes','litchi','Pear')
vegetables<-c('Carrot','Beet','Cabbage','Onion',NA)
data.frame(fruits,vegetables)->df
df

View(df)

df$fruits
df$vegetables
df[3,]
df[3,2]=as.factor('Tomato')

df

df[row,column]
df[4,]
df[,2]

read.csv('/Users/Edureka/Customer_churn.csv')->churn

class(churn)

View(churn)
churn[3,2]<-'Female'
churn[3,2]

churn$Dependents - select dependents from churn where dependents='Yes'

matrix(c('a','b','c','d'),ncol=2)

read.table('/Users/Edureka/adult.data')->txtdata
View(txtdata)

list(1:3) -> list13
list13[[1]][2]


churn$customerID
churn$Dependents

list1 = list(1,2,3)
list1
list2 = list('abc', 'sid', 'nag')
mat1 = matrix(c(list1,list2), ncol = 3)
mat1
c(list1,list2)

# functions
# predefined and user defined

matrix,
list(
seq()
max(1:10)
min(1:4)
mean()
sd()
var()


#user Defined functions
square<-function (x) {
  x * x
}

square(9)

infinity<- function(x,y){
  x*y
}

infinity(145,876)

1/0  Iinf

getwd()
setwd()
getwd()
setwd('/Users/Edureka')
getwd()

unique_col_value<- function (x) {
  sum(x)
}

unique_col_value(churn$TotalCharges)

unique(churn$InternetService) - select distinct internetservice from churn;

# what is the difference between dataframe and dataset?

data frame - no harm or dataset - 
  
layman - please use dataset  - 

read.csv('transaction_data.csv')->df
View(df)  

df$creditLine
sort()
index <- order(df$creditLine)
index

df[rev(index),] # sorting all the values in df according to my sorted column creditline
  
nrow(df)
ncol()
dim()
#column bind and row bind and merge - difference - 

  list<-list(1,'Edureka',TRUE,7.6,'a')
list[[4]]

vector2<-c('string',1,TRUE,'a')
vector2

list3<-list(1,2,"",4)
list3[[4]]

df<-read.csv('Plasma.csv')
View(df)      
df$Plasma.glucose.concentration

str(df)

cars<-c('merc','bmw','jeep','honda','Toyota')
price<-c(10,20,14,9,14)
df2<-data.frame(cars,price)
str(df2)

diabetes_df<-read.csv('Diabetes.csv')
View(diabetes_df)

cbind(df,diabetes_df)->cbind_df
View(cbind_df)

transaction<-read.csv('transaction_data.csv')
hour<-read.csv('hour_transaction.csv')

transaction$new_column<-mean(transaction$balance)
View(transaction)
View(hour)

rbind(transaction,hour)->hourly_transaction
View(hourly_transaction)

read.csv('creditdata.csv')->credit
read.csv('all_transactions.csv')->all_transactions
View(credit)
View(all_transactions)

merge(credit,all_transactions)->merged_df
View(merged_df)

credit$custID<-0
  
credit_without_custID<-credit[,-1]
View(credit_without_custID)
merge(credit_without_custID,all_transactions)->new_merged_df

View(new_merged_df)

sum(merged_df$balance)

data()

install.packages('tidyr')

df[row,column]

df[c(15,17,19),c(11,13,15,16,21)] - 15th row and 13th columns - 



merge(df1, df2) - common values between df1$common_column and df2$common_column

1, 2,3
1,2,3,4,5, 

alL=TRUE - the 1,2,3,4,5  4 AND 5 THIS ROW NA

sum(is.na(df))

victims<-readLines('victims.txt')

View(victims)
class(victims)

as.data.frame(victims)->victims_df


View(victims_df)
length(victims)

str(victims_df)

grepl("^%",victims)->comments
comments

lines<-victims[!comments]
lines


lines_new<-victims[!grepl("^%",victims)]
lines_new

to create a dataframe from scratch or list or other variable.names(
  data.frame()
  
grep('^%',victims)
victims[c(1,11)]

grepl - T or F
grep - row number 

var1<-c(1,2,3,4,1,4,6,9,1,7)
regexpr(1,var1)

regexpr('e',victims[4])

gregexpr('s',victims[5])

lines

strsplit(lines,split=',')->splitlines
splitlines

length(splitlines)

class(splitlines)

matrix(unlist(splitlines),nrow=length(splitlines),byrow=T)->Lines
Lines

colnames(Lines)<-c('Name','BirthYear','DeathYear')
names(Lines) - with df

Lines
victims_df<-as.data.frame(Lines,stringsAsFactors=F)
str(victims_df)

names(victims_df)

as.numeric(victims_df$BirthYear)->victims_df$BirthYear
as.numeric(victims_df$DeathYear)->victims_df$DeathYear
str(victims_df)
View(victims_df)

victims_df$DeathYear

victims_df$DeathYear

sub('more','less',victims_df$Name)->victims_df$Name

sub()

1. cbind
2. rbind
3. merge
4. grepl
5. grep(
6. regexpr and gregexpr
7. strsplit
8. unlist
9. colnames
10. as.data.frame
11. sub and gsub
12. is.na

sum(is.na(victims_df))

anyNA(victims_df)

victims_df$DeathYear-victims_df$BirthYear->victims_df$age
View(victims_df)

df[row,col]
new_df<-victims_df[,-5]
View(new_df)

read.csv('telecomCalls.csv')->telecomdf
View(telecomdf)

apply(telecomdf,MARGIN=2, function (x){ifelse(x==99|x==-99,'Nag',x)})->telecomdf
View(telecomdf)

Assignment - on apply variants 

df$Names[is.na(df$Names)]<-'new_value'
is.na(df$Names)


read.csv('/Users/Edureka/Customer_churn.csv')->churn
View(churn)
str(churn)

sapply(churn,is.factor)->index
index

churn<-churn[,-1]

lapply(churn[index], function (x) as.numeric(as.factor(x)))->churn_new
View(churn_new)

churn_new<-as.data.frame(churn_new)
str(churn_new)

1. read.csv - comma separated file
2. readLines
read.csv('/Users/Edureka/winequality-red.csv')->wine
View(wine)

read.csv2('/Users/Edureka/winequality-red.csv')->wine_new
View(wine_new)

readLines('/Users/Edureka/victims.txt')

read.table('/Users/Edureka/adult.data',header=TRUE,sep=',')->adult.new
View(adult)

install.packages()
library(RCurl)

getURL('https://www.omanair.com')

data(mtcars)

head(mtcars)

summary(mtcars)

install.packages('Hmisc')
library(Hmisc)
summarize(mtcars,llist(mtcars$wt,mtcars$cyl,mtcars$disp),sum)

summarize(input$mpg,groupby, function)

unique(mtcars$mpg)
unique(churn$InternetService)

aggregate(mpg~cyl,data=mtcars, median)

Target~input variables+
  
 

var()
sd()

select count(emp#),sum(salary) from employee group by emp#,salary
correlation analysis. -- 
  
cor(mtcars)
-1 to +1 

install.packages('corrgram')
library(corrgram)
corrgram(mtcars)

plot(churn$Dependents)

boxplot(mtcars$carb)

summary(mtcars$carb)
IQR(mtcars$carb)

boxplot(churn$MonthlyCharges,ylab=summary(churn$MonthlyCharges))

1, boxplot always work on continous variables. 

boxplot(mtcars$mpg, xlab=("Mpg"), ylab=("Number"))

plot(churn$gender,xlab='Gender',ylab='Count')

plot(churn$TotalCharges,churn$tenure,xlab='Total Charges',ylab='Tenure')

plot(churn$Partner)

unique(churn$Partner)
#=================
install.packages('XML')
library(XML)
 
url="https://stats.espncricinfo.com/ci/engine/stats/index.html?class=11;template=results;type=batting"
tables=readHTMLTable(url,stringsAsFactors = F)
Error: failed to load external entity "http://stats.espncricinfo.com/ci/engine/stats/index.html?class=11;template=results;type=batting"
> #Note we wrote stringsAsFactors=F in this to avoid getting factor variables,
  > #since we will need to convert these variables to numeric variables
table2=tables$"Overall figures"
View(tables)
Error in tables$"Overall figures" : 
  object of type 'closure' is not subsettable
> rm(tables)
Warning message:
  In rm(tables) : object 'tables' not found
> #Creating new variables from Span
  > table2$Debut=as.numeric(substr(table2$Span,1,4))
Error in substr(table2$Span, 1, 4) : object 'table2' not found
> table2$LastYr=as.numeric(substr(table2$Span,6,10))
Error in substr(table2$Span, 6, 10) : object 'table2' not found
> table2$YrsPlayed=table2$LastYr-table2$Debut
Error: object 'table2' not found
> #Creating New Variables. In cri




cricket_stats<- readHTMLTable(url1, stringasFactors=F)

xmlParse(file1)->xmlfile1
xmlfile1
readHTMLTable(file1)->table1
table1

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)

doc1<-readHTMLTable(doc)

xmlTreeParse(url1)


doc


df<-data.frame('Names':c('Albert','Bobby'),'Height':c(6.3,4.7),'Weight':c(80,40))
View(df)

read.csv('/Users/Edureka/assignment4.csv',sep=',')->a4
View(a4)

mean(a4$Height[a4$Height>4.7])->mean_ht_gt_4.7
#=======
# EDA - DATASET
#customer_churn dataset from https://www.kaggle.com/blastchar/telco-customer-churn

data(mtcars)
library(corrgram)
corrgram(mtcars)
install.packages('corrplot')
library(corrplot)
cor(mtcars)->cars_cor
corrplot(cars_cor,method='number',type='lower')

# what is the purpose of correlation? as part of EDA, you need to figure out how your data is in relation
# with other columns
# it will also give you, whether the column is influencing your target variable (output variable)
View(churn)
churn<-read.csv('/Users/Edureka/Customer_churn.csv')
churn$Churn<-as.numeric(as.factor(churn$Churn))
cor_churn<-cor(churn[c('tenure','MonthlyCharges','SeniorCitizen','Churn')])
corrplot(cor_churn,bg='black')

install.packages('dplyr')
library(dplyr)

#Pipe Operators - '%>% - 


#the output of one command will be passed as input to another command
churn %>% select(1:5) %>% filter(gender=='Female')->female_customers
View(col_1_5)
churn %>% filter(PaperlessBilling=='No') %>% group_by(TechSupport)->grouped_data
View(grouped_data)

mutate(churn,Age=ifelse(SeniorCitizen==0,19,66))->churn
View(churn)

sample(1:10)

churn$MonthlyCharges->prev_monthly_charges

churn$MonthlyCharges[6]  *  ->churn$MonthlyCharges[6]
View(prev_monthly_charges)

# Data Visualization - 
# Map - Picture? visual - 

# will you give a document 150 pages - or will you give a PPT, atleast storyboard with some grpahs, figures, numbers etc

1. shot many birds - a picture worth 1000 words

#1. Data visualizaton  - its relationships, its hidden stories, patterns, what data is sayint to you on profits, losees, anything else


boxplot(churn$MonthlyCharges)

install.packages('ggplot2')  # grammar of graphics

data(iris)
View(iris)
unique(iris$Species)
plot(iris$Species)
plot(iris$Sepal.Width,type='l')

barplot(iris$Petal.Length)
length(iris$Sepal.Length)

# By default, x axis the index/row number of the column

boxplot(iris$Petal.Width)
text(y=boxplot.stats(iris$Petal.Width)$stats,labels = boxplot.stats(iris$Petal.Width)$stats,x=0.5)

boxplot.stats(iris$Petal.Width)

data(mtcars)
View(mtcars)

plot(mtcars$mpg)

pie(table(iris$Species))

table(iris$Species) #- select count(*) from table_name group by col_name

pie(iris$Petal.Length)

#1. what type of visualization - what it really show
#2. when to use which graph

continous variables - scatter or lines
categroical - bar plot
group by values - pie charts 
histograms - show the frequency or how often the data is in the datset. 
tableplot - snapshot of your dataset -

par(mfrow=c(2,2))
boxplot(iris$Petal.Length)
par("mar")
par(mar=c(1,1,1,1))

par(mfrow=c(1,1))

boxplot(iris$Petal.Length)
plot(iris$Sepal.Length,type='l')
plot(density(iris$Petal.Length))
hist(iris$Sepal.Width)
#Customize your graphs
#col - colors
plot(iris$Sepal.Length,main='Sepal Length',col='orange',xlab='Row Number',ylab='Length')

install.packages('RColorBrewer')
library(RColorBrewer)
hist(iris$Petal.Length)
hist(iris$Sepal.Width,col=rainbow(9))
hist(iris$Petal.Width,col=brewer.pal(5,"Pastel1"))

install.packages('tabplot')
library(tabplot)
tableplot(mtcars)
#======================
library(RCurl)
library(XML)
url_info<- "https://stats.espncricinfo.com/indian-premier-league-2017/engine/records/team/results_summary.html?id=117;type=trophy"
class(url_info)


file1<-getURL(url_info)
file1
htmltable1<-readHTMLTable(file1)
htmltable1

url2<-'https://www.espncricinfo.com/series/_/id/8048/season/2017/indian-premier-league'
file2<-getURL(url2)
htmltable2<-readHTMLTable(file2)
htmltable2

url3<-'https://www.espncricinfo.com/rankings/content/page/211271.html'
file3<-getURL(url3)
htmltable3<-readHTMLTable(file3)
htmltable3
class(htmltable3)
url4<-'https://decisionstats.com/2013/04/25/using-r-for-cricket-analysis-rstats-ipl/'
file4<-getURL(url4)
file4
htmltable4<-readHTMLTable(file4)

htmlstats<-readHTMLList(file4)
htmlstats

class(htmltable4)
View(htmltable4)

# to know installed packages
installed.packages()

url5<-"https://stats.espncricinfo.com/ci/engine/stats/index.html?class=11;template=results;type=batting"
file5<-getURL(url5)                   
htmloutput<-readHTMLTable(file5)
htmloutput
#============
data("Titanic")
View(Titanic)
boxplot(Titanic)
str(Titanic)

install.packages('vcd')
library(vcd)
mosaic(HairEyeColor,)

View(HairEyeColor)

# Spatial analysis
install.packages('raster')
library(raster)
alt<-getData('alt',country='IND')
plot(alt)
var1<-res(0.5)
worldclimate<-getData('worldclim','IND'

                      clim<-getData('worldclim', var='tmin', res=0.5, lon=5, lat=45)
               plot(clim)       
par("mar")             
par(mar=c(1,1,1,1))

#KMGGPLOT2 IS not available in CRAN repository. 

install.packages('ggplot2')
library(ggplot2)

View(churn)
ggplot(data=churn, aes(x=tenure,fill=Partner))+geom_histogram(bins=50)

ggplot(data=churn,aes(x=MonthlyCharges,fill=Contract))+geom_histogram(fill='lightblue')
ggplot(data=churn,aes(x=SeniorCitizen, fill=InternetService))+geom_bar()
ggplot(data=churn,aes(x=tenure,fill=InternetService))+geom_histogram()->g1
g1+facet_grid(~InternetService)
ggplot(data=churn,aes(y=MonthlyCharges,x=PaymentMethod,fill=PaperlessBilling))+geom_boxplot()

# outlier?

age<-c(3,11,13,15,17,19,21,56)
mean(age)
age<-c(11,13,15,17,19,21)
mean(age)

#1. remove outliers
#2. if you can't remove it, include it - how? scale the data or normalize data to 0 to 1,

salary<-c(10k,20k, 34k, 45k, 1000k, 2M, 2.5) - normalize your data - treatment of outliers
salary<_c(0.001, 0.005,0.06)

ggplot(data=churn,aes(y=MonthlyCharges))+geom_density()->g2
  g2+labs(title='Scattered Plot')
  g2+theme(panel.background = element_rect(fill='grey'))->g3
  g3+theme(plot.background = element_rect(fill='black'))
  
# Machine Learning - Modules 7 to 11. 12th Module is a project 
#at the max - 2-4 commands 
  
# Data Mining - Unsupervised Learning  7 - 8 
What is machine learning?
what is AI? 
  difference between AI and Machine Learning
y=mx+c - m is the slope and c is y intercept - linear regression of ML SUPERVISED.

#11.75 - 8.2 - error - high which means my accuracy of prediction is low. 

# supervised ML
a type of ML where you have both input and output data.

employee - id, dob, salary - emailid, - hike is a continous variable 0.0 to  REgression - 
  target variable is descrete - yes/no, Male/Female, True/False, 1/0, small/Medium/Large/XL/xxL, strongly disagree to strongly agree - classification 

only input data but no output data - you come up with a model and then predict the accuracy. then it is unsupervised ML
unsupervised ML - Kmeans clustering - 

  stats -  only 100rows, - huge volume data with big variance 

1 million customers saving account -url
you have to come huge amount.

if I cluster my 1 million customers say into 5 or 7 or 10group. 
I will come to know the range of spending/saving of my customer
10k
34K
75K - 
  
K Means Clustering - k is a number 2,3, 10, 30

# BetweenSS - Sum of squares - as big number as possible

# withinSS - with in sum of squares - as small number as possible

# strength of the cluster

# Eucledian distance - a point from x to y distance - (x1,y1) - (x2,y2) 
#distance is (y2-y1)^2 + (x2-x1)^2

population - sample - eg: population of computers sold by lenovo company - 1,000,000

test the quality of computers - a sample of it - say 1000 or 2000

set.seed(999)
data(mtcars)
km<-kmeans(mtcars,5)
km
View(mtcars)

km$totss
km$betweenss / km$totss

df<-cbind(mtcars,cluster=km$cluster)
View(df)

tapply(df$mpg,df$cluster,mean)

This is called profiling of data 

Now - what should be the vlaue of K? - 3,5,10,1020,
1. start k=1....m (optimal K),m+1,m+2...
2. K=sqrt(Nof of rows /2)
k=sqrt(32/2)
k
#K Means algorithm - Unsupervised ML algorithm
1. data
2. ML - model/Algorithm
3. test/prediction/metric of your algorithm

install.packages('animation')
library(animation)
kmeans.ani(mtcars,4)

Association rule - Market Basket Analysis

every body does groceries shopping in your community store, supermarket,chain of supermarkets,

you are going to a grocery store in your community/local area. the shops caters to say 200 customers. 
bread, butter and milk - any other things

jan 2020, you stopped buying bread. rest all you are buying it as it was. 

size of the business, volume of tranactions - 
  
they do perform analytics on what? on your purchasing habits? 
  
market basket analysis - bread, milk, butter along with baby needs - for 3-6 months - on baby products

bread, eggs, ham, vegetables - running a eatery - 
  
Beer and Diaper - Most weird items bought together -  
  
# Association Rules - Unsupervised ML

install.packages('"arules')
install.packages("arulesViz")
library(arules)
data(Groceries)
library(arulesViz)
class(Groceries)

summary(Groceries)

itemFrequencyPlot(Groceries,topN=30,type='absolute')

rules<-apriori(Groceries,parameter = list(support=0.001,confidence=0.9))

sort_rules<-sort(rules,by='confidence',decreasing=T)
inspect(sort_rules)

summary(sort_rules)

# Collaborative filtering - Unsupervised ML 
prime video, netflix, hotstar and other movie streaming sites
ecommerce sites, amazon, ebay, flipkart, ...

when you login to amazon and placed order for a laptop. 
you billed it ad then you get a page "frequenly bought items" you will be interested 
in a sleeve, bag, external HDD, mouse, keyboard ...

prime, hulu, netflix - you will get a section in your movie catalogAdd(
  "people/customers also watched"
or "Recommended for you" section - 
  
  
recommender system - unsupservised ML model - collaborative filtering.

cosine_sim<-function(a,b) crossprod(a,b)/sqrt(crossprod(a)*crossprod(b))
  


/sqrt(crossprod(a)*crossprod(b))
user1<-c(0,4,4,2,1,2,0,0)
user2<-c(3,0,0,0,5,1,0,0)

user3<-c(3,0,0,3,2,2,0,3)
user<-c(0,0,4,3,0,1,0,5)

cosine_sim(user1,user)

cosine_sim(user2,user)
cosine_sim(user3,user)

for the user in question - am trying to do 
1. recommend the movies- how many
2. in which order I have to recommend


# Supervised ML - Linear Regression 

for Linear Regression metric - is R2 Squared value or RMSE root mean square error

R2 value should tend towards 1 - for the better model - 
  RMSE values should tend towards 0 - for the better model


library(caTools)
read.csv('/Users/Edureka/Computer_data.csv')->computer
View(computer)
split_tag<-sample.split(computer$price,SplitRatio = 0.7)
split_tag

train<-subset(computer,split_tag==TRUE)
test<-subset(computer,split_tag==FALSE)
nrow(train)
nrow(test)
names(computer)

#Linear Regression

lm(price~.,data=train)->lm_model

# If the above function errors out then do this
train$cd<-as.numeric(as.factor(train$cd)) # convert categorical column to numeric
# repeat the same for other categorical columns in both train and test dataset. 

summary(lm_model)
predict(lm_model,newdata=test)->lm_predict

lm_predict

plot(test$price,col='black',type='l',lty=3.5)
plot(lm_predict,col='orange',type='l',lty=1.5)
cbind(actual=test$price,predicted_price=lm_predict)->final_price
as.data.frame(final_price)->final_price
View(final_price)

test$predicted_price<-lm_predict
View(test)


#Logistic Regression - Supervised ML - Classification 
#Decision Trees and Random Forest - today or tomorrow. 

probabilities - metric for classification  - confusion matrix -

which team will win today? - sms question 
classification ML which works Here. 

76% have polled that team 1 will win 24 % say team 2 will win - 100%

churn<-read.csv('/Users/Edureka/Customer_churn.csv')
View(churn)

churn<-churn[-1]

View(churn)

library(caTools)
sample.split(churn$Churn,SplitRatio = 0.70)->sample_tag
train<-subset(churn,sample_tag==TRUE)
test<-subset(churn,sample_tag==FALSE)

#logistic Regression 
set.seed(2103)
glm_model<-glm(Churn~., data=train,family='binomial')
summary(glm_model)

predict(glm_model,newdata=test,type='response')->glm_predict

confusion matrix - 
type 1 and type2 errors

accuracy of the model - 
  
as.tranaction(datasetname)

#real rating matrix - r pub, r community websites - 
table(test$Churn,glm_predict>0.5)->acc1

acc1
(1393+318)/((1393+318)+156+243)->acc_glm_model
acc_glm_model

#ROC - reciever operator characterstic
library(ROCR)
prediction(glm_predict,test$Churn)->pred_log
performance(pred_log,measure='tpr',x.measure = 'fpr')->acc_log
plot(acc_log,colorize=T)
plot(acc_log,colorize=T,print.cutoffs.at=seq(0.1,by=0.1),text.adj=c(-0.2,1.8))

table(test$Churn,glm_predict>0.6)->acc1 
acc1

(1282+372)/(1282+372+267+189)

(1462+218)/(1462+218+87+343)

glm_model2<-glm(Churn~tenure+MonthlyCharges+TotalCharges,data=train,family='binomial')
predict(glm_model2,newdata=test,type='response')->glm_predict2

table(test$Churn,glm_predict2>0.5)->acc2
acc2


prediction(glm_predict2,test$Churn)->pred_log2
performance(pred_log2,colorize=T,measure='tpr',x.measure='fpr')->acc_log
plot(acc_log,colorize=T,print.cutoffs.at=seq(0.1,by=0.1),text.adj=c(-0.2,1.8))

Yes/No - based of previous data, we come up with a model class is yes - no
class is No.  - Yes

summary(glm_model2)

data(mtcars)
#null Hypothesis - All the different geared cars are same with respect to MPG. 
# alternative Hypothesis - mpg differe with gear number

boxplot(mtcars$mpg~factor(mtcars$gear),xlab='gear',ylab='MPG')

mtcars_aov<-aov(mtcars$mpg~as.factor(mtcars$gear))
summary(mtcars_aov)

#TUKEY'S HSD - test
mtcars.posthoc<-TukeyHSD(mtcars_aov)
mtcars.posthoc



#Classification - Decision Tree - Supervised ML

View(churn)
set.seed(2203) # any random number to reproduce the same sample
library(rpart)
churn_tree<-rpart(Churn~.,data=train)
summary(churn_tree)
plot(churn_tree)
text(churn_tree,all=TRUE,use.n=TRUE)
library(rpart.plot)
rpart.plot(churn_tree)

#Decison tree algorithm chooses a node to start with. how? and why a particular column
#will only be choosen?

View(churn)
# Entropy - lower value of the entropy of a column will be choosen
# Information Gain - highest value of inof gain of a column will be choosen as a root node. 

# dist to mall from your place is 6Miles 
# there are 4 routes to reach mall from your place.
# each route will take different time to reach 
# based on your requirmeent you take the best route. 

# you have to predict
#1. Create confusion matrix
#2. calculate the accuracy
#yes/no/maybe - cm - 3*3 , 0-9 class then 10*10 cm 

predict(churn_tree,newdata=test,type='class')->tree_predict
table(test$Churn,tree_predict)
(1411+249)/(1411+249+141+312) ->acc_tree

library(caret)
confusionMatrix(test$Churn,tree_predict)

Yes or No. - false yes, false no
Small/Medium/Large/XL/XXL - your confusion matrix woud be 5 * 5 dimensions

#Classification - RandomForest - Supervised ML
There's a n ABC company which has opened an IPO '

You want to invest your money into ABC company. 
1. you check the market/research about the stock prices of ABC company - info - 40%
2. you talk to your financial advisor on ABC balance sheet etc  - 85% true always
3. you go and chat with your friend who happens to be an employee of ABC. - 70% true
4. you also with stock broker about ABC company - 69% true. 
...
10. a competetor of ABC company - 82% true. 
77%, 64% or % true that you can invest your money in ABC company. 
or otherwise. 

how many tree should be planted? for random forest? 

library(randomForest)


Random Forest - planting a n number of trees and voting the decison/accuracy and picking the highest accuracy for the problem. 
set.seed(0322)
randomForest(Churn~.,data=train,ntree=50)->rf_model

sum(is.na(churn$TotalCharges))

mean_totalcharges<-mean(churn$TotalCharges,na.rm=T)
churn$TotalCharges[is.na(churn$TotalCharges)]<-mean_totalcharges
train$TotalCharges[is.na(train$TotalCharges)]<-mean(train$TotalCharges,na.rm=T)
test$TotalCharges[is.na(test$TotalCharges)]<-mean(test$TotalCharges,na.rm=T)


train$Chrun<-as.numeric(as.factor(train$Churn))

randomForest(Churn~.,data=train)->rf_model
randomForest(Churn~tenure+MonthlyCharges+TotalCharges,data=train,ntree=50)->rf_model2

rf_model2

rf_model

predict(rf_model,newdata=test,type='class')->rf_predict

varImpPlot(rf_model)

can you prepare a confusion matrix and come up with accuracy? small task
confusionMatrix(test$Churn,rf_predict)
confusionMatrix(test$Churn,tree_predict)

normally - RF is popular among classification, other than SVM, and Naive Bayes  - 


    



