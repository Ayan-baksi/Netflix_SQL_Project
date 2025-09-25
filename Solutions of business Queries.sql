-- Solutions of 22 business problems

-----------------------------------------------

-- Q1. How many movies and TV shows are available on Netflix?
SELECT type, COUNT(*) AS total_count
FROM netflix
GROUP BY type;

--Q2. Find the most common rating (like TV-MA, TV-14).
SELECT rating, COUNT(*) AS total_count
FROM netflix
GROUP BY rating
ORDER BY total_count DESC
LIMIT 1;

--Q3. List the top 10 countries with the most content on Netflix.
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

--Q4. How many movies were released each year on Netflix?
SELECT release_year, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY release_year;

--Q5. Which year had the highest number of releases?
SELECT release_year, COUNT(*) AS total_releases
FROM netflix
GROUP BY release_year
ORDER BY total_releases DESC
LIMIT 1;

--Q6. Find the top 5 directors with the most movies/TV shows.
SELECT director, COUNT(*) AS total_titles
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 5;

--Q7. What are the top 10 most common genres (listed_in)?
SELECT TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre,
       COUNT(*) AS total_titles
FROM netflix
GROUP BY genre
ORDER BY total_titles DESC
LIMIT 10;

--Q8. Count how many titles were added each year.
SELECT EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year_added,
       COUNT(*) AS total_titles
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

--Q9. Find the average duration of Movies.
SELECT AVG(CAST(SPLIT_PART(duration, ' ', 1) AS INT)) AS avg_movie_minutes
FROM netflix
WHERE type = 'Movie';

--Q10. Show the distribution of TV Shows by number of seasons.
SELECT REPLACE(duration, ' Seasons', '') AS seasons,
       COUNT(*) AS total_shows
FROM netflix
WHERE type = 'TV Show'
GROUP BY seasons
ORDER BY CAST(seasons AS INT);

--Q11. Which country has produced the most TV Shows?
SELECT country, COUNT(*) AS total_shows
FROM netflix
WHERE type = 'TV Show' AND country IS NOT NULL
GROUP BY country
ORDER BY total_shows DESC
LIMIT 1;

--Q12. Which actor/actress appeared most frequently on Netflix titles?
SELECT TRIM(UNNEST(STRING_TO_ARRAY(cast, ','))) AS actor,
       COUNT(*) AS total_titles
FROM netflix
WHERE cast IS NOT NULL
GROUP BY actor
ORDER BY total_titles DESC
LIMIT 1;

--Q13. Find the titles that were released in India.
SELECT title, type, release_year
FROM netflix
WHERE country ILIKE '%India%';

--Q14. List all movies released after 2015.
SELECT title, release_year
FROM netflix
WHERE type = 'Movie' AND release_year > 2015
ORDER BY release_year;

--Q15. Count how many Movies vs TV Shows were added in the last 5 years.
SELECT type, COUNT(*) AS total_count
FROM netflix
WHERE date_added IS NOT NULL
  AND EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
GROUP BY type;

--Q16. Find titles that have more than 1 genre assigned.
SELECT title, listed_in
FROM netflix
WHERE listed_in LIKE '%,%';

--Q17. Get the percentage of Movies vs TV Shows on Netflix.
SELECT type,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM netflix), 2) AS percentage
FROM netflix
GROUP BY type;

--Q18. Find the oldest movie available on Netflix (by release year).
SELECT title, release_year
FROM netflix
WHERE type = 'Movie'
ORDER BY release_year ASC
LIMIT 1;

--Q19. Show the number of content added in each month (seasonality).
SELECT TO_CHAR(TO_DATE(date_added, 'Month DD, YYYY'), 'Month') AS month_name,
       COUNT(*) AS total_titles
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY month_name
ORDER BY total_titles DESC;

--Q20. Find how many titles do not have a director assigned.
SELECT COUNT(*) AS missing_directors
FROM netflix
WHERE director IS NULL;

--Q21. List the top 5 longest movies (by duration).
SELECT title, duration
FROM netflix
WHERE type = 'Movie'
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INT) DESC
LIMIT 5;

--Q22. Using a CTE, show the cumulative number of titles released year by year.
WITH yearly_count AS (
    SELECT release_year, COUNT(*) AS yearly_titles
    FROM netflix
    GROUP BY release_year
)
SELECT release_year,
       yearly_titles,
       SUM(yearly_titles) OVER (ORDER BY release_year) AS cumulative_titles
FROM yearly_count
ORDER BY release_year;
