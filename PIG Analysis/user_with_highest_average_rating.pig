-- Importing the ratings dataset and the users dataset
ratings = 
	LOAD 'ml-latest-small/ratings.csv' 
	USING PigStorage(',') 
	AS (userID:chararray, movieID:chararray, rating:int, timestamp:chararray);


-- Removing the extra row in the ratings dataset
ratings_headless = FILTER ratings BY userID != 'userId';

-- Grouping the users together
group_users = GROUP ratings_headless BY userID;

-- Caclulating the average ratings given by each user
average_rating = 
	FOREACH group_users 
	GENERATE 
		group As userID, 
		SUM(ratings_headless.rating) as num_ratings, 
		AVG(ratings_headless.rating) AS average_rating;

-- Finding users with the highest average ratings given
highest_ratings = 
	ORDER average_rating 
	BY average_rating DESC;

-- Finding the 5 users with the highest average rating
top_five_users = LIMIT highest_ratings 5;
dump top_five_users;