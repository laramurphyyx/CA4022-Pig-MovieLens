-- Importing the movies dataset and the ratings dataset
movies  = 
	LOAD 'cleaned_movies/part-m-00000' 
	USING PigStorage('|') 
	AS (movieID:chararray, title:chararray, year:chararray, genres:chararray);
ratings = 
	LOAD 'ml-latest-small/ratings.csv' 
	USING PigStorage(',') 
	AS (userID:chararray, movieID:chararray, rating:int, timestamp:chararray);

-- Removing the extra row in the ratings dataset
ratings_headless = FILTER ratings BY userID != 'userId';

-- Joining both datasets together
movies_and_ratings = 
	JOIN movies BY movieID, 
	ratings_headless BY movieID;

-- Removing duplicate columns and timestamp column
joined_movies_and_ratings = 
	FOREACH movies_and_ratings 
	GENERATE 
		movies::movieID AS movieID, 
		movies::title AS title, 
		movies::year AS year, 
		movies::genres AS genres, 
		ratings_headless::userID AS userID, 
		ratings_headless::rating AS rating;

-- Calculating the count for each rating
total_ratings_per_movie = 
	GROUP joined_movies_and_ratings 
	BY (movieID, title);
total_ratings_count_per_movie = 
	FOREACH total_ratings_per_movie 
	GENERATE 
		group.movieID, 
		group.title, 
		COUNT(joined_movies_and_ratings) as count_ratings;

-- Ordering the movies with the highest number of ratings
top_rated_movies = 
	ORDER total_ratings_count_per_movie 
	BY count_ratings DESC;

-- Finding the top rated movie
top_rated_movie = 
	LIMIT top_rated_movies 1;
dump top_rated_movie;