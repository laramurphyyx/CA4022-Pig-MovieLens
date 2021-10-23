-- Setting up CSVLoader to allow for commas in movie titles
DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();

-- Importing the datasets
movies_data = LOAD 'ml-latest-small/movies.csv' 
	USING CSVLoader() 
	AS  (movieID:chararray, title:chararray, genres:chararray);


-- Removing the extra row
headless = FILTER movies_data BY movieID != 'movieId';

-- Seperating the genres
genres_separated = FOREACH headless_movies GENERATE movieID, title, STRSPLIT(genres, '\\|') AS genres;

-- Separating the title and year into two columns
split_title_years = FOREACH genres_separated 
	GENERATE 
		movieID,
		REGEX_EXTRACT(title, '([\\S ]+) \\((\\d{4}|\\d{4}-?\\d{4})\\)', 1) AS title,
		REGEX_EXTRACT(title, '\\((\\d{4}|(\\d{4}-\\d{4}))\\)', 1) AS year,
		genres;

-- Exporting the datasets using a bar delimiter
STORE split_title_years INTO 'cleaned_movies' using PigStorage('|');