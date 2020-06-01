
http://archive.ics.uci.edu/ml/index.php
# datasets for learning and testing

# # Module 7
# # 
# # data mining
# # clustering or segmentation
# 
# Data mining is gathering,selecting, processing, exploring and getting the right data for analytics. 
# 
# 
# Machine Learning
# part of artificial intelligence. 
# making a machine behave like human. take decisions on its own. 
# by using the past data and infer the outputs and mimic the same with the new data. 
# 
# eg: google driverless cars
# they have put censors and cameras on the car and its parts vital to study the behaviour of driving by a human.
# they captured the pressue of accelerator pressed,
# capturing the angle of streeing wheel while taking turn. 
# capturing what features to be used and when, say, when to switch on head lights, when to use wipers, when to apply breaks
# etc
# they captured all these data and made the machine learn the behaviour of driving using the huge data. 
# 
# 
# 
# types of machine learning
# Supervised and un supervised
# what is supervised learning?
# when we have data and the target/labels/results from the data with us. and using this data we train our systems to learn
# the behaviour from the past data. 
# and Allow the system to behave in a similar fashion when new data is presented. 
# 
# eg2: A kid stars learning by observing what his/her parents do. 
# what people do? how they speak, how they walk, how they hold things
# and then starts to imitate the same. isn't it?'
# The kid stores all the behaviours of their parents' actions and starts immitatiing on his/her own. 
# be it talking, recognizing the things, doing some action etc. 
# 
# This is supervised learning. 
# 
# eg3: Suppose you are working in a bank credit card department. 
# You have a historical data of fradulent transacions. Types of frads done in the past. transactions on how the fraud is done
# and you know the result/target variable of it. 
# now when some one new tries to do a fradulent transaction, your system is trained in such a way to predict/estimate/assess
# whether it is a fraudulent transaction or not. 
# 
# UnSupervised learning
# 
# eg: we don't have target variable in unsupervised learning
# 
# Refer to slide 7 - explain the supervised learning
# multiple images of elephants and lions
# 
# refer to slide 11 - explain the unsupervised learning
# ask teh question to participant
# what is the slide conveying?
# 
# basket of fruits - I don't know what fruits are there in the basket. 
# I'm feeding this basket to the system and ask it to segregate it. 
# how we tell the machine to learn here is. 
# we will make the machine to learn the characterstics of different fruits. 
# for eg: the color of banana is yellow or greenish yellow, its length, etc
# the color apple, its weght, size, shape of it etc
# likewise for all the fruits. 
# then segregate or group the similar fruits with same characterstics. 
# machine will come up with some rules to segment/segregate the items. 
# this is unsupervised learning. I do not know the target variable here. 
# 
# eg2: supervised learning - is nothing but a class with a teacher. Here teacher is past data. student is a machine. 
# if a student does a mistake, teacher knows what the mistake is and the solution for that problem. 
# cos the teacher already knows how to rectify the mistake. 
# 
# unsupervised learning - students are learning on their own, say making a group discussion, collaboratively studing
# then it is unsupervised learning. Here students learn from each others mistake. 
# 
# are we clear of these concepts?

what is clustering? - question to participants

clustering is grouping of items where the items in each group have same or similar characterstics. 
eg: suppose, if I ask this class to group on gender - males as one group and females as another group. 
I get two groups. and in each group, i will have people with similar characterstics. 

why clustering in business? 

To understand the need of customer. understand teh requirements, preferences of the customers.
I can't give one size fits all solution to all the customers. 
It makes easy for business to understand and cater to different group of customers. 

am I clear about clustering? 

another example of clustering - employee performance rating !

Now that we know what is clustering. 
let us discuss about popular type of clustering used in business. k-means clustering

k means clustering algorithm works on the concept that the clustering of data is done into K-clusters 
If I say - value of k is 3, then the data is divided into 3 clusters, if k is 5 then data is divided into 5 clusters

when I say k=3, then my algorithm picks 3 random data points. (randomly picks the data points)

show the ppt - and change the color of it 
I call these random data points as SEEDs. 

now what will happen is, distance will be calculated from these seeds to all the data points

eg: - show a distance calculation from a datapoint to all the three seeds
aks teh participants which seed is nearest to the data point?
clearly shows, the datapoint is closest to seed 2.
so the data point becomes part of seed 2.

now, for every datapoint, the distance is calculated from all the seeds
and grouped according to the closest distance.

show the datapoints closer to each seed and explain in which group it will be part of
after the distances are calculated, you will see an imaginary shape created 
show it in the ppt - draw it with pen in goto app

repeat what you did just now

am I clear? I got 3 clusters here

I will say, this is first iteration. 
in the second iteration - the center point of these three shapes would be calculated

show the center points in the shapes created
AGain the steps of calculating the distance from the center to all the datapoints are done. 
with this new calculation the shape changes 

show an imaginary shapes again by drawiing using pen. 

as the seeds are changed, the distances are changed and new shapes are created. 
This process will be repeated. 

Till what time is this process be repeated?
till the seeds become stationary. that means, the distance between the datapoints and the seeds choosen won't change
at that point, it is said that the algorithm is converged - kmeans algorithm is converged
and I got the stable clusters

Repeat the steps done. 

we won't be progrmming each and every step of this iteration here. 

As I told you we have built in packages and functions which does that for us. All you need to know is the concept
behind the function

Now show the second slide in your ppt. 

couple of terms I would like to introduce to you here regarding the strength of clusters.
There are two terms on which we evalluate the strength of clustering

1. Betweenss - is the average distance between the centers of teh clusters

Now - for a good cluster, what should be the value of the betweenss? should it be a big number or small number?
The answer is, it should be a big number.
reason is, clusters should be well separated/spaced. 

2. Withinss - is the average distance between the data points in the cluster. Obviously, the number/value should 
be smaller. if I have 3 clusters then I will 3 withinSS values

Repeat it again

if I talk about the ratio of betweenss to withinss, it should be a big number. which is known as the strength of
the cluster - 
SS Stands for sum of squares - 

How do you calculate the distance between two points? 
point A is (x1,y1) and point B is (x2,y2) then the distance between them is 
sqrt((x2-x1)^2 + (y2 - y1)^2)

Proceed with R Studio for k means clustering
explain what set.seed(random number) is
set.seed(1234)
sample(1:100,10)
run sample command a few times and put set.seed() and show the example

then proceed with k means clustering
run kmeans() function on mtcars

explain the output
km<-kmeans(mtcars,3)
km
first line in the output
K-means clustering with 3 clusters of sizes 7, 11, 14
we have created 3 clusters each with size given above.
Clustering vector:
we have mazda rx 4 belongs cluster 1, datsun 710 belongs to cluster 2 and so on. 
for each cluster vector/data point, the output shows which cluster the datapoint belongs to

          Mazda RX4       Mazda RX4 Wag          Datsun 710      Hornet 4 Drive   Hornet Sportabout 
                  1                   1                   2                   1                   3 
            Valiant          Duster 360           Merc 240D            Merc 230            Merc 280 
                  1                   3                   2                   2                   1 
          Merc 280C          Merc 450SE          Merc 450SL         Merc 450SLC  Cadillac Fleetwood 
                  1                   3                   3                   3                   3 
Lincoln Continental   Chrysler Imperial            Fiat 128         Honda Civic      Toyota Corolla 
                  3                   3                   2                   2                   2 
      Toyota Corona    Dodge Challenger         AMC Javelin          Camaro Z28    Pontiac Firebird 
                  2                   3                   3                   3                   3 
          Fiat X1-9       Porsche 914-2        Lotus Europa      Ford Pantera L        Ferrari Dino 
                  2                   2                   2                   3                   1 
      Maserati Bora          Volvo 142E 
                  3                   2 

km$withinss - gives withinss value
[1] 13954.34 11848.37 93643.90
> km$betweenss
[1] 503940.9
Total_SS - sum of withinss values - 
km$totss gives you total SS
cluster ratio percentage >70 is a good cluster
'''

now, am adding the cluster value of each mtcars row into a new table
I would like to know which cluster has more MPG value. 

km$cluster gives me the cluster number for each row.

Now I create a new df combining mtcars and cluster value

df<-cbind(mtcars,cluster=km$cluster)
df
now, I will use a variant of apply (tapply) to get me mean of MPG
tapply(df$mpg,df$cluster,mean)
> tapply(df$mpg,df$cluster,mean)
1        2        3 
19.74286 26.66364 15.10000 
Cluster 2 clearly gives me the indication of best miles per gallon

this is called profiling 

How to find the optimal number of clusters

Thumb rule is is sqrt(n/2) where n is no of objects(data points)

http://archive.ics.uci.edu/ml/index.php
link to public datasets for practice. I have choosen wine datasets

the file is ; separated values so read.csv2() to be used to read the file. 

eg2 - 
  wine<-read.csv2('winequality-red.csv',header = T)

View(wine)
str(wine)
kmeans(wine,6) - show the kmeans output and betss/totss percentage. 



now show the thumb rule for optimal clusters. and run kmeans again. 
percentage will increase to 95%. 

sqrt(1599/2)

kmeans(wine,28)

am i clear? any questions?
  
=============================================
  
Module 8

Association rules - also termed as market basket analysis.

Have you heard this term before?

Let me ask you a question.
I am sure every one does shopping online amazon, flipkart ebay etc.

say if you are buying laptop, you will also get recommendations on say, laptop bag/sleeve, wireless speakers 

How do they know that these other items might be interesting to you?
How do they come up with these suggestions to you?

wait for participants answers.

these retailers collect all the data that a customer purchase. like people who have purchased laptop and speakers or sleeve
say 70% of people have bought laptop and sleeve together. and say 80% have purchased laptops and speakers. 

this is an example of assoication rules. 

friend suggestions in linkedin or facebook is another example of association Rules.

Another example

you are an owner of a super market and you collect the data of customers visiting your shop and their purchases
for 6 months or an year. You will come to know the purchasing habbits of the customers. Then you will also come know
that how many people are buying eggs along with bread and milk or what are people buying along with an item be it shaving needs or diapers or etc

The analysis of basket data in the market is called market basket analysis. 

one more example - now you are a regular customer to a small grocery store in your community or in your area. you were purchasing bread
for more than a year and suddenly stopped buying bread but everything else. what will the store owner do? 

  wait for the participants answers?

he may come up with some offers which you feel lucrative to you or talk to you about the new brand of bread in the market
and ask you to try it.

now thing of walmart, more, bigbazar or publix. can they interact with each of their customers? is it possible?

it is not possible right? 

remember, it is a big dream of these big shots in retail space to have 1 to 1 customer. but bcos of volume 
of their business, they can't do it. '

now they do an analysis of the data on what you have purchased or what would be your next purchase or an associated iatem
that you would purchase. 

for this, they mine your data on the purchases on the customers like you and come up with suggestion/recommendation. 

why is this important to do this kind of analysis for companies like walmart or any other business. 

if they come to know that bread along with milk and eggs are purchased together. will they keep these items close to each other
or far from each other?

answers please?

keep it as far as possible. by doing this, you are making the customer to move across the store and watch for other items
and may buy it. which in turn will increase your business. 

if you keep the items close to each other which have an association, customer will take those and check out

an intersting example - the most intersting associate rule discovered till date is

A big retailer has discovered this 
1. customers coming to his store who are aged between 30 and 45, coming on friday between 6 and 9pm, buying beers
have also bought diapers. 
can any one of you think the association between beers and diapers. that too on friday?

wait for participants answers?

reasons - they want to enjoy their weekends and they don't want to go for diapers separately on weekends'

google beers and diapers - you will see many articles on the net. 

any questions so far?

refer to slide 7 and 8 for co occurance of product matrix

explain co occurance of product.

am able to do this cos they are only 5 transactions. 

for big companies like walmart, they can't do this just like that. 

now let us look at the terms - support, confidence and lift
these are teh core terms of association rules

soda=>oj - if soda then orange juice
in how many transactions, oj and soda are present?

support for soda and oj - refer to slide 7 - two transactions are there 
total transactions are 5. 
so support is 2/5 = 0.4 or 40%
this means, there's 40% chance that both OJ and soda are present in a customer's basket'

are you with me ?

  confidence
in how many transactions only soda is present?  - answer is 3
both oj and soda are 2
so confidence is 2/3 = 0.67

confidence is nothing but conditional probability. p(a |b)= 
this means, if a customer has already purchased soda, then the probability that he purchases oj is 67%. 

are you with me?

confidence is nothing but, if a customer purchased product 1, then what are the changes of purchasing product 2

Lift is nothing but the measure of interstingness of the rule. How interesting a rule is?
Lift can be any number.0.1, or 50 or 1000 any number. 
now, if the lift value is < 1 then I say the rule is not interesting.
higher the value of lift, more interesting the rule is

calculation of lift is
if soda is A and OJ is B, then Support of A / probabaility(A) * probability(B)
you can calculate the probability of A then you can get the value of lift here in this example. 
Please do it and let me know. 

or I can give a number to it here. 

are we good till now?
  
let us go to R studio to implement the association rules 
install arules package and invoke arules
and there's an algorithm called apriori for association rules. we will be using that algorithm'
install.packages('arules')
library(arules)  

before you come up with association rules, you need to provide apriori() algorithm the threshold 
values of support and confidence
let us say the threshold values of support and confidence is 0.1 and 0.2 respectively.
this means, you will get only those rules which have support >= 0.1 and confidence >= 0.2
please remember this.

data("Groceries")
class(Groceries)
its a transactional dataset.
refer to slide 7 
if you don't have transactional dataset then use as.transaction() to convert the dataset into transactional dataset
please note you need transactional dataset for association rules and apriori algorithm'
LIST(Groceries)
Please note the above list is in CAPS. its a function in arules package. not to be mistaken as list data type
the above command will print the number of transactions

summary(Groceries)

explain summary

element (itemset/transaction) length distribution:
  sizes
1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22 
2159 1643 1299 1005  855  645  545  438  350  246  182  117   78   77   55   46   29   14   14    9   11    4 
23   24   26   27   28   29   32 
6    1    1    1    1    3    1 

there is one transaction the last one which has 32 items in it

let us create a visualization Here

itemFrequencyPlot() is part of arules package
itemFrequencyPlot(Groceries,topN = 30, type='absolute')

let us generate association rules

let us say the threshold values of support and confidence is 0.1 and 0.2 respectively.
this means, you will get only those rules which have support >= 0.1 and confidence >= 0.2
please remember this.

rules<-apriori(df,parameter=list(support=0.01, confidence=0.2))
rules
inspect(rules[1:10])
refer the output to slide 7
you can do some more things on this output

let us sort the rules on confidence in descending order
sort_rules<-sort(rules, by='confidence', decreasing = T)
sort_rules
inspect(sort_rules[1:20])

now I want to see what my customers are usually buying before the purchase of milk
or i want to recommend whole milk to customers. how do i do that?
how do I target the customers and market whole milk to them.

rules<-apriori(df,parameter=list(support=0.01, confidence=0.2),
               appearance = list(default = 'lhs', rhs='whole milk'))
inspect(rules)

any questions on assoc rules?
  
REFER to slide 31 for collaborative filtering


Suppose there's a user x. we want to recommend movies to user x. 
first figure out from our data, a group of users who have similar likes and dislikes of a user x'

tow types we will be discussing here.
1. ubcf
2. ibcf

refer to slide 33 and show the table. 

explain the user and items(here movies).


Build a matrix of things each user bought/viewed/rated - here movies so we take it as viewed/ratings
compute similarity scores between users
find users similar to you
recommend stuff they bought/viewed/rated that you haven't '

builda table contaiing users as rows and what they have viewed/rated as columns.
treat each row as a vector and we get rows as users' vectors'
and then compute the similartiy of vectors
based on their behavior/rating/views, you will come to know the similarity of users
either liked by both users are disliked by both of them

compute teh similarties and sort them
Cosine similarity is a measure of similarity between two non-zero vectors of an inner product space that 
measures the cosine of the angle between them. ... 
This is analogous to the cosine, which is unity (maximum value) 
when the segments subtend a zero angle and zero (uncorrelated) when the segments are perpendicular.

find the similarity which matches to the user. 
and recommend the items which are viewed by other users

problems with ubcf
1. people are fickle, their tastes keep changing. 
2. there are many more people than things


ibcf - is another option
cos items are permanant
people's taste would be changing'
you will have few items compared to people to find similarity
people are more than items - 7 billion people are there. not 7 billion movies
items similarity matrix will be smaller than user similiarity matrix

here items are put as rows and users are put as columns
find the cosine similarity between items

refer to slide 51
items and users should be transposed - slide is wrong
refer to slide 52
calculate mean score for rows
refer to slide 53 - normalize matrix
normalization can be done in many ways
here z-score normalization is done.
subtract the value of each row with the mean of the total row values
eg: 5 - 4.4 =0.6, 3-4.4 = -1.6

The goal of normalization is to change the values of numeric columns in the dataset to use a common scale, 
without distorting differences in the ranges of values or losing information. 
Normalization is also required for some algorithms to model the data correctly

Normalization tries to reduce the individual rating bias by row centering the data, i.e., 
by subtracting from each available rating the mean of the ratings of that user (row). 
Z-score in addition divides by the standard deviation of the row/column. 
Normalization can also be done on columns.

Refer to slide # 54
calculate cosine similarity -  don't know how to calculate'

ask participants to refer to this article

http://www.minerazzi.com/tutorials/cosine-similarity-tutorial.pdf

next slide  - propensity score

The propensity score for a subject is the probability that the subject was treated, P(T=1). 
In a randomized study, the propensity score is known; 
for example, if the treatment was assigned to each subject by the toss of a coin, 
then the propensity score for each subject is 0.5.

don't worry about it'
just use the function for recommenderlab and predict the value



we need to find the similarity of users first. 

refer to the table in slide 33. user 1 and user 6 are dissimmilar cos the ratings differ very much.
where as user 3 and 4 are similar in their ratings_movies
also we need to figure out a way to handle the blanks in the table. 


explain the theory in detail

program is written already take the print out of the same. 

explain the program in detail.

any questions?
  

  

# 
# 
# 
