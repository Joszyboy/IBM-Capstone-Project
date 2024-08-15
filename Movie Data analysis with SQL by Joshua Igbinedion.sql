--Load the csv data into Postgres
COPY movies_data (movies, start_year, genre, votes, ratings, runtime)
FROM 'C:\Users\hp\Desktop\A World of TECH\LM TECH HUB\Python Project\movies_data.csv'
DELIMITER ','
CSV
QUOTE '"'
ESCAPE '"'
HEADER;

--View the imported data
SELECT * FROM movies_data;

--To query for the most voted movies
SELECT movies, votes
FROM movies_data
ORDER BY votes DESC
LIMIT 1;

--To query for the movie with the highest runtime
SELECT movies, runtime
FROM movies_data
ORDER BY votes DESC
LIMIT 1;

--To query for the start_year with the highest number of movies
SELECT start_year, movie_count
FROM (
    SELECT start_year, COUNT(*) AS movie_count
    FROM movies_data
    GROUP BY start_year
) AS year_counts
ORDER BY movie_count DESC
LIMIT 1;

--To query for the genre with the highest number of movies production
SELECT genre, movie_count
FROM (
    SELECT genre, COUNT(*) AS movie_count
    FROM movies_data
    GROUP BY genre
) AS year_counts
ORDER BY movie_count DESC
LIMIT 1;