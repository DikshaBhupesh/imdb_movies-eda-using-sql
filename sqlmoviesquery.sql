SELECT * FROM [imdb1].[dbo].[movies]


/* 1. Calculate the total revenue and average rating for movies directed by each director*/
SELECT director, 
	sum(revenue) AS TotalRevenue,
       AVG(vote_average) AS AverageRating
FROM [imdb1].[dbo].[movies]
GROUP BY director;

/*2.top 5 movies with high budget */
select top 5 budget_adj, original_title
from [imdb1].[dbo].[movies]
order by budget_adj desc;


/*3.movies releasing each year*/
select release_year, count(original_title) as movie_count
from [imdb1].[dbo].[movies]
group by release_year
order by movie_count desc;

/*4.top cast movies where avg vote >8 */
SELECT [cast], vote_average , avg(vote_average) AS AvgRating
FROM [imdb1].[dbo].[movies]
group by [cast], vote_average
having avg(vote_average)>8
order by vote_average desc;



/*5.Checking for missing value*/
select count(*) from [imdb1].[dbo].[movies] 
where id is null 

/*6checking for the top 10 genres with highest budget and how each budget compare to its Revenue */
select top 10 genres, budget, revenue
from [imdb1].[dbo].[movies]
order by revenue desc ; 

/*7. checking for the top 10 genres with highest runtime and how they compare to Revenue*/
select top 10 genres, runtime, revenue 
from [imdb1].[dbo].[movies] 
order by revenue desc; 

/*8.checking for the top 10 genres with highest vote and how they compare to Revenue */
select top 10 genres, vote_average, revenue 
from [imdb1].[dbo].[movies] 
order by revenue desc ;

/*9. Checking for top 10 genres by revenue */
select top 10 genres, revenue
from [imdb1].[dbo].[movies]
order by revenue desc;

/*10. Checking which genre has the highest number of releases overall */
select genres, count(imdb_id) as number_of_movies 
from [imdb1].[dbo].[movies]
group by genres 
order by number_of_movies desc ;

/*11. Checking for the average duration of movies in each genre*/
select genres, avg(runtime) as avg_runtime 
from [imdb1].[dbo].[movies]
group by genres
order by avg_runtime desc; 

/*12.  Which production company has the highest revenue generated */
select production_companies, revenue 
from [imdb1].[dbo].[movies]
order by revenue desc; 

/*13.Finding where average vote is 5 between the release date 2002-04-03 and 2019-04-01  */
select vote_average, count(*) as movie_count 
from [imdb1].[dbo].[movies]
where vote_average = 5 and release_date BETWEEN '2002-04-03' AND '2019-04-01' 
group by vote_average; 

/*14.How many movies fall within the genre of Drama or Comedy in the year 1997 
sql query for this*/
SELECT COUNT(*) AS MovieCount
from [imdb1].[dbo].[movies]
WHERE (genre = 'Drama' OR genre = 'Comedy') AND release_year = 1997;

/*15.How many movies were released in each year?.*/
SELECT release_year, COUNT(*) AS MovieCount
from [imdb1].[dbo].[movies]
GROUP BY release_year;


/*16.List the movies with a runtime longer than the average runtime.*/
SELECT original_title, runtime
from [imdb1].[dbo].[movies]
WHERE runtime > (SELECT AVG(runtime) FROM  [imdb1].[dbo].[movies]);

/*17.Identify the director(s) with the highest average movie rating. */
SELECT director, AVG(rating) AS AverageRating
from [imdb1].[dbo].[movies]
GROUP BY director
ORDER BY AverageRating DESC;

/*18.Who are the top 5 directors with the most movies in the dataset?*/
SELECT top 5 director, COUNT(*) AS MovieCount
from [imdb1].[dbo].[movies]
GROUP BY director
ORDER BY MovieCount DESC;

/*19.Retrieve movies released in 2010.*/
SELECT original_title, release_year
from [imdb1].[dbo].[movies]
WHERE release_year = 2010;

/*20.Find the top 10 highest-rated movies.*/
SELECT top 10 original_title, vote_average
from [imdb1].[dbo].[movies]
ORDER BY vote_average DESC;