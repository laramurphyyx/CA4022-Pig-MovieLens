-- Importing the datasets
links_data = LOAD 'ml-latest-small/links.csv' 
	USING PigStorage(',') 
	AS 
		(movieID:chararray, 
		imdbID:chararray, 
		tmbdID:chararray);

-- Removing the extra row
headless = FILTER links_data BY movieID != 'movieId';

-- Exporting the datasets using a bar delimiter
STORE headless INTO 'cleaned_links' using PigStorage('|');