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

-- Creating tables with the value of each number of ratings per movie
CREATE TABLE zero_star AS (SELECT  movieID, title, rating, COUNT(rating) AS zero_ratings FROM movies_and_ratings WHERE rating=0 GROUP BY  movieID, title, rating);
CREATE TABLE one_star AS (SELECT  movieID, title, rating, COUNT(rating) AS one_ratings FROM movies_and_ratings WHERE rating=1 GROUP BY  movieID, title, rating);
CREATE TABLE two_star AS (SELECT  movieID, title, rating, COUNT(rating) AS two_ratings FROM movies_and_ratings WHERE rating=2 GROUP BY  movieID, title, rating);
CREATE TABLE three_star AS (SELECT  movieID, title, rating, COUNT(rating) AS three_ratings FROM movies_and_ratings WHERE rating=3 GROUP BY  movieID, title, rating);
CREATE TABLE four_star AS (SELECT  movieID, title, rating, COUNT(rating) AS four_ratings FROM movies_and_ratings WHERE rating=4 GROUP BY  movieID, title, rating);
CREATE TABLE five_star AS (SELECT  movieID, title, rating, COUNT(rating) AS five_ratings FROM movies_and_ratings WHERE rating=5 GROUP BY  movieID, title, rating);

-- Running the query that merges these tables and calculates the number of ratings each movie had
SELECT 
	movies.movieID, 
	movies.title, 
	SUM(zeros.zero_ratings) AS zero_stars, 
	SUM(ones.one_ratings) AS one_stars, 
	SUM(twos.two_ratings) AS two_stars, 
	SUM(threes.three_ratings) AS three_stars, 
	SUM(fours.four_ratings) AS four_stars, 
	SUM(fives.five_ratings) AS five_stars 
FROM movies_and_ratings AS movies 
JOIN zero_star AS zeros ON movies.movieID=zeros.movieID 
JOIN one_star AS ones ON movies.movieID=ones.movieID 
JOIN two_star AS twos ON movies.movieID=twos.movieID 
JOIN three_star AS threes ON movies.movieID=threes.movieID 
JOIN four_star AS fours ON movies.movieID=fours.movieID 
JOIN five_star AS fives ON movies.movieID=fives.movieID 
GROUP BY movies.movieID, movies.title 
ORDER BY movies.movieID 
LIMIT 10;