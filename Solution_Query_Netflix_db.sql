USE netflix_db;

-- 1. List all users subscribed to the Premium plan:
SELECT user_id, name, email
FROM users
WHERE plan='Premium';

-- 2. Retrieve all movies in the Drama genre with a rating higher than 8.5:
SELECT title,genre, rating
from Movies
WHERE genre='Drama' AND rating>8.5;

-- 3. Find the average rating of all movies released after 2015:
SELECT 
    AVG(rating) as avg_rating
FROM movies
where release_year > 2015;
   
-- 4. List the names of users who have watched the movie Stranger Things along with their completion percentage:
SELECT U.name, W.completion_percentage
FROM Users U    
INNER JOIN Watchhistory W on U.user_id=W.user_id
INNER JOIN Movies M on W.movie_id = M.movie_id
WHERE M.title = 'Stranger Things';

-- 5. Find the name of the user(s) who rated a movie the highest among all reviews:
SELECT U.user_id,U.name
from Users U   
INNER JOIN Reviews R on U.user_id = R.user_id
WHERE R.rating = (select MAX(rating) FROM Reviews);

-- 6. Calculate the number of movies watched by each user and sort by the highest count:
SELECT
    U.user_id,
    U.name,
    COUNT(W.movie_id) as movie_watched
FROM Users U   
INNER JOIN Watchhistory W on U.user_id = W.user_id
GROUP BY U.user_id
ORDER BY movie_watched DESC;
    


-- 7.List all movies watched by John Doe, including their genre, rating, and his completion percentage:
SELECT
    M.title,
    M.genre,
    M.rating,
    W.completion_percentage
FROM Movies M   
INNER JOIN Watchhistory W on M.movie_id = W.movie_id
INNER JOIN Users U on W.user_id = U.user_id
WHERE U.name ='John Doe';

-- 8.Update the movie's rating for Stranger Things:
UPDATE Movies
SET rating = 8.9
WHERE title = 'Stranger Things';

-- 9.Remove all reviews for movies with a rating below 4.0:
DELETE FROM Reviews
WHERE movie_id IN (SELECT movie_id FROM Movies WHERE rating < 4.0);

-- 10. Fetch all users who have reviewed a movie but have not watched it completely (completion percentage < 100):
SELECT U.name, M.title, R.review_text
FROM Users U   
INNER JOIN reviews R on U.user_id = R.user_id
INNER JOIN Movies M on R.movie_id = M.movie_id
LEFT JOIN Watchhistory W on U.user_id = W.user_id AND M.movie_id = W.movie_id
WHERE (completion_percentage IS NULL OR completion_percentage < 100);

-- 11.Retrieve all users who have reviewed the movie Stranger Things, including their review text and rating:
SELECT U.user_id, U.name, R.review_text, R.rating
FROM users U   
INNER JOIN Reviews R on U.user_id = R.user_id
INNER JOIN movies M on R.movie_id = M.movie_id
WHERE M.title = 'Stranger Things';

-- 12. Fetch the watch history of all users, including their name, email, movie title, genre, watched date, and completion percentage:
SELECT 
    U.user_id,
    U.name,
    U.email,
    M.title,
    M.genre,
    W.watched_date,
    W.completion_percentage
FROM users U  
INNER JOIN watchhistory W ON U.user_id = W.user_id
INNER JOIN movies M on W.movie_id = M.movie_id;

-- 13.List all movies along with the total number of reviews and average rating for each movie, including only movies with at least two reviews:
SELECT M.title, COUNT(R.review_id) as total_reviews, AVG(R.rating) as avg_rating
FROM movies M   
INNER JOIN reviews R on M.movie_id = R.movie_id
GROUP BY M.movie_id
HAVING COUNT(R.review_id) >=1;









