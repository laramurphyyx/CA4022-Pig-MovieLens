# Documentation for MovieLens Assignment

## Using PIG to clean datasets

The following PIG scripts were used to clean and prepare the data for analysis:
- [Cleaning the movies dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_movies_dataset.pig)
- [Cleaning the ratings dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_ratings_dataset.pig)
- [Cleaning the tags dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_tags_dataset.pig)
- [Cleaning the links dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/cleaning_links_dataset.pig)
- [Merging the movies and the ratings dataset](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Cleaning/merging_movies_ratings.pig)

Cleaning the movie dataset involved:
1. Removing unnecessary headers
2. Separating the 'genres' column
3. Splitting the movie title and year into different columns
4. Changing the separator

Cleaning the ratings, tags and links datasets involved:
1. Removing unnecessary headers
2. Changing the saperator

Merging the movies dataset and the ratings dataset involved:
1. Joining the two datasets on the movie ID
2. Removing duplicate columns and removing unused timestamp column
3. Changing the separator

## Using PIG to analyse datasets

The following PIG scripts were used to analyse the data:
- [Finding the movie with the highest number of ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movie_with_highest_number_ratings.pig)
- [Finding the movie with the highest proportion of five star ratings](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/blob/main/PIG%20Analysis/movies_with_highest_proportion_five_stars.pig)
- [Finding the user with the highest average rating](https://github.com/laramurphyyx/CA4022-Pig-MovieLens/commit/29e61da307a8aaf9a8c55ede8a5f28f33e7644c9)