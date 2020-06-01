library(dplyr)
install.packages('DT')
library(DT)
# MAIN PACKAGE FOR RECOMMENDER SYSTEM
install.packages("recommenderlab")
library(recommenderlab)
data('MovieLense')
movielense<-MovieLense
summary(movielense)
class(movielense)
View(movielense)

nrow(movielense)
ncol(movielense)

#1 to 5 - 1 being lowest rating
# don't want to recommend every other movie

# Extracting data tha comprises of at least 20 ratings per user and 50 ratings
# per movie

movielenseorig <- movielense
movielense <- movielense[rowCounts(movielense) > 20, colCounts(movielense) > 50]
minrowcnt <- min(rowCounts(movielense))
nrow(movielense)
ncol(movielense)

# User based collaborative filtering
set.seed(111)

sample_data<-sample(x=c(TRUE,FALSE),size=nrow(movielense),replace=TRUE,prob = c(0.8,0.2))
sample_data
train<-movielense[sample_data]
test<-movielense[!sample_data]
train
test

# Create a REcommender system - UBCF model
ubcf_model<-Recommender(data=train,method='UBCF',parameter=list(nn=25,method='Cosine'))
ubcf_model
num_rec<-10
# let us recommend top 10 movies to each of users
ubcf_predict<-predict(object = ubcf_model, newdata = test, n = num_rec)
class(ubcf_predict)
View(ubcf_predict)


ubcf_df<- data.frame(user = sort(rep(1:length(ubcf_predict@items), ubcf_predict@n)), 
                      rating = unlist(ubcf_predict@ratings), 
                     index = unlist(ubcf_predict@items))

names(ubcf_df)
View(ubcf_df)

ubcf_df$title[1:30]
ubcf_predict@itemLabels[ubcf_df$index]
sort(ubcf_predict@itemLabels)

ubcf_df$title<-ubcf_predict@itemLabels[ubcf_df$index]
View(ubcf_df)
ubcf_df <- ubcf_df %>% group_by(user) 


filter(ubcf_df,rating >3.0 & user == 24)
# from DT Library to have interactive output

datatable(ubcf_df[ubcf_df$user %in% (1:10), ])

#================================
#Item based collaborative filtering

ibcf_model<- Recommender(data = train, method = "IBCF", parameter = list(k = 25, method = "Cosine"))
ibcf_model
num_rec<- 10  # Lets recommend top 5 movies to each of users

ibcf_predict <- predict(object = ibcf_model, newdata = test, n = num_rec)
ibcf_predict
ibcf_df <- data.frame(user = sort(rep(1:length(ibcf_predict@items), ibcf_predict@n)), 
                    rating = unlist(ibcf_predict@ratings), index = unlist(ibcf_predict@items))
ibcf_df$title <- ibcf_predict@itemLabels[ibcf_df$index]

#ibcf_df <- ibcf_df %>% group_by(user) %>% top_n(5, ibcf_df$rating)
# ibcf_df

ibcf_df$title<-ibcf_predict@itemLabels[ibcf_df$index]
View(ibcf_df)
ibcf_df <- ibcf_df %>% group_by(user) 

#filter(ibcf_df,rating >3.5 & user == 5)


datatable(ibcf_df[ibcf_df$user %in% (1:10), ])
