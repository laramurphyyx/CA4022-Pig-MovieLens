-- Importing the movies and ratings dataset
movies_and_ratings = 
	LOAD 'cleaned_movies_and_ratings/part-r-00000' 
	USING PigStorage('|') 
	AS 
		(movieID:chararray, 
		title:chararray,
		year:int,
		genres:chararray,
		userID:chararray, 
		rating:int);

-- Calculating the count for each rating
total_ratings_per_movie = 
	GROUP movies_and_ratings 
	BY (movieID, title);
total_ratings_count_per_movie = 
	FOREACH total_ratings_per_movie 
	GENERATE 
		group.movieID, 
		group.title, 
		COUNT(movies_and_ratings) as count_ratings;

-- Ordering the movies with the highest number of ratings
top_rated_movies = 
	ORDER total_ratings_count_per_movie 
	BY count_ratings DESC;

-- Finding the top rated movie
top_rated_movie = 
	LIMIT top_rated_movies 1;
dump top_rated_movie;