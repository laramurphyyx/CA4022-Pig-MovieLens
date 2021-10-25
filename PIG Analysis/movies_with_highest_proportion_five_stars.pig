-- Importing the movies dataset and the ratings dataset
movies_and_ratings = 
	LOAD 'cleaned_movies_and_ratings/part-r-00000' 
	USING PigStorage('|') 
	AS 
		(movieID:chararray, 
		title:chararray,
		year:int,
		genres:chararray,
		userID:chararray, 
		rating:int);

-- Calculating the total count for all movies
total_ratings_per_movie = 
	GROUP movies_and_ratings 
	BY (movieID, title);
total_ratings_count_per_movie = 
	FOREACH total_ratings_per_movie 
	GENERATE 
		group.movieID, 
		group.title, 
		COUNT(movies_and_ratings) as count_ratings;

-- Calculating the count for each rating
ratings_per_movie = 
	GROUP movies_and_ratings 
	BY (movieID, title, rating);
ratings_count_per_movie = 
	FOREACH ratings_per_movie 
	GENERATE 
		group.movieID, 
		group.title, 
		group.rating, 
		COUNT(movies_and_ratings) as count_ratings;

-- Filtering to see only 5 star ratings
movies_five_star_count = FILTER ratings_count_per_movie BY (rating == 5);

-- Joining and merging the datasets containing the count of 5 stars and the count of all reviews
five_star_movies_join = 
	JOIN 
		movies_five_star_count BY (movieID, title), 
		total_ratings_count_per_movie BY (movieID, title);
total_vs_five_stars = 
	FOREACH  five_star_movies_join 
	GENERATE 
		movies_five_star_count::movieID, 
		movies_five_star_count::title, 
		movies_five_star_count::count_ratings AS count_five_stars, 
		total_ratings_count_per_movie::count_ratings AS count_ratings;

-- Adding a column containing the proportion of five star reviews for each movie
proportion_five_stars = 
	FOREACH total_vs_five_stars 
	GENERATE *,  (float)count_five_stars/count_ratings AS proportion_five_stars;

-- Ordering the movies to see the movies with the highest percentage of 5 star reviews
most_five_stars = 
	ORDER proportion_five_stars 
	BY proportion_five_stars DESC;

-- Filtering the movies to see only movies that have at least 100 ratings
most_five_stars_filtered =  
	FILTER most_five_stars 
	BY (count_ratings>100);

-- Finding the top 5 movies with the highest proportion of 5 star ratings
top_five_movies = LIMIT most_five_stars_filtered 5;
dump top_five_movies;