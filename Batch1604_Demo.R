#to execute a command press ctrl+Enter

var1=10

variable1<-100.50  # backward assignment or left assignment
  
'This is a variable'->variable2 # forward assignment or right assignment

print(variable1,variable2)
variable2
cat(variable1,variable2)

var3<-scan()
print(var3)

getwd()
setwd('/Users/Edureka')
getwd()

#integers,
#float
#character/string
#complex
#Boolean

1e-4->var_exp
var_exp

#data structures
#vectors
#lists
#matrices
#data frames

#Vectors - 
vector1<-c(3,'Hello',5.6,TRUE,FALSE,T,F)

vector1

vector2<-c(3,5.6,TRUE,FALSE,T,F)
vector2

#order of precedence - datatype precedence 

# String
# Float
# integer
# Boolean

typeof(vector2)
typeof(vector1)

class(vector2)

#list
list1<-list(c(5,6,7),c('a','b','c'),T,F)
list1
list1[1]

#index in R starts with 1 not 0. c,c++,python, 0, 

list2<-list(list1,vector1)
list2

list2

#list - output be [top list][sub list1][sub list2]...
#listvar[[toplist]][sublist][sublist2]

list2[[2]][3]


#Matrices
Homogeneous - one data type
Heterogeneous - multiple data types

vector, matrix are homogeneous

list, dataframs are heterogeneous

#

seq(1,10,2)

c(1:10)

mat1<-matrix(c(1:9),nrow=3)
mat1

mat2<-matrix(c(1:10),nrow=5,ncol=2)
mat2

mat3<-matrix(c(1:6),ncol=2)
mat3

dim(mat1)
dim(mat2)


#rows * columns - should be a factor of total no of data

# Data Frames/Data set 

data<-c('Bangalore','Hyderabad','New York','California','Bangalore0')
state<-c('Karnatka','Telangana','New York','Bay Area','NA')

gender<-c('male','female','female','male','FEMALE')

df<-data.frame(data,state,gender,data)

df
View(df)


#tablename.column_name
df$gender

df2<-read.csv('all_transactions.csv')
View(df2)

str(df2) # - describe table_name
str(df)

# - works only on numbers  1, 0 - 
# - 

#python - you need to convert charcter to numbers 
#"1","2"

summary()
length()

View(df)

length(df)
nrow(df)
ncol(df)
dim(df)
str(df)

summary(df2)

#min and max values

1st quantile - 25th percentile - 
3rd quantile - 75th percentile - 
IQR - inter quantile range 
mean  - average of your data 
median is 50th percentile

boxplot(df2$balance)
boxplot(df2)
str(df2)

credit<-read.csv('/Users/nagarajugooty/Downloads/creditdata.csv')

View(credit)
boxplot(credit)

summary(credit) 

length(data) - 
ncol(df)

boxplot(df2)
boxplot(df) - boxplot only takes numeric - 
  
str(df)
df$state<-as.numeric(as.factor(df$state))
str(df)

loan<-read.csv('/Users/nagarajugooty/Downloads/train.csv')
str(loan)

summary(loan)

summary(df)

boxplot(loan$LoanAmount)

sort(unique(loan$LoanAmount))

unique(loan$Gender)

head(loan) 

View(loan)

tail(loan)

#NA - null values 


loan$LoanAmount[is.na(loan$LoanAmount)] # check

summary(loan)

sum(is.na(loan$LoanAmount))

#is.na - to check null value

#dataframe - rows, columns , rows*columns - 

# dataframe$column_name 
loan$ApplicantIncome[is.na(loan$Applican)]

is.na(loan$Self_Employed)->null_indicator

loan$Self_Employed[null_indicator]

null_indicator

summary(loan$Self_Employed)

#df[row,col]
#select loanmamount from loan;

loan$ApplicantIncome>1000->filter_gt_1000
loan$Education[filter_gt_1000]

#select eduction from loan where applicantIncome>1000

max(loan$ApplicantIncome)

#na.rm=T, na.omit(loan$LoanAmount)

mean(loan$ApplicantIncome)
mean(loan$LoanAmount,na.rm=T)
View(loan)

# CBIND, RBIND and MERGE - 
# CBIND - column bind, RBIND - row bind

setwd('/Users/nagarajugooty/Downloads')
plasma<-read.csv('Plasma.csv')
diabetes<-read.csv('Diabetes.csv')

View(plasma)
View(diabetes)

nrow(plasma)
nrow(diabetes)

cbind_df<-cbind(plasma,diabetes)
View(cbind_df)

#rbind
transaction<-read.csv('transaction_data.csv')
hour<-read.csv('hour_transaction.csv')

ncol(transaction)
ncol(hour)

names(hour)

colnames(hour)

hour$gender->gender_col

hour<-hour[,-2]
hour$gender_new<-gender_col

View(hour)
View(transaction)
nrow(transaction)
nrow(hour)

hourly_transaction<-rbind(hour,transaction)
View(hourly_transaction)

#Merge
credit<-read.csv('creditdata.csv')
all_transaction<-read.csv('all_transactions.csv')

View(credit)
View(all_transaction)

nrow(credit)
nrow(all_transaction)
ncol(credit)
ncol(all_transaction)

merged_df<-merge(all_transaction,credit)
View(merged_df)

merge_all_cols<-merge(all_transaction,credit,all=T)
View(merge_all_cols)

#emp - empid, ...dept id, sal..
# dept - deptid, dname...

#select a.*,b.* from emp a, dept b where a.deptid=b.deptid
#select a.*,b.* from emp a, dept b 

#dplyr

# # Life Cycle of data science problem
# 1. collect the data - 5-8%
# 2. exploratory data analysis - 70-80%
# 3. visualization - 
# 4. model creation - ML (includes evaluation/testing) - 10-15% - 85% accuracy
# 5. deployment - 5-7%

#apply  - 
# functions - 
# data cleaning, wrangling

#two types of functions in R
#1. built in functions
#   summary(), str, class, length(), data.frame, list 
# min, max, sum, sd, var, median - 
# user defined functions

product<- function (x,y) {
  x*y
}

product(5,6)

#control structures
#if - else  
# for 
# while

#in line functions, inline loops

#apply -  apply(x,MARGIN = c(1,2),function) 

df2
View(df2)

apply(df2,MARGIN=1,sum)

apply(df2,MARGIN=2, function (x){ifelse(x==0,100,x)})->add_100_columns2
add_100_columns2

#1. data - in unstructured, null values, junk values, %, *, & " ",...

#lapply, sapply, tapply, vapply - variants of apply -
#lapply - results in a list
#sapply - results in a matrix
#tapply - 
programing_languages<-c('R','PYTHON','C++','HADOOP')
pr_languages_lower<-lapply(programing_languages,tolower)
pr_languages_lower

#for i in 1:length(programing_languages){ tolower(program[i])}
#vectors and objects - list,matrix, dataframes

telecom_calls<-read.csv('telecomCalls.csv')
View(telecom_calls)

apply(telecom_calls,MARGIN=2, function (x){ifelse(x==99|x==-99,0,x)})->cleaned_data
View(cleaned_data)

class(cleaned_data)
cleaned_data=as.data.frame(cleaned_data)

mean(telecom_calls$customerService_calls)
mean(cleaned_data$customerService_calls)

#Module - Data Cleaning - manipulate - correcting the wrong/junk values, 
# collect the data - import the data
# inspect the data - datatype of the data, any missing values, 
# any junk values, convert, impute, change the case, structure, types.

victims<-readLines('victims.txt')
victims

df<-as.data.frame(victims)
View(df)

#1. everything is in one column
#2. comments are included in the dataframe as a row
#3, there are a few NA values
#4. convention, norm of the columns are at the end of the dataframe

# NA values in my dataset

telecom_calls[6:7,4]<-NA
View(telecom_calls)

sum(telecom_calls$total_localcalls,na.rm=T)
mean()

str(df)
#1. remove the comments from our input data
#2. split the data into columns
#3. transform/convert the types of data
#4. imputing the null values

# Every data has a hidden story
# has to figure out the patterns of it. 

grepl('^%',victims)->comments
comments
lines<-victims[!comments]
lines

# regular expressions  - are used to mainpulate the data
victims
comments
class(comments)

victims[FALSE]

comments[11]

grep('^%',victims)->comment_rows
comment_rows

lines2<-victims[-c(1,11)]

1 - TRUE
11- TRUE
lines2

#INDEX AND SLICING - MORE THAN ONE DIMENSION,

#INDEX FOR ONE DIMENSION 

lines

strsplit(lines,split=',')->splitLines
splitLines

class(splitLines)

length(splitLines)

splitLines

Lines<-matrix(unlist(splitLines),nrow=length(splitLines),byrow=T)

Lines

matrix(1:9,nrow=3)

Lines[6,2]

#convert list to matrix with than data.frame

#matrix is a homogenous object,
#dataframe is a heterogenous object

dim(Lines)
dim(cleaned_data)

Lines 

unlist(splitLines)

matrix(1:9,nrow=9, )

splitLines

length(splitLines)

names(Lines)

colnames(Lines)<-c('Name','BirthYear','DeathYear')

colnames(Lines)

Lines

#V1,V2,V3 - 

victims_df<-as.data.frame(Lines,stringsAsFactors = F)
victims_duplicate<-as.data.frame(Lines)
victims_df
View(victims_df)

mean(victims_df$DeathYear)

"Antony18171912"->text

#sub,
#gsub,

str(victims_df)
1. convert character() to numeric - done 
2. impute null values with something
#

victims_df$DeathYear<-as.numeric(victims_df$DeathYear)
victims_df$BirthYear<-as.numeric(victims_df$BirthYear)

str(victims_duplicate)

victims_duplicate<-victims_df

View(victims_duplicate)
victims_duplicate$DeathYear[3]<-as.factor('1945')
victims_duplicate$DeathYear[4]<-'1937'

str(victims_duplicate)
#Factor - 'Nag'  - a numeric value - 
#R - internally convert char/string a factor values - numeric encode your char to a numeric values
#Gender - Male and Female  - factor - 1,2




#python - internal conversion - Nag, anthony - encoders - Label, get_dummies, onehot encoder


v_df1<-as.data.frame(Lines,stringsAsFactors = F)
View(v_df1)
str(v_df1)

v_df1$DeathYear<-as.numeric(v_df1$DeathYear)
v_df1$BirthYear<-as.numeric(v_df1$BirthYear)

View(v_df1)
str(v_df1)

sum(v_df1$BirthYear)
max(v_df1$BirthYear)

sum(v_df1$DeathYear,na.rm=T)

# IMPUTING OUR NULL VALUES with mean or nearest neighbors - 0 
# in reality, there 

mean(v_df1$DeathYear,na.rm=T)

v_df1$DeathYear[2]<-mean(v_df1$DeathYear,na.rm=T)

v_df1<-apply(v_df1,MARGIN=2,function(x){ifelse(x==-99|x==8888|,1930,x)}) # - need to come back

str(v_df1)


#junk_values<-c(-99,88888,-0.1)

View(v_df1)

mean(v_df1$Name)

class(v_df1)

read.table('adult.data',sep=',' )->adult.data
View(adult.data1)

# exercise/task 1
install.packages('readtext')
library(readtext)

readtext('iris.pdf')->irispdf
View(irispdf)
irispdf$text

install.packages('dplyr')
library(dplyr)

churn<-read.csv('Customer_churn.csv')
View(churn)

#| - pipe in unix

#ls -l | grep *.csv
#%>% - pipe 
#%in%
#5 %in% c(1,24,5,6,7)

churn %>% select(1:5)->churn_1_5
head(churn_1_5)

churn %>% filter(InternetService=='Fiber optic' | Dependents=='Yes')  %>% group_by(gender) ->c_filter_with_groupby

View(c_filter_wo_groupby)
View(c_filter_with_groupby)

#select sum(monthly),gender from churn group by gender having dependents='Yes'


# 1. - apply - char - in the dataframe
# 2. with and withou group by

#EDA - exploratory data analysis data visualization - 

#  & logical AND
# | logical OR

#%>% - pipe


str(v_df1)
v_df1$DeathYear<-as.numeric(v_df1$DeathYear)
v_df1$BirthYear<-as.numeric(v_df1$BirthYear)

View(v_df1)
str(v_df1)
apply(v_df1,MARGIN=2,function(x){ifelse(is.na(x),mean(x),x)}) # - need to come back

v_df1[is.na(v_df1)]<-1930 # Note: This works for all the na values
#or
v_df1$DeathYear[is.na(v_df1$DeathYear)]<-mean(v_df1$DeathYear,na.rm=T)


churn %>% filter(InternetService=='Fiber optic')  %>% group_by(gender) ->c_filter_with_groupby
c_filter_with_groupby  
churn %>% filter(InternetService=='Fiber optic')->c_filter_wo_groupby
c_filter_wo_groupby

churn %>% filter(InternetService=='Fiber optic' | Dependents=='Yes')  %>% group_by(gender) ->c_filter_with_groupby
c_filter_with_groupby  
churn %>% filter(InternetService=='Fiber optic' | Dependents=='Yes')  ->c_filter_wo_groupby
c_filter_wo_groupby

churn %>% filter(InternetService=='Fiber optic' | Dependents=='Yes')  %>% group_by(gender) %>% summarise(mean_mc=sum(MonthlyCharges,na.rm=T)) ->c1
churn %>% filter(InternetService=='Fiber optic' | Dependents=='Yes') ->c0
View(c1)
View(c0)

lang=c('C Programing','R Programing','Java Programing','DS Programing')

sub('','Examples',lang)->sub_example
sub_example

#read.csv, read.data, readtext - used for importing dataset

View(churn)

getwd()
setwd('/Users/nagarajugooty/downloads')

feat1<-read.csv('feat1.csv')
feat2<-read.csv('feat2.csv')





View(test)
getwd()
merge(feat1,feat2)[,1:3]->test2
test2
merge(feat1,feat2,all=TRUE)->test3
test3

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

10->z
f(5)

sample(10)

churn

sample_n(churn,10)

set.seed(4)
sample(churn$TotalCharges,10)
sort(churn$TotalCharges)

table(churn$Partner)

data()

data(DNase)

View(DNase)
#=======================

#iris.docx or pdf - > two columns - docid, text, 

gsub('Programming','Example',iris$text)


# word doc or pdf - business problem - 
#   define problem - 
# check - categorical and continous - 
# ETL - HADOOP,
# oracle , db2 - 
#   
# waht is my target?  - classification or regression - recommendation, market basket analysis
# data analysis
# 
# put whatever ideas you ahve to collect, explore and come up with analysis
# 
# 1. check your data - missing, junk, 
# 2. check outliers
# 3. categorical - 

#y= function(X) - 
  
#univariate analysis

sum(is.na(churn))

colMeans(sapply(churn,is.na))

is.na(churn$TotalCharges)

colSums(churn$TotalCharges)
?colSums

sum(churn$TotalCharges,na.rm=T)

val<-c(1,2,8,4,5,6,7,100)
mean(val)

median(val)

sort(val)

count of values - in val - 7 odd number - 7/2 
count of values in val is 8  -even number 4th+5th/2

10k 100k - 100 people - median 10k, 11,12...100k - 200 - 100th+101th/2 


c(10,12,13,15,100) -> people_sal
mean(people_sal)

median(people_sal)

var(people_sal)

30

variance - x - 1534.5  

range(churn$TotalCharges)

churn$TotalCharges[is.na(churn$TotalCharges)]<-100

var(churn$TotalCharges)

plot(churn$TotalCharges[400:500])


c(5,5.1,5.2,5.3,5.4,5.5)->val
var(val)
plot(val)
mean(val)

sd(val) # - sqrt(variance)  

#2k,10,12, 350K

EDA - 
1. continous
2. categorical
3. null values
4. sum
5. mean
median
var

#EDA on categorical
table(churn$Partner)
sd

is.factor(churn$tenure)

is.factor(churn$SeniorCitizen)
is.factor(churn$Partner)

sapply(churn,is.factor)

#categorical - always limited count - 100 - states of a nation - 29 - 54 - 23 - ap,tn,ka,

#salary, 1k, 1.00001k

#gender - male, female - 10, 1000k - male,females, factor(male - 1, female -0)

  
churn_continous<-churn[,!sapply(churn,is.factor)]

churn_categorical<-churn[,sapply(churn,is.factor)]

View(churn_continous)

View(churn_categorical)

boxplot(churn$tenure, main='Tenure Box Plot')
points(1,mean(churn$tenure),col='red',pch=13)
text(y=boxplot.stats(churn$tenure)$stats,labels=boxplot.stats(churn$tenure)$stats,x=0.75)
summary(churn$MonthlyCharges)

boxplot(churn$MonthlyCharges, main='MOnthly Charges Box Plot')
points(1,mean(churn$MonthlyCharges),col='red',pch=13)
text(y=boxplot.stats(churn$MonthlyCharges)$stats,labels=boxplot.stats(churn$MonthlyCharges)$stats,x=0.75)
summary(churn$MonthlyCharges)

barplot(table(churn$Dependents))

churn %>% filter(Dependents=='No' & Churn=='Yes')

scatter plot
cov()
cor()
corrplot()
corrgram()

barplot(table(churn$Churn))

variance - squared unit of your spread of data around mean values

colSums(as.matrix(churn_continous))

#SMOTE - oversampling, undersampling - 


# 30th Apr 2020

colMeans(churn_continous)

mean(churn$tenure)

rowMeans(churn_continous)

# histogram

hist(churn$tenure,breaks=10)

data(mtcars)

hist(mtcars$disp)

# bivariate analysis
#scatter plot
plot(churn$MonthlyCharges,churn$tenure)
#covariance - monthlycharges, totalcharges - tenure - totalcharges

# wells fargo , icici bank stocks  - RBI 
# HDFC, - chase - 

#BANK - A - Will - Bank B - covariance A and B are high

#icici bank, gold bonds, commodity stock - cashew, pista 

# rupee to a USD - 
#A goes UP and B comes down - -ve covriance

cov(churn_continous)

churn$SeniorCitizen<-as.factor(churn$SeniorCitizen)

#correlation - function (covariance) - standardized value of covariance

#-1 to 1

100K-1200K - 
sd(12 participants) - 235.5

100/235.5
150/235.5
500/235.5
#performance appraisal - 100 - 1 - 5  - 10 - 4.5, 30 - 3.5, 2.5

v<-c(10,15,35,46,74,62,74,90)
h<-c(1,2,3,4,5,6,7,8)

mean(v)
sd(v)
plot(v,h)
barplot(h,v)
abline(v=mean(v))
abline(v=sd(v),col='green')
abline(v=sd(v)+mean(v),col='green')

sd(churn$tenure)
sd(churn$MonthlyCharges)

cor_tenure_moncharges<-183.19/(24.55*30.09) # - normalized correlation value between tenure 
# and monthly charges
cor(churn_continous) 

#cor(a,b)<- cov(a,b)/(sd(a)*sd(b)) - correlation forumla

# Recap 
# univariate 
# mean, median, var, sd,
# quantiles, 1st, 3rd, iqr - 3rd-1st will give IQR (inter quantile range)
# boxplot
# scatter plot
# histogram
# covariance
# correlation


churn$TotalCharges







churn$TotalCharges[is.na(churn$TotalCharges)]<-100

#-1 to 1

boxplot(churn$tenure)
text(boxplot$stats)
cor(mtcars)
# -1 is -vely corelated
#+1 is +vely corelated
#0 is not corelated 

#outliers - important piece of EDA - identifying outliers
salary<-c(9,11,54,13,2,15,17)
boxplot()

#2. After identifying the outliers, you have to treat it
#a. removing outliers is one of the steps in treating outliers
#b. you have to treat it meaning some how you include it. 
  # - normalizing - data to treat the outliers
  # accepting the outliers in your model building
  #

#a sev -1 - 3 or 4 - 

#1st May 2020

set.seed(0105)
sample(10)

# corrplot
install.packages('corrplot')
library(corrplot)
cor(mtcars)->cor_mtcars

corrplot(cor_mtcars,method='number',type='lower')

cor(churn_continous)->cor_continous
corrplot(cor_continous)

# Data Explorer package
install.packages('DataExplorer')
library(DataExplorer)

create_report(churn)

sapply(churn,as.numeric)->churn_all_continous

str(as.data.frame(churn_all_continous))->churn_all_continous

corrplot(cor(churn_all_continous))

str(churn)

#=====



cor(churn_continous)
cov(churn_continous)

sort(salary) 

#image data - noise - 

#1080*680*3 - dimension - as matrix/dataframe - arrays - RGB

#ggplot2,shiny,

# Visualization 

data(iris)
View(iris)

plot(iris)
plot(iris$Sepal.Length)
plot(iris$Species,iris$Sepal.Width)

attach(iris)

iris$Petal.Length

Petal.Length

attach(churn)

barplot(Sepal.Width)

barplot(churn$tenure)


par(mfrow=c(2,2))
par('mar')
par(mar=c(1,1,1,1))

plot(Petal.Width,main='Petal Width')
boxplot(Sepal.Width, main='Sepal Width')
plot(Sepal.Length)
barplot(Petal.Length)
hist(Sepal.Length,col='red')

install.packages('RColorBrewer')
library(RColorBrewer)
hist(Sepal.Length,col=rainbow(7))
boxplot(Petal.Length,col='brown')

install.packages('tabplot')
library(tabplot)
tableplot(iris)
tableplot(churn)

categroical - barplot - x categorical column name  - y axis - count
continous - line plot, boxplot, historgrams
continous  - scatter plot
qqplot - distribution of your values and its quantiles. 
cor matrix - 
mosaic plots is for multivariate analysis

install.packages('vcd')
library(vcd)
data("HairEyeColor")
mosaicplot(HairEyeColor)
plot(Sepal.Width,type='l')

#ggplot2

install.packages('ggplot2')

#stats and probability  - 2-3 classes - 
#very volatile, dry, 
#machine learning - Reference of stats is invitable. confidence interval - 
#limitation -  we will be limiting our stats discussion 



churn$Churn<-as.numeric(as.factor(churn$Churn))
lm(Churn~MonthlyCharges+TotalCharges+tenure,data=churn)->model

summary(model)

# 4th May 2020

#25th

library(dplyr)
#churn %>% select, filter, group_by, summarise(

#count, sample_n, 
#sample_frac
#sample_n - returns the rows in number given as input in sample_n
sample_frac(churn,0.23)->c_23_percent

head(c_23_percent)
nrow(c_23_percent)
nrow(churn)

# Assignment 2
toxicity<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/00504/qsar_fish_toxicity.csv",sep=";")

str(toxicity)

colnames(toxicity)<-c('CIC0','SM1_Dz(Z)','GATS1i','NdsCH','NdssC','MLOGP','quantitative response, LC50 [-LOG(mol/L)]')

toxicity_continues<-c(toxicity$CIC0,toxicity$`SM1_Dz(Z)`,toxicity$GATS1i,toxicity$MLOGP,toxicity$`quantitative response, LC50 [-LOG(mol/L)]`)
sum(toxicity_continues)


View(cctrain)
toxicity_continous<-toxicity[,!sapply(toxicity,is.factor)]
toxicity_categorical<-toxicity[,sapply(toxicity,is.factor)]

toxicity_continous
toxicity_categorical

cov(toxicity)
cor(toxicity)->cor_toxicity
library(corrplot)
corrplot(cor_toxicity)

cor_toxicity


par('mar')
par(mar=c(1,1,1,1))

c(5,6,8,8,8,8,23,13,15,3,9,10,54)->age

select(churn,starts_with('S'))->c_starts_with_s
head(c_ends_with_s)
head(c_starts_with_s)

#continue with Visualization
plot(churn$Dependents)
plot(churn$Dependents,col='coral')
plot(churn$Dependents,col='blue',main='Dependents plot')
plot(churn$Dependents,col='lightblue',main='Dependents plot',xlab='type',ylab='count')

hist(churn$tenure,breaks=5)
hist(churn$tenure,breaks=5,col='green')
plot(density(churn$tenure))

install.packages('ggplot2')
library(ggplot2)

#ggplot(....,)+geom_histogram()

ggplot(data=churn,aes(x=tenure,fill=Partner))+geom_histogram()

ggplot(data=churn,aes(x=MonthlyCharges,fill=Contract))+geom_histogram(fill='orange',col='black')

ggplot(data=churn,aes(x=SeniorCitizen))+geom_bar()

ggplot(data=churn,aes(x=SeniorCitizen))+geom_bar(fill='aquamarine3',col='grey')

ggplot(data=churn,aes(x=SeniorCitizen,fill=InternetService))+geom_bar()

ggplot(data=churn,aes(x=SeniorCitizen,fill=InternetService))+geom_bar(position='dodge')

#plot() - not used in real time
#plot.ly
#shiny

ggplot(data=churn,aes(y=TotalCharges,x=tenure))+geom_point()
ggplot(data=churn,aes(y=TotalCharges,x=tenure,col=Partner))+geom_point()

ggplot(data=churn,aes(y=TotalCharges,x=tenure,col=InternetService))+geom_point()

ggplot(data=churn,aes(y=MonthlyCharges,x=Contract))+geom_boxplot(fill='tomato3')

ggplot(data=churn,aes(y=MonthlyCharges,x=PaymentMethod,fill=PaperlessBilling))+geom_boxplot()

ggplot(data=churn,aes(x=tenure,fill=InternetService))+geom_histogram()->g1

ggplot(data=churn,aes(y=TotalCharges,x=tenure,col=InternetService))+geom_point()->g2

g2+facet_grid(~Partner)
g1+facet_grid(~MonthlyCharges)

g1+theme(panel.background = element_rect(fill='lightblue'))

ggplot(data=churn,aes(y=TotalCharges,x=tenure,col=InternetService,fill=Dependents))+geom_point()->g_multi

g_multi+facet_grid(~Contract)

# grade 5 - data - 30 students - 10 -11 10,2 - 5, 10.3 

#6th May 2020

pie(table(churn$MultipleLines))

ggplot(data=churn,aes(y=TotalCharges,x=tenure,col=InternetService))+geom_smooth()+labs(title='Total Charges vs Tenure')

# Machine Learning

exp<-c(1,2,3,4,5,6,7,8,9,10)
hike<-c(2.1,3,4,3.9,5.1,6.3,7.6,8.9,10.4,11.3)

plot(exp,hike)

df<-as.data.frame(exp)
View(df)
df['hike']<-hike

lm(hike~.,data=df)->lm_model

exp_new<-11

predict(lm_model,newdata=as.data.frame(exp_new))->predicted_values

predicted_values

hike
exp
exp_new<-c(11,12,13,14,15,16,17,18,19,20)

predict(lm_model,newdata=as.data.frame(exp_new))->predicted_values

predicted_values

plot(exp_new,predicted_values)



computer$cd<-as.numeric(as.factor(computer$cd))


#0 to 150% -   
#1.1,1.00001

#Regression ML - when your target is a continous variable. 

#hike, only with your exp, maturity, skillset, doamin, how many year 

y=a1x1+a2x2+....+anxn+b - multiple linear regression - 
  
  computer_data.csv -
Two examples - for each ml technique
1. with small datset - 
2. with large dataet - 

different dataset - 
 
#7th May 2020   
  
actual = 2.3
predicted = 3.1

resdiual/error - -0.8

10 - error - (-0.8*-0.8)+ ....
average/mean of error values . - MSE  - mean squared error

square root (MSE)= RMSE - this is the value which gives accuarcy of your LM  - as close to 0 as possible. 

R2 squared, adjusted R2 square - as close to 1 as possible. 

RMSE - 0 to infinity - some 48763, 2345.87, R2 0<R2<1 

coefficient - your slope, a,...

every model, metrics - accuracy, 

#Linear Regression model

computer<-read.csv('Computer_data.csv')

View(computer)

computer$cd<-as.numeric(as.factor(computer$cd))
computer$multi<-as.numeric(as.factor(computer$multi))
computer$premium<-as.numeric(as.factor(computer$premium))

price is my target - rest all columns are my predictors

linear regression - finding linear relation target and predictor.

target - price
prdictors - speed,hd,ram,...trend

y=mx+c,...mathematical calculations,

algorithm - ML algorithm - set of calculation - 
LM algorithm - take values  - results me with a value which am going to check using method prediction()

squares <-function(x){
   x*x
}

squares(15)

lm - linear model (old data) - x (y(old)) - s,r,h....->y(old) - 
  

predict(x, new set of data, ) - y  - s1,,r1,h1, - y(price)

1. milk - packet - 12 - 100ml
2. bread - packet - 18 - 10 loves  - 2 
3. jam - 100gm - 28 - bottle - 1


100Rs - 120 - 140 - 12
  

10001st supermarket - milk  - 100ml -  
  


  
predictors - indenpendent variables - features - synonymous

Target - depedent variable - response - synonymous

underfitting and overfitting - 
  
X -is pattern with monotonous data - very few data - variance - 

1520 - 3000 - underfitting - 
  
4500 - 1800 - overfitting - 

lm() - 85% - 90%  - 93% 
92 91 89

install.packages('caTools')
library(caTools)
split_tag<-sample.split(computer,SplitRatio = 0.75) # - 75%
split_tag

train<-subset(computer,split_tag==T)  # fitting my data/ training my model
test<-subset(computer,split_tag==F)

#training dataset , validation/testing dataset

lm()

summary(lm_model)


View(train)
View(test)


# train/test - recap - 
lm(computer)

youtube - 3.5

stattrek.com 
  
datasciencecentral.com 

#8th May 2020

exp
hike
plot(exp,hike)
lm(hike~exp)->model
exp=c(11,12,13,14,15)
summary(model)
predict(model,as.data.frame(exp))->predicted_values

lm(price~.,data=train)->reg_model

summary(reg_model)

#h0 - price will definitely change/effect with respect to computer configuration
#Ha - price will never change
#EDA - decide the model
#you stats test - should try to prove your H0 - 

Rejecting H0 == Accepting Ha

-ve - absolute or saure the value 

head(reg_model$fitted.values)


library(caret)

RMSE(,test$price)


# Take an assignment - 

Take the cars data set
1. split into 70:30 ratio train and test
2. figure out target variable
3. lm (linear regression)
4. summary(model)
5. analyze and check the accuracy or R2 value.

####12th May 2020

# How to find out which are the better variables to be choosen for Models?
#1. cov, cor amongst the variables 
# EDA part of your dataset
#two variables - day 1,2,3..., another variables grocerysales. 
# 

data(mtcars)
str(mtcars)

lm(mpg~., data=mtcars)->cars_model
summary(cars_model)

#1. take everything(all variables) and come up with a model.
#2. correlation of variables and then include/exclude variables
#3. re iterate the process with some more EDA. 

#2nd way 
#1. complete EDA
# 2. choose the variables and try out the model. 

# Dimensionality Reduction - 
150 variables - 35 variables which are really influencing your target. 

emp - id, dob, address, base, ...total sarly, exp, skillset,...hike,

# feature extraction and feature reduction
# PCA - principal component analysis
150 - PCA - varibles variance report - total_sal - 156.89, skillset  - 987.45

34%
#model - 

# created a model - R2 - 

#1. create a model 
#2. predict the model - validation/testing the model for its accuracy and other metrics

#train and test datasets
View(test)

predict(reg_model,newdata=test)->predicted_values
length(predicted_values)

test['predicted_values']<-predicted_values
View(test)  
# RMSE value - ACCURACY for linear regression
# mean(sum(square(actual_value - predicted_value)))
library(caret)
RMSE(predicted_values,test$price)

R2squared value - % accuracy - 77%, 34%..., 

RMSE value should tend towards zero - > 0, 

summary(reg_model)

# RMSE  -infinity - 0 > 0 > 1000

# day, grocerysales - 
# 99.99% - 

#100 records - computer dataset - 99%.91 on each -$100 - 99.90 to 101.90

# Classification - ML 
# 6 classfiction techniques -
# Logistic Regression 
# DT
# RF
# KNN
# Naive Bayes
# SVM 

#Probability - 
score<-c(10,20,39,45,57,73,22,109,95,49), 13, 158, 3
result<-c(0,0,0,0,1,1,1,1,1,0)    0,1,0,
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

score<-c(15,28,32,47,68) # testing
result<-c(0,1,0,0,1)
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
ifelse(lg_predict>0.3,1,0)->lg_pred_updated
confusionMatrix(factor(result),factor(lg_pred_updated))

#14th May 2020
yes,no, maybe,

sunny,rainy,windy-> target


