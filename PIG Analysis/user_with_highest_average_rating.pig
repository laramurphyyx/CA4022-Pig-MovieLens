-- Importing the ratings dataset and the users dataset
ratings = 
	LOAD 'cleaned_ratings/part-m-00000' 
	USING PigStorage('|') 
	AS (userID:chararray, movieID:chararray, rating:int, timestamp:chararray);

-- Grouping the users together
group_users = GROUP ratings BY userID;

-- Caclulating the average ratings given by each user
average_rating = 
	FOREACH group_users 
	GENERATE 
		group As userID, 
		SUM(ratings.rating) as num_ratings, 
		AVG(ratings.rating) AS average_rating;

-- Finding users with the highest average ratings given
highest_ratings = 
	ORDER average_rating 
	BY average_rating DESC;

-- Finding the 5 users with the highest average rating
top_five_users = LIMIT highest_ratings 5;
dump top_five_users;