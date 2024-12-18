data<-read.csv("D:\\Movie data\\Movie data\\ml-latest-small\\Output.csv")
head(data)
library(recommenderlab)
rating_matrix<-as(data[,-3],"realRatingMatrix")
rating_matrix <- as(data[, c("userId", "movieId.1", "rating")], "realRatingMatrix")
data[data$userId==700,]
rating_matrix[1,]
get_movie<-function(rating_matrix){
  rating_model<-Recommender(rating_matrix,method="UBCF",param=list(normalize="center",method="cosine"))
  pred<-predict(rating_model,rating_matrix[as.character(700),],n=100)
  items<-as(pred,"list")[[1]]
  recommended_movies<-data[data$movieId.1 %in% items,"title"]
  recommended_movies<-unique(recommended_movies)
 
  recommended_movies<-sample(recommended_movies,5)
  return(recommended_movies)
}
get_movie(rating_matrix)
700 %in% rownames(rating_matrix)
