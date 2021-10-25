-- Importing the movies dataset and the ratings dataset
movies  = 
	LOAD 'cleaned_movies/part-m-00000' 
	USING PigStorage('|') 
	AS (movieID:chararray, title:chararray, year:chararray, genres:chararray);
ratings = 
	LOAD 'cleaned_ratings/part-m-00000' 
	USING PigStorage('|') 
	AS (userID:chararray, movieID:chararray, rating:int, timestamp:chararray);

-- Joining both datasets together
movies_and_ratings = 
	JOIN 
		movies BY movieID, 
		ratings BY movieID;

-- Removing duplicate columns and timestamp column
joined_movies_and_ratings = 
	FOREACH movies_and_ratings 
	GENERATE 
		movies::movieID AS movieID, 
		movies::title AS title, 
		movies::year AS year, 
		movies::genres AS genres, 
		ratings::userID AS userID, 
		ratings::rating AS rating;

-- Exporting the datasets using a bar delimiter
STORE joined_movies_and_ratings INTO 'cleaned_movies_and_ratings' using PigStorage('|');