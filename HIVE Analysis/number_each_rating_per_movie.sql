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

-- Running query to find the total number of each rating a movie has received
SELECT 
	movieID,
	title,
	rating,
	COUNT(rating) AS count_ratings
FROM 
	movies_and_ratings
GROUP BY 
	movieID,
	title,
	rating;