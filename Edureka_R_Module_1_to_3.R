# A Simple mathematical operation

(12*13)*(8*9)^2

# to execute the statement, click run above or Alt+enter in windows, Command+enter/return in mac

# another mathematical operation - here get the log value of 10. 
log(10)

# Variable assignments - three types
x<-55
55->y
z=55

# To check the value simply type
x
y
z
# or print(x)
print(x)
  
# or use cat() function
cat(x,y,z)

#interactive input - scan() - only real values allowed. no strings
#press double enter to stop

vector1<-scan()

# working directories
# setting and getting 
getwd()
setwd('C:/Users/ngooty/Desktop/Edureka')
getwd()
system('ls -l')

#Datatypes
#Vectors
# most atomic datatype in R which takes homogeneous elements
var1<-c(1,2,3,4,5)
var1
#coercing to character value happens when hetrogenous elements are in the vector. 
#Coercing to numeric values happen when logical/boolean values are there in the vector

var2<-c(1,3,'a',5,'string',6.5)
var2
var3<-c(1,6,TRUE,8,FALSE)
var3
#Lists
#if the homogeneity is discounted/relaxed then the datatype is list. coercing still applies. 
list1<-list(c(1,32,4,5))
list1

list1[1]
         list1<-list(c(1,8,'c','string',6.89))
list1
# you can have list of lists
list2<-list(list(c(1,3)),5,6)
list2
list3<-list(a=1:4,b='string',c='name')
list3
list3[2]
list3$a[1]
#Hirerchial lists
cars<-list('merc','bmw','swift','jeep')
price<-list(3,2.5,0.3,1)

car_prices<-list(cars,price)
car_prices

#Matricies
# if you add dimension to the list then it will be a matrix
# so a matrix is 2 dimensional and homogeneous that is coercing applies!
# Matrix made from vectors would be coerced
# Matrix made from lists will not be coerced
matrix(c(cars,price),nrow=2,byrow=T)

matrix(c(1:4),ncol=2)
matrix(c(1:6),nrow=3)
#DataFrames
# if both homogeneity and dimensionless are relaxed, a dataframe is obtained. 
# a data frame is 2 dimensional and hetrogeneous
# simple terms -its a table in a database or an excel sheet data
# combination or rows and columns

# Creating a data frame
ind=c(1,2,3,4,5)
data=c('Apple','Banana','Guava','Litchi','Pear')
d<-data.frame(ind,data)
d
# going forward, you will be importing data from an csv file, excel sheet or database or a url into a dataframe
# which will be dealt a bit later

# Class activity - check the ppt - slide # 15

# Functions in R
#What is a function?
# explain sub-routine, function 
#explain built in functions - eg: mean, median, min, max etc
# user defined functions
# to define a function - assign it to a name and the keyword "function" which denotes the start of the function
# simple Example
# Square of a number
square<-function (x){
  x*x
}

square(4)
# explain the function in detail - every word involved and steps involved like braces etc
# another example
product<-function (x,y){
  x*y
}
product(6,3)
# in built functions
# seq()
# seq() function is used to generate a sequence 
seq(1:10)
seq(1,10, by=2)
#Some other built in functions
max(1:10)
mean(1:5)

# Annies questions - refer to PPT - slides 20 to 23

#slide # 24 - Problem statement 1
#Before answering the problem -
#Show them the following
getwd()
setwd('to the directory')
getwd()
system('ls -l')
df<-read.csv('transaction_data.csv')
df
View(df) # - Capital V
# explain how to retrieve column at this point of time. 
df$creditLine
sort(df$creditLine)
ind<-order(df$creditLine)

df[ind,]
df

# what if you want to sort in descending order?
# use rev()
df[rev(ind),]

# Problem statement -2 slide # 27 - explain - cbind() function
#explain cbind function
#cbind is used to combine the data column wise
#row number of the two datasets must be equal

system('ls -l')

plasma_df<-read.csv('Plasma.csv')
plasma_df
diabetes_df<-read.csv('Diabetes.csv')
diabetes_df
merged_df<-cbind(plasma_df,diabetes_df)

nrow(plasma_df)
nrow(diabetes_df)

View(merged_df)

#Problem statement - 3 slide - 29 - rbind() function
#rbind is used to combin the data row wise
#here columns should be same in both the datasets

transaction<-read.csv('transaction_data.csv')
transaction
hour<-read.csv('hour_transaction.csv')
hour
all_transaction<-rbind(transaction,hour)

ncol(transaction)
ncol(hour)
all_transaction

#Problem Statement 4 - Slide - 35
#Explain the rows and columns of both the datasets are not same
#so rbind or cbind cannot be used. 
#we will use merge command

credit<-read.csv('creditdata.csv')

dim(all_transaction)
dim(credit)

#Observation - I have used ncol, nrow, and now dim functions
#Observe the usage of different commands and its purpose

credit
creditcard_data<-merge(all_transaction,credit)

# Question - is the merged data correct?
# on what basis merge has happened?
# why only 5 rows are merged?

#Answer - merge happens on a common column or key - here it is customer id. 
# while working with rbind and cbind, no keys were involved. 
#Question - Now what to do if you want all rows to be merged?
# Answer - use merge command with "all=TRUE" argument

creditcard_data<-merge(all_transaction,credit,all=TRUE)

#Observation - explain the NA values in the resultset. 
#NA stands for missing values

# Merge using dplyr() package
library(dplyr)
full_join(all_transaction,credit)

#Ask the audience to check out left, outer, inner and other joins

#Module 2 - Slide - 41 - Subscripting/sub setting
# Obtaining parts of a vector
# using the R's index notation to pick specific items in vector
#logical vectors

# Let us take the df we have used before
# let us take transaction df

transaction[3,4]
transaction$creditLine

# what if I want to see the 3rd value of this column

transaction$creditLine[1:4]
transaction[3:5,2:4]

#explain length() function here
# Dropping an element
transaction$creditLine[-1]

#Problem statement 5 - slide -44

creditcard_data

sum(creditcard_data$fakeID_Cardholder)
sum(creditcard_data$fakeID_Cardholder,na.rm=TRUE)
creditcard_data$balance[creditcard_data$balance>3000]


#Arrays
#creating and subsetting arrays
a<-array(1:15,c(5,3))
a
a[,2:3]
a[1:2,]

cars
cars[1]
cars[[2]]


# built in datasets in R
data()
data(iris)


## Module 3 - Data Manipulation 
#Objectives
# Data Cleaning - various steps
# functions used in data inspection
# problems faced in Data Cleaning
# functions like grep(), grepl(), sub etc
# coerce data
# apply() function

# Data Cleaning - explain - readout the slide - 5
# Explain why data cleaning is important
# Why it should be done

# Slide 6 - titanic victims - example
#victims.txt file in datasets to be downloaded

# from the slide -6 - read out the problem
# to find mean birth year of victims
getwd()
setwd('C:/Users/ngooty/Desktop/Edureka')
victims<-readLines('victims.txt')
victims

# let us create a data frame from victims
df<-as.data.frame(victims)
# explain as.data.frame() function in brief

df

# Explain this is not a valid dataframe and can't be used in anyway

#Slide - 11 - Data inspection
# inspection - generally involves
#1. datatype of the data
#2. structure
#3. no of attributes
#4. any missing values are there or not
# after checking these features, we can decide whether data provides is apt for our requirement or not
# Now let us see some functions used to inspect data.
# we will use the same victims and df

# Class() function gives the datatype of the variable

class(df)


#length() function gives the length of the object.

#length(victims)
length(df)

#nrow() function returns the no of rows
nrow(df)

#ncol() function returns the no of columns

ncol(df)

#dim() function returns of dimension of the object
dim(df)

#str() function gives the structure of the dataframe

str(df)

#Here obs is nothing but rows and variable is nothing but column
#df has 11 rows and 1 column

#Slide 14 - Inference
# data is stored in 1 column
# comments are also included as data
# datatypes are compromised

# So, we have to clean teh data before we proceed further 

#question - what are the things we have to do as part of cleaning? 
# expect teh answer and proceed
# Explain - 
#1. we have to first remove the comments
#2. split the lines into different columns
#3. transform this into a data frame
#4. convert the data into its correct datatype eg: 1910 will be coerced as "character"
#   Needs to be converted to integer

#Slide - 15
# first let us select the lines containing comments
# here comments are starting with % symbol
# How do we do that?
# we will use grepl() function for this
#it is a string manipulation in R
# explain what is string manipulation if necessary
comments<-grepl("^%",victims)
#Explain grepl() function
# "^%" is the search pattern
# ^ symbol indicates that the first character of line to be searched
#Question : what is the symbol used to check for the last charater? ($ is the answer)
#comments<-grepl("$%",victims)
comments
# let us see what comments variable has
# it has the logical values of each line matched with search pattern.
# it has TRUE value if the pattern is matched else FALSE value

# this is fine, but we want to remove the commented linies. That's our objective.
# it can be done like this

lines<-victims[!comments]
# Explain the above command
# Carefully see the above command
# we are using values of comments variable as index to the list to be retrivied.
# "!" symbol is used for negation (that is negative value). Here TRUE is positive and FALSE is negative
# lines is the new variable resulting in lines without comments

lines

# Now, our first step or removing comments is completed. Any questions?
# grep() will give you the row numbers of teh matched patterns
# grepl() will give you the logical values of the matched patterns
comments_grep<-grep("^%",victims)
comments_grep
victims[!comments_grep]

# Let us see some more regular expression as part of string manipulation functions

# Suppose if you want to remove 1st digit in a line

lines[1]

# for this we use, sub() function
# sub() function takes the following syntax
#sub(pattern,replacement,variable)
#explain the above command in detail

sub("[[:digit:]]","",lines[1])

#Explain [:digit:] is?
# in R, certain classes of patterns are predefined. 
#:digit: is predefined pattern which will search for digits 0-9
# like wise, [:alnum:] is there for alphanumeric characters
# [:blank:] for blank characters, space, tabs

# now, if you want to remove all the digits in the line
# then use gsub()

gsub("[[:digit:]]","",lines[1])

# Any questions?
# recap - sub replaces the first occurance of the pattern 
# gsub replaces all the occurance of the pattern

# typically these commands are used in string manipulation as part of data cleansing process
# another regular expression is regexpr() function

# Suppose you want to know the position of a character in a string then we use regexpr() function
# let us see this

lines[3]

# Now, I want to find out the poistion of say 0 (zero) in variable lines

var<-"19192334022"

regexpr("1",lines[3])

# Explain the detail of teh output - like match postion, length of the match etc

# If you want to see all the occurarences then use grepexpr()
gregexpr("1",lines[3])

# Summarize - grepl, grep, sub, gsub, regexpr, gregexpr()
# Let us go back our data cleaning process
# till now we have done
# 1. Remove the comments or any line based on pattern matching
# 2. select the lines containing data or a pattern
# we have our lines variable

lines

# Each line is combined with the fields 
#eg: Anothony sounds like a name, 1870 is a number and 1912 is also a number 
# but all are stored as one line. ofcourse with comma as a separator
# now, I want to split this line into different fields
# I will make use of comma as a separator
# I will use a function called strsplit().
# as the name implies, it splits the strings

splitLines<-strsplit(lines,split=",")
splitLines

#explain the command, arguments split etc
#Explain the output also - Result is character vectors
# Now the result looks like a data frame. and can be converted to a dataframe
#
class(splitLines)

#Let us create a matrix from this list and then coerce into a dataframe. 
#this is the easiest method.
# the longer route is write a function to reach each value in the list, store it different vairables and then create a data frame

Lines<-matrix(unlist(splitLines),nrow=length(splitLines),byrow=TRUE)

# unlist will unlist the values in the list and create a large character vector
#byrow is used cos the values as stored ina list as concatenated rows
Lines

# observe that the column names are not present
# they are shown as ,1, ,2 and ,3 (index values of columns)
# Now we got a matrix and we will convert it into a data frame
# before that let us add column names using colnames() function
#run colnames(Lines) which will give NULL as result

colnames(Lines)

# explain colnames function() 
#

colnames(Lines) <-c("Name","BirthYear",'DeathYear')

#Now again run colnames(Lines) which will result in column names added
# again, run Lines which wil give the matrix with column names added.

titanic_victims<-as.data.frame(Lines, stringsAsFactors = FALSE)

# Explain stringAsFactors in the above command
#Factors is kind of categorical values stored in R. 
#setting it to false means, the data stored in the dataframe is only strings. 

titanic_victims
str(titanic_victims)

# Now, we have cleaned the data, removed the comments, added to a dataframe
# one thing left in this process
# that is all the values in the dataframe is stored as char strings
# birthyear and deathyear values should be numeric not strings
# so we will convert it to its correct datatype
# for this, we will use as.numeric function
# to access a column in a dataframe we use $ 
titanic_victims$BirthYear<-as.numeric(titanic_victims$BirthYear)
#Similarly
titanic_victims$DeathYear<-as.numeric(titanic_victims$DeathYear)

str(titanic_victims)
# Recap of what we have done as part of data cleansing
# now we can apply mathematical functions on the numeric values in the dataframe
#eg:
mean(titanic_victims$BirthYear)


#Story: - In Real world scenarios, all the data provided to you will be in the right sense. 
# there may be comments added in the data as we just saw
# there may be wrong data types
# There may be null values
# there may be some junk values which treated as null values
#Module 3 - Slide -36 - new problem statment - read out
# Let us look at this problem
# Here "99" and "-99" should be treated as null values
# how will the system/program treats it as null values. cos for the system it is a numeric value
#As a data analyst you have clean or treat the data and make 99 and -99 as na values
# this can be done by apply() function

telecomCalls<-read.csv('telecomCalls.csv')
telecomCalls

#apply() function is a smart function which keeps you away from writing big loops to perform opereations on every row or column. 
# a small function or piece of code is directly applied to all the rows or columns on the matrix or dataframe

clean_callsdata<-apply(telecomCalls,MARGIN=2, function (x){ifelse(x==99|x==-99,NA,x)})
clean_callsdata

#Explain the above command in details
#explain ifelse command
#explain, MARGIN - 1 for rows, 2 for columns
#explain function and how it is applied using apply function
# regular apply function is used on dataframe and matrix

# ask confirmation on apply function
#we have other flavours of apply function
# lapply, sapply, tapply, vapply
# take it as an assignment from myside. 
# I request you try that on your own and see the difference. 
# if you get stuck, then I will help you out

# slide 50 - summary of apply functions and its flavours - read out
# slide 51 - pre work to students - read out
# slide 52 - assignment to students - read out
# slide 54 - agenda for next class
# Summarize and recap the class and module
# Ask for feedback
