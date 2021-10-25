-- Importing the datasets
tags_data = LOAD 'ml-latest-small/tags.csv' 
	USING PigStorage(',') 
	AS 
		(userID:chararray, 
		movieID:chararray, 
		tag:chararray, 
		timestamp:chararray);

-- Removing the extra row
headless = FILTER tags_data BY userID != 'userId';

-- Exporting the datasets using a bar delimiter
STORE headless INTO 'cleaned_tags' using PigStorage('|');