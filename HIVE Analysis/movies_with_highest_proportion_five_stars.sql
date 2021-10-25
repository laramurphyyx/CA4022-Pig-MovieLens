-- Creating basic tables
CREATE TABLE movies_and_ratings 
		(movieID STRING, 
		title STRING,
		year INT,
		genres STRING,
		userID STRING, 
		rating INT)
	ROW FORMAT DELIMITED 
	FIELDS TERMINATED BY '|';

-- Inserting the data content into the table
LOAD DATA LOCAL INPATH "cleaned_movies_and_ratings/part-r-00000" 
	OVERWRITE INTO table movies_and_ratings;

-- Running the query to find the top 5 movies with the highest proportion of 5 star ratings 
