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
- [Finding the users with the highest average rating](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/user_with_highest_average_rating.pig)

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

The output shows that Forrest Gump received the most ratings, with a total of 329 ratings.

![HIVE_Result_1](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/movie_with_highest_number_ratings.png?raw=true "HIVE Analysis 1")

### HIVE Analysis 2: Finding the Movie with the Highest Proportion of Five Star Ratings
This analysis involved creating two initial tables, one containing the number of five stars each movie received and one containing the total number of ratings each movie received. This table was then merged into a new table and a column for the proportion of five star reviews was calculated. 

The original result was limited to movies with over 100 ratings, to filter out movies that may have one single five star rating (100% five-star ratings).

![HIVE_Result_2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/movies_with_highest_proportion_five_stars.png?raw=true "HIVE Analysis 2")

### HIVE Analysis 3: Finding the Users with the Highest Average Rating
This query calculated the average rating given by each user. This result was put in descending order and outputted the user ID, the total amount of ratings and the average rating of the five users with the highest average rating.

The output below suggests that as the number of ratings a user has given increases, the lower their average rating tends to be (this is also shown in the visualisations section below). 

![HIVE_Result_3](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/user_with_highest_average_rating.png?raw=true "HIVE Analysis 3")

### HIVE Analysis 4: Finding the Count of Each Rating per Movie
This analysis created several tables to calculate the count of each rating for each movie. There were 6 extra tables made to represent the star ratings 0 through 5. These were merged and the output was limited to 10 movies for easier reading.

The output displays the movie's ID and title, and also shows (in order) the number of 0 star ratings, 1 star ratings, 2 star ratings, 3 star ratings, 4 star ratings and 5 star ratings. 

![HIVE_Result_4](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/number_each_rating_per_movie.png?raw=true "HIVE Analysis 4")

### HIVE Analysis 5: Finding the Most Popular Rating for All Movies
This HIVE script calculates the overall amount of times each rating was given, and sorts each rating by the amount of times it was chosen in descending order.

The first output shows the number of times each rating was chosen, and we can see that ratings 3 and 4 were the most common. 

![HIVE_Result_5_1](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/total_number_of_each_rating.png?raw=true "HIVE Analysis 5 (all ratings)")

The second output filters the above result to only list the one most popular rating and how many times it was chosen.

![HIVE_Result_5_2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/most_popular_rating.png?raw=true "HIVE Analysis 5 (most chosen rating)")

### HIVE Analysis 6: Exploring how the Ratings are Distributed by Genre

This analysis shows the breakdown of the number of ratings each genre received. As the genres list was stored in a single column as a string, we had to check the contents of the string for every genre to check which genres were listed.

The following output shows how many ratings each genre received (reading left to right, with genres sorted in alphabtical order).

![HIVE_Result_6](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Output%20Screenshots/HIVE/number_ratings_per_genre.png?raw=true)

## Visualisations of MovieLens Data

### Visualisation of the Proportion of Five Star Ratings

A scatterplot was used to visualise the correlation between the number of ratings a movie received, and the number of five star ratings a movie received.

This data has been queried in [PIG Analysis 2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movies_with_highest_proportion_five_stars.pig) and [HIVE Analysis 2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/movies_with_highest_proportion_five_stars.sql).

This graph shows that the only movies that achieve above 60% five star ratings are movies that have very few (<25) ratings in total. For majority of movies, the proportion of five star ratings are evenly distributed between 0% and 40%. The movies with the highest amount of ratings, however, tend to have a higher proprtion of five star ratings, between 30% and 50%.

![Visualisation_1](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Visualisation/proportion_five_stars.png?raw=true "Proportion of Five Star Ratings")

### Visualisation of Users' Average Rating Compared to Total Number of Ratings

A scatterplot graph was used to show the link between a user's average rating and the total number of ratings they have given. 

This data has been queries in [PIG Analysis 3](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/user_with_highest_average_rating.pig) and [HIVE Analysis 3](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/HIVE%20Analysis/user_with_highest_average_rating.sql).

The graph below shows that the the lower a user's total number of ratings, the more range they have in their average rating. As the number of ratings a user has given approaches 0, the range of their average rating can be anywhere from 0 to 5. As the number of ratings a user has given increases, their average rating is likely to be in a smaller range of 3 and 3.5.

![Visualisation_2](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/Visualisation/users_average_ratings.png?raw=true "Users Average Ratings and Total Ratings")