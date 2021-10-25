# Documentation for MovieLens Assignment

## Using PIG to clean datasets

The following PIG scripts were used to clean and prepare the data for analysis:
- [Cleaning the movies dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_movies_dataset.pig)
- [Cleaning the ratings dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_ratings_dataset.pig)
- [Cleaning the tags dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_tags_dataset.pig)
- [Cleaning the links dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_links_dataset.pig)
- [Merging the movies and the ratings dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/merging_movies_ratings.pig)

### Steps to clean the movie dataset
1. Removing unnecessary headers
2. Separating the 'genres' column
3. Splitting the movie title and year into different columns
4. Changing the separator

### Steps to clean the ratings, tags and links datasets
1. Removing unnecessary headers
2. Changing the saperator

### Steps to merge the movies dataset and the ratings dataset
1. Joining the two datasets on the movie ID
2. Removing duplicate columns and removing unused timestamp column
3. Changing the separator

## Using PIG to analyse datasets

The following PIG scripts were used to analyse the data:
- [Finding the movie with the highest number of ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movie_with_highest_number_ratings.pig)
- [Finding the movie with the highest proportion of five star ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movies_with_highest_proportion_five_stars.pig)
- [Finding the users with the highest average rating](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/commit/29e61da307a8aaf9a8c55ede8a5f28f33e7644c9)

### PIG Analaysis 1: Finding the Movie with the Highest Number of Ratings
This analysis invlolved calculating the count of ratings each movie has received, sorting by this count in descending order and limiting the result to 1 movie. 

The result showed that Forrest Gump was the movie with the highest amount of ratings, receiving a total of 329 ratings.

![PIG_Result_1](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/PIG/movie_with_highest_number_ratings.png?raw=true "PIG Analysis 1")

### PIG Analysis 2: Finding the Movie with the Highest Proportion of Five Star Ratings
The analysis in this query involved generating two new tables. One table calculated the total ratings per movie and the other table calculate the number of five star ratings the movies received. The proportion of five star ratings could then be calculated by merging these tables and performing calculations on them. 

If the movies were sorted in descending order of the proportion of five star ratings, the result contains many movies with one single review which is five stars (meaning 100% of their ratings are five stars). This result was subsequently filtered by movies with a minimum of 100 reviews.

The resulting output concluded that 'The Shawshank Redemption', 'The Godfther', 'Apocalypse Now', 'Schindler's List' and 'Star Wars: Episode IV - A New Hope' were five movies with the highest proportion of five star movies, with results ranging from ~41% to ~48%.

![PIG_Result_2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/PIG/movies_with_highest_proportion_five_stars.png?raw=true "PIG Analysis 2")

### PIG Analysis 3: Finding the Users with the Highest Average Rating
To run this analysis, the total number of ratings given and the average of all ratings given were calculated for each user. To see the top 5 users with the highest average rating, the table was sorted by average rating in descending ordered and limited to 5 movies in the output.

The result showed that the five users with the highest average rating were '53', '251', '515', '25' and '30', all receiving an average above 4.7 and user '53' who gave five stars to all 100 movies that they had rated.

![PIG_Result_3](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/PIG/user_with_highest_average_rating.png?raw=true "PIG Analysis 3")


## Using HIVE to analyse datasets

The following HIVE scripts were used to analyse the data:
- [Finding the movie with the highest number of ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/movie_with_highest_number_ratings.sql)
- [Finding the movie with the highest proportion of five star ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/movies_with_highest_proportion_five_stars.sql)
- [Finding the users with the highest average rating](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/user_with_highest_average_rating.sql)
- [Finding how many times each rating was given per movie](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/number_each_rating_per_movie.sql)
- [Finding what the most popular rating given was](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/total_number_of_each_rating.sql)
- [Exploring how the distribution of ratings are based on genres](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/genre_distribution.sql)

### HIVE Analysis 1: Finding the Movie with the Highest Number of Ratings
The analysis involved in this query was to select the movie ID, the movie title and the number of ratings each movie had from the merged movies and ratings dataset. The result was then sorted by the number of ratings in decscending order and limited to 1 movie in the output.

![HIVE_Result_1]()

### HIVE Analysis 2: Finding the Movie with the Highest Proportion of Five Star Ratings


### HIVE Analysis 3: Finding the Users with the Highest Average Rating
This query calculated the average rating given by each user. This result was put in descending order and outputted the user ID, the total amount of ratings and the average rating of the five users with the highest average rating.

![HIVE_Result_3]()

### HIVE Analysis 4: Finding the Count of Each Rating per Movie
This analysis grouped each movie and each possible rating together and calculated the number of times each rating was assigned to a movie. 

![HIVE_Result_4]()

### HIVE Analysis 5: Finding the Most Popular Rating for All Movies
This HIVE script calculates the overall amount of times each rating was given, and sorts each rating by the amount of times it was chosen in descending order.

![HIVE_Result_5]()

### HIVE Analysis 6: Exploring how the Ratings are Distributed by Genre
