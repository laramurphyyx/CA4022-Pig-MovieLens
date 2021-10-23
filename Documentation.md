# Documentation for MovieLens Assignment

## Using PIG to clean datasets

The following PIG scripts were used to clean and prepare the data for analysis:
- [Cleaning the movies dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_movies_dataset.pig)

Cleaning the movie dataset involved 
1. Removing unnecessary headers
2. Separating the 'genres' column
3. Splitting the movie title and year into different columns

## Using PIG to analyse datasets

The following PIG scripts were used to analyse the data:
- [Finding the movie with the highest number of ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movie_with_highest_number_ratings.pig)
- [Finding the movie with the highest proportion of five star ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movies_with_highest_proportion_five_stars.pig)
- [Finding the user with the highest average rating](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/commit/29e61da307a8aaf9a8c55ede8a5f28f33e7644c9)