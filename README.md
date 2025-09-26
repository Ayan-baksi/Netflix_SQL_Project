

# Netflix Movies and TV Shows Data Analysis using SQL

![](https://github.com/najirh/netflix_sql_project/blob/main/logo.png)

## 📌 Project Overview
- Dataset used: `netflix_titles.csv` (8,807 records, 12 columns)  
- Technology: **PostgreSQL**  
- Focus: Writing **20+ practical SQL queries** that are commonly used in real-world data analysis.  
- Concepts Covered:
  - Aggregations (`COUNT`, `AVG`, `MAX`, etc.)
  - `GROUP BY`, `HAVING`
  - `JOIN`s
  - `CTE` (Common Table Expressions)
  - `WINDOW functions`
  - `SUBQUERIES`
  - `CASE` statements
  - String & Date functions

---

## 🔎 Key Business Questions Answered
Some examples of insights explored:
1. How many Movies vs. TV Shows are available on Netflix?  
2. What are the most common content ratings?  
3. Which countries produce the most content?  
4. How has Netflix’s content grown year by year?  
5. What are the most popular genres?  
6. Who are the top directors and actors?  
7. What is the average duration of Movies?  
8. Which year had the highest releases?  
9. Seasonality: Which months see the most content added?  
10. Percentage of Movies vs. TV Shows.  

👉 A total of **22 carefully designed queries** have been written to cover a wide range of analysis.

---

## 📊 Example Queries
```sql
-- 1. Count Movies vs TV Shows
SELECT type, COUNT(*) AS total_count
FROM netflix
GROUP BY type;

-- 2. Most common rating
SELECT rating, COUNT(*) AS total_count
FROM netflix
GROUP BY rating
ORDER BY total_count DESC
LIMIT 1;

-- 3. Top 10 countries with most titles
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;
```

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```


## 📈 Skills Demonstrated

- SQL for Data Analysis: Aggregations, Filtering, Ranking, Joins, Subqueries.
- Advanced SQL: CTEs, Window Functions, Case Expressions.
- Data Cleaning in SQL: Handling null values, splitting multi-value fields, working with dates.
- Business Analytics Thinking: Transforming raw Netflix data into actionable insights.


## 💡 Insights Gained

- Netflix has more Movies than TV Shows, but TV Shows are growing rapidly.
- TV-MA is the most common content rating.
- The US, India, and UK dominate Netflix’s content library.
- Genres like Documentaries, Stand-up Comedy, and International TV Shows are among the most popular.
- There is clear seasonality in content addition trends.


## 👨‍💻 Author
Ayan Baksi

SQL & Data Analytics Enthusiast

💼 Open to Data Analyst / Business Intelligence / SQL Developer roles

🌐 LinkedIn Profile: https://www.linkedin.com/in/ayan-baksi/

---
  

