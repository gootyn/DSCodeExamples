#SEntiment Analysis
#install package twitteR and invoke the same
install.packages('twitteR')
install.packages('syuzhet')
library(twitteR)
ls('package:twitteR') #-functions present in a package

#Twitter authentication app keys

consumerkey<-'xg8yJ7oX2HTq4FSV0QPYDnhV7'
consumersecret<-'tLd5kThiWFpKcJYLXH2hhcWSlOzuGpq59JeFRGFbG6ATs9rjih'
accesskey<-'56357933-NRZMiqXLLjSTLE7CPMjZr4QUfyXvmp52IMdpfuSpq'
accesstoken<-'T1TUR5RoEoXZiT6R4uj7qT7cwx4MGxu2KGpM9xetMW8iR'

#Authenticate twitter account in R
setup_twitter_oauth(consumerkey,consumersecret,accesskey,accesstoken)

#loading tweets from Donald Trump

tweet_trump<-userTimeline('realDonaldTrump',n=500)

class(tweet_trump)
tweet_trump
#convert the tweets into a dataframe as the tweet_trump is a list data type

trump.df<-twListToDF(tweet_trump)
head(trump.df)
View(trump.df)
#Remove hashtags and hyperlinks
trump.df2<-gsub('http.*',"",trump.df$text)
trump.df2<-gsub('https.*','',trump.df2)
trump.df2<-gsub('#.*',"",trump.df2)
trump.df2<-gsub("@.*","",trump.df2)

View(trump.df2)

# Get the different emotions present with the get_nrc_sentiment

library(syuzhet)

#Convert trump.df2 to a vector
word.df<-as.vector(trump.df2)
View(word.df)
emotion.df<-get_nrc_sentiment(word.df)
emotion.df
emotion.df2<-cbind(trump.df2,emotion.df)

View(emotion.df2)

#getting sentiment score

sent.value<-get_sentiment(word.df)

sent.value
#get most positive sentiment values
max(sent.value)
range(sent.value)
most.positive<-word.df[sent.value==max(sent.value)]
most.positive

#get most negative sentiment values
min(sent.value)
most.negative<-word.df[sent.value==min(sent.value)]
most.negative

# Postive Tweets
positive.tweets<-word.df[sent.value>0]

#negative tweets
negative.tweets<-word.df[sent.value<0]

#neutral tweets
neutral.twees<-word.df[sent.value==0]


#Getting the count of +ve, -ve, and neutral tweets
length(positive.tweets)

positive.tweets

length(negative.tweets)

length(neutral.twees)


