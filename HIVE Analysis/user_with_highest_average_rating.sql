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

-- Running query to find the top 5 users with the highest average rating
SELECT 
	userID, 
	COUNT(rating) AS number_ratings, 
	AVG(rating) AS average_rating
FROM 
	movies_and_ratings
GROUP BY 
	userID
ORDER BY average_rating DESC
LIMIT 5;