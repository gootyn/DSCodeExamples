# Module 4
# Read files into R
# already discussed read.csv(). 
# Let us see further options on read command
# Read out slide # 4
# Read out slides till 20
# install package "foriegn" and invoke to read SPSS and SAS datasets
# xplain in brief and give assignment to participants on spss and sas datasets

#slide # 23 - ODBC connection in R
# read out and ask participants to install package 'RODBC' and invoke it

install.packages("RODBC")
library(RODBC)
odbcDataSources()
# above command will list all the odbc drivers installed on your machine
# bunch of other commands related to ODBC. readout or explain
# ask participants to explore them 
#explain slide # 24 and 25
# odbc driver functions are shown in slide # 26 to 28
# show it to participants and ask them to explore

#Slide # 32 - WebScrapping
# Explain web scrapping
# show slide # 32 to participants
# explain in brief
# slide # 33 - R Commander
# for analysing data using R commander
# Ask participants to google and install r commander if they don't have it already
# ask them to explore it on their own
# Read out the pre work for module 5 - important
#====================

# MODULE -5  - Exploratory Data Analysis
#Explain what EDA is for 2 minutes - refer to slide # 6
# Data Exploration include outliers, examining relationships, missing values, etc
# Explain different, graphs/plots like histograms, 
#bar,line,pie,doughnut charts, box, violin,scatter plots
# Readout the objectives in slide 3
#cor() function
#Talk about fancy plots
#explain slide # 5 to participants

#Take the example of mtcars dataset in R
data(mtcars)
head(mtcars)
# attach command attaches the database to R search path
# after attach is used, you can directly refer to the attributes without $ and df name
# eg: mtcars$mpg - after using attach, directly you can use mpg
attach(mtcars) 

#Slide # 9 - Data Exploration functions

summary(mtcars)
# describe() and summarie - #in Hmisc package

#Hmisc package contains powerful tools for data analysis, high level graphics and functions
install.packages("Hmisc")
library(Hmisc)
summary(mtcars)
#summary function describes the 5 point summary of data attributes in the dataset. 
# it gives min,max, median, 1st and 3rd Quartile
describe(mtcars)
#describe command will give you the snapshot of how your data is in the dataset. more detailed summary
summarize(mtcars$mpg,mtcars$cyl,mean)
#explain summarize command - its a faster version of summary. 
# syntax is summarize(input,groupby, function). 
# I prefer summary to summarize. 
#llist - function
#llist is used if you want more than one column to be used in group by
#eg: summarize(mtcars$mpg,llist(mtcars$gear,mtcars$hp),summary)

# Other exploration functions
mean(mtcars$mpg)
var(mtcars$cyl)
sd(mtcars$disp)
unique(mtcars$am)

# aggregate function
aggregate(mpg~cyl,data=mtcars, mean)
# above command will give you mean of mpg columns grouped by cyl column

# Corelation Analysis
# Corelation is nothing but a mutual relationship between two or more things
# in statistical analysis, corelation is a class of dependencies
# eg: Corelation between price and demand of a product. 
# if demand is more for a product, obviously the price will be more and vice versa
# How a corelation is useful here? it indicates the predictive relationship which can be exploited in practice
#cor() in R
cor(mtcars)
#explain corelation
# positive values mean positive corelation, -ve values mean -ve corelation or less corelation.
#higher the value, higher is the corelation

#corrgram function from corrgram package will give graphical output
install.packages("corrgram")
library(corrgram)
corrgram(mtcars)

#red indicates -ve
#Blue indicates +ve. 
#higher teh shade, higher teh corelation

# Data Visualization 
# plot function
plot(mtcars$cyl)
plot(mtcars$mpg)
# if x and y are not defined, then x will be plotted on default values. 
#plots examples in slides are not good till slide # 25 - avoid it
#Slide # 26 - Box Plot
# explain Box Plot
#boxplot will give you the 5 point summary of an attirbute/column
boxplot(mtcars$mpg)
#explain boxplot
# bottom line is max(min(x)) - 1st quartile - 1.5 * inter quartile range
# top line is min(max(x)) - 3rd quartile + 1.5 * inter quartile range
# middle thick line is Median
# below the median is 1st quartile
# above the median is 3rd quartile
# distance between 1st and 3rd quartile is inter quartile range
#boxplot for two variables
boxplot(mpg~cyl, data=mtcars, main="Car Mileage Data", xlab='No of cylinders',ylab='Miles Per Gallon')
# some fancy plots examples
# refer to slide 29
# explore the cars which have identical properties/features
# Confusing example in the slide  - try to avoid it
stars(mtcars,draw.segments = TRUE,key.loc = c(13,1,5))
#HC PLOT - Hirerchial clustering plot
# Read out the assignment in slide # 37
# ask the participant to complete the assignment
#=====================

# Module -6 - Data Visualization
#
# Slide # 3 - Read out the objectives
# Slide # 4 - Read out
# Slide # 5 - show it to participants and ask teh questions in the slide
#slide # 6 - Same for this slide 
# Slide # 7 and 8 - explain it
# Basic Graphs in R
# pie, line, bar, Rug, box and histograms
#plot() function - plots the entire object
data(iris)
#explain iris dataset in brief
plot(iris)
head(iris)
# this output is not informative and rather clumpsy
# let us plot it first on two variables
attach(iris)
plot(Species, Sepal.Length)
#plot() function will decide which plot is the best
# order of input in the plot is important
# let us try for single attribute
plot(Sepal.Length)
#now the plot gives scatter plot
#stem and leaf plot - Need to check the pre recording
stem(Petal.Length)
View(iris)
#line graph
plot(Sepal.Length,type='l')
# normally, this type of graph is used for time series
plot(Sepal.Length,type='s')
#Bar plot
barplot(Sepal.Length)
#Pie graph
pie(table(iris$Species))
table(Species) # is a group by function in sql
#histogram - it plots the frequency of data that appears in a range called bins
hist(Sepal.Length)
#box plot with rug
boxplot(Sepal.Length)
rug(Sepal.Length,side=2)
#what is rug? Create a set of tick marks along the base of a plot.x – The values at which to create tick marks
#– Several additional options are available, including the height of the tick marks (ticksize); the side of the plot that tick marks should be placed, where the default is the bottom (side); line width (lwd); color (col); among others.

# Customizing graphs
# if you want to show more than one graph on a single page or screen
par(mfrow=c(3,2))
#par(mfrow) is used to create multi panel plots
# if you get Error in plot.new() : figure margins too large error
# check par(mar) first
#par("mar") # you should get  5.1 4.1 4.1 2.1
#change it to par(mar=c(1,1,1,1))
#par(mar=c(1,1,1,1))
plot(Sepal.Length)
boxplot(Sepal.Length)
plot(density(Sepal.Length))
plot(Sepal.Length,type='l')
hist(Sepal.Length)
plot(Sepal.Width,type='o')
# customizing graphs
# you may add titles, lables, colors to look bright and informative. 
#use xlab for x axis lable and ylab for y axis label
# main for graph title
#col for colors
plot(Sepal.Length,main="Sepal Length",col='green',xlab='index',ylab='Length')
par(bg='orange')
boxplot(Petal.Length)
#use different colors in teh graphs 
# you may use, rainbow, heat colors - all these are themes of colors
# explain about R color brewer package
#install.packages("RColorBrewer")
library(RColorBrewer)
hist(Sepal.Length,col=rainbow(7))
hist(iris$Sepal.Length,col=brewer.pal(3,"Set2"))
#Ask Participants to explore at their own pace for different options and different colors.
# Table Plot - tabplot()
#install package tabplot
install.packages("tabplot")
library(tabplot)
tableplot(iris)

# for multi variate visualization VCD plots is shown below
# VCD is for categorical data
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor)
HairEyeColor

mosaic(Titanic)

# Heatmap - to show the correlation in graph
# data should be continous variable or numeric only
heatmap(as.matrix(mtcars))

#Spatial Analysis
# install package raster
# raster package is used to analyze geographical data
#below example shows altitudes in india
install.packages('raster')
library(raster)
alt<-getData('alt', country='IND')
plot(alt)
gadm<-getData('GADM',country='IND',level=3)
head(gadm)
atp<-subset(gadm,gadm$NAME_1=='Andhra Pradesh')
plot(atp)

# Not able to download r commander package in my laptop
# if you could install and invoke the packages, please use it and explore
# also kmggplot2 is not available. 
#slides are older in the module. need to update it
install.packages("kmggplot2")
library(Rcmdr)

# read out slide 45 - pre work for next module - machine learning
#ask the participants to do the assignment