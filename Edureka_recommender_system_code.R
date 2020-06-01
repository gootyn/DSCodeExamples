# Check Distribution of Rating
vector_ratings<-as.vector(MovieLense@data)
MovieLense@data
vector_ratings
as.matrix(MovieLense@data[1:4,1:4])
unique(vector_ratings)
table_ratings<-table(vector_ratings)
table_ratings

# Here, 0 represents a missing rating as per documentation and hence, can be removed from the vector
vector_ratings<-vector_ratings[vector_ratings!=0]
table(vector_ratings)
qplot(vector_ratings) + ggtitle("Distribution of Ratings")


# Check most Popular Movies
views_per_movie<-colCounts(MovieLense)
head(views_per_movie,10)
table_views<-data.frame(movie = names(views_per_movie), views = views_per_movie)
table_views<-table_views[order(table_views$views,decreasing=TRUE),]
head(table_views)
colnames(table_views)
ggplot(table_views[1:5,], aes(x=movie, y=views))  + geom_bar(stat = "identity")


# Check distribution of ratings
average_ratings<-colMeans(MovieLense)
qplot(average_ratings) + stat_bin(binwidth = 0.1) + ggtitle("Distribution of average movie rating")

# Few movies have average rating 1 or 5. This may be because either these movies were really very bad or 
#very good or very few people have rated them
# So, for a relevant average rating distribution, let us remove movies which have been rated by less than 100 users
average_ratings_relevant<- average_ratings[views_per_movie>100]
qplot(average_ratings_relevant) + stat_bin(binwidth = 0.1) + ggtitle("Distribution of average movie rating")


# So, for a relevant average rating distribution, let us remove movies which have been rated by less than 100 users
average_ratings_relevant<- average_ratings[views_per_movie>100]
qplot(average_ratings_relevant) + stat_bin(binwidth = 0.1) + ggtitle("Distribution of average movie rating")

# Now, all rankings range between 2.3 and 4.5
# Some users watch more movie than others. 
# Some rate higher ratings to most movies. 
# Some movies are watched more than other movies

image(MovieLense, main="heatmap of rating matrix")

# Few decision to be taken for good recommendation system:
# Determine minimum number of movies per user
# Determine minimum number of users per movie
# Select users and movies matching these criteria

min_n_movies <-quantile(rowCounts(MovieLense),0.99)
min_n_movies
min_n_users <-quantile(colCounts(MovieLense),0.99)
min_n_users
image(MovieLense[rowCounts(MovieLense) > min_n_movies, colCounts(MovieLense) > min_n_users], main="heatmap of top users and movies")

ratings_movies <- MovieLense[rowCounts(MovieLense) > 50, colCounts(MovieLense) > 100]
min_movies <- quantile(rowCounts(ratings_movies), 0.98)
min_users <- quantile(colCounts(ratings_movies), 0.98)
image(ratings_movies[rowCounts(ratings_movies) > min_movies,  colCounts(ratings_movies) > min_users], main = "Heatmap of the top users and movies")

# Normalize Data: There can be users who give relatively higher or lower ratings to all movies than another user whose ratings are to be identified. This may create a bias towards higher or lower # rating for user in question
ratings_movies_norm <- normalize(ratings_movies)
image(ratings_movies_norm[rowCounts(ratings_movies_norm) > min_movies, colCounts(ratings_movies_norm) > min_users], main = "Heatmap of the top users and movies")

# Split data into train and test
which_train <- sample(x = c(TRUE, FALSE), size = nrow(ratings_movies), replace = TRUE, prob = c(0.8, 0.2))
recc_data_train <- ratings_movies[which_train, ]
recc_data_test <- ratings_movies[!which_train, ]

# Calling the Recommender function
recc_model_ubcf <- Recommender(data = recc_data_train, method = "UBCF")
n_recommended_ubcf <- 6
recc_predicted_ubcf <- predict(object = recc_model_ubcf, newdata = recc_data_test, n = n_recommended_ubcf)
recc_predicted_ubcf

# Getting predictions for a user
recc_predicted_ubcf@items[[1]]
recc_user_1_ubcf <- recc_predicted_ubcf@items[[1]]
movies_user_1_ubcf <- recc_predicted_ubcf@itemLabels[recc_user_1_ubcf]
movies_user_1_ubcf

# Split data into train and test
which_train <- sample(x = c(TRUE, FALSE), size = nrow(ratings_movies), replace = TRUE, prob = c(0.8, 0.2))
recc_data_train <- ratings_movies[which_train, ]
recc_data_test <- ratings_movies[!which_train, ]

# Calling the Recommender function
recc_model_ibcf <- Recommender(data = recc_data_train, method = "IBCF", parameter = list(k = 30))

# Exploring the recommender model
model_details_ibcf <- getModel(recc_model_ibcf)
model_details_ibcf$description
model_details_ibcf$k

# Applying recommendation model on test set
n_recommended_ibcf <- 6
recc_predicted_ibcf <- predict(object = recc_model_ibcf, newdata = recc_data_test, n = n_recommended_ibcf)

# Getting predictions for a user
recc_predicted_ibcf@items[[1]]
recc_user_1_ibcf <- recc_predicted_ibcf@items[[1]]
movies_user_1_ibcf <- recc_predicted_ibcf@itemLabels[recc_user_1_ibcf]
movies_user_1_ibcf