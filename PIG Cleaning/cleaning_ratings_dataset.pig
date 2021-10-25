-- Importing the datasets
ratings_data = LOAD 'ml-latest-small/ratings.csv' 
	USING PigStorage(',') 
	AS  (userID:chararray, movieID:chararray, rating:int, timestamp:chararray);

-- Removing the extra row
headless = FILTER ratings_data BY userID != 'userId';

-- Exporting the datasets using a bar delimiter
STORE headless INTO 'cleaned_ratings' using PigStorage('|');