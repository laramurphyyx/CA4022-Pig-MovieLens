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

-- Creating two tables to calculare total ratings and total five-star ratings separately
CREATE TABLE total_ratings AS 
	(SELECT  
		movieID, 
		title, 
		COUNT(rating) AS count_ratings 
	FROM movies_and_ratings 
	GROUP BY movieID, title);

CREATE TABLE five_star_ratings AS
	(SELECT 
		movieID, 
		title, 
		COUNT(rating) AS five_star_ratings 
	FROM movies_and_ratings 
	WHERE rating=5 
	GROUP BY movieID, title);

-- Creating a final table to store both calculations from the previous tables and the proportion of five star ratings
CREATE TABLE five_star_proportion AS 
	(SELECT 
		total.movieID, 
		total.title, 
		collect_set(five.five_star_ratings)[0] AS five_star_ratings, 
		collect_set(total.count_ratings)[0] AS total_ratings, 
		collect_set(five.five_star_ratings)[0]/collect_set(total.count_ratings)[0] AS proportion 
	FROM total_ratings AS total 
	JOIN five_star_ratings AS five ON total.movieID=five.movieID 
	GROUP BY total.movieID, total.title 
	ORDER BY proportion DESC);

-- Filtering the above dataset to only show movies with over 100 ratings
SELECT *
FROM five_star_proportion
WHERE total_ratings > 100
LIMIT 10;