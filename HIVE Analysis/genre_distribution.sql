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

-- Gathering the information on each genre
SELECT 
	SUM(CASE WHEN genres LIKE '%Action%' THEN 1 ELSE 0 END) AS number_action,
    SUM(CASE WHEN genres LIKE '%Adventure%' THEN 1 ELSE 0 END) AS number_adventure,
    SUM(CASE WHEN genres LIKE '%Animation%' THEN 1 ELSE 0 END) AS number_animation,
    SUM(CASE WHEN genres LIKE '%Children%' THEN 1 ELSE 0 END) AS number_children,
    SUM(CASE WHEN genres LIKE '%Comedy%' THEN 1 ELSE 0 END) AS number_comedy,
    SUM(CASE WHEN genres LIKE '%Crime%' THEN 1 ELSE 0 END) AS number_crime,
    SUM(CASE WHEN genres LIKE '%Documentary%' THEN 1 ELSE 0  END) AS number_documentary,
    SUM(CASE WHEN genres LIKE '%Drama%' THEN 1 ELSE 0 END) AS number_drama,
    SUM(CASE WHEN genres LIKE '%Fantasy%' THEN 1 ELSE 0 END) AS number_fantasy,
    SUM(CASE WHEN genres LIKE '%Film-Noir%' THEN 1 ELSE 0 END) AS number_filmnoir,
    SUM(CASE WHEN genres LIKE '%Horror%' THEN 1 ELSE 0 END) AS number_horror,
    SUM(CASE WHEN genres LIKE '%Musical%' THEN 1 ELSE 0 END) AS number_musical,
    SUM(CASE WHEN genres LIKE '%Mystery%' THEN 1 ELSE 0 END) AS number_mystery,
    SUM(CASE WHEN genres LIKE '%Romance%' THEN 1 ELSE 0 END) AS number_romance,
    SUM(CASE WHEN genres LIKE '%Sci-Fi%' THEN 1 ELSE 0 END) AS number_scifi,
    SUM(CASE WHEN genres LIKE '%Thriller%' THEN 1 ELSE 0 END) AS number_thriller,
    SUM(CASE WHEN genres LIKE '%War%' THEN 1 ELSE 0 END) AS number_war,
    SUM(CASE WHEN genres LIKE '%Western%' THEN 1 ELSE 0 END) AS number_western
FROM movies_and_ratings;