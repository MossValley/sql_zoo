-- List the films where the yr is 1962 [Show id, title] (answer provided)
SELECT id, title
  FROM movie
 WHERE yr=1962;

-- Give year of 'Citizen Kane'. 
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%star trek%'
 ORDER BY yr;

-- What id number does the actor 'Glenn Close' have? 
SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- What is the id of the film 'Casablanca' 
SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- Obtain the cast list for 'Casablanca'. Use movieid=11768
SELECT name
  FROM actor
   JOIN casting
    ON actorid = actor.id
   JOIN movie
    ON movieid = 11768;

-- Obtain the cast list for the film 'Alien' 
SELECT name
  FROM actor
  JOIN casting
    ON actorid = actor.id
  JOIN movie
    ON movieid = movie.id
 WHERE movie.title = 'Alien';

-- List the films in which 'Harrison Ford' has appeared 
SELECT title
  FROM movie
   JOIN casting
    ON movieid = movie.id
   JOIN actor
    ON actorid = actor.id
 WHERE actor.name = 'Harrison Ford';

-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title
  FROM movie
   JOIN casting
    ON movieid = movie.id
   JOIN actor
    ON actorid = actor.id
 WHERE actor.name = 'Harrison Ford'
 AND casting.ord > 1;

-- List the films together with the leading star for all 1962 films. 
SELECT movie.title, actor.name
  FROM movie
   JOIN casting
    ON movieid = movie.id
   JOIN actor
    ON actorid = actor.id
 WHERE movie.yr = 1962 
 AND ord = 1;

--- Harder Questions 

-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) 
  FROM movie 
   JOIN casting ON movie.id = movieid
   JOIN actor   ON actorid = actor.id
 WHERE name = 'Rock Hudson'
 GROUP BY yr
 HAVING COUNT(title) > 2;

-- List the film title and the leading actor for all of the films 'Julie Andrews' played in. 
SELECT title, name
  FROM casting
   JOIN actor
    ON actorid = actor.id
   JOIN movie
    ON movieid = movie.id
 WHERE movie.id IN ( 
     SELECT movieid FROM casting
      WHERE actorid IN (
       SELECT id FROM actor
        WHERE name='Julie Andrews'))
 AND ord = 1;

-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. 
SELECT name
  FROM actor
   JOIN casting
    ON actorid = actor.id
    AND ord = 1
 GROUP BY name
 HAVING SUM(ord) >=15;

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title. 
SELECT title, COUNT(actorid) AS 'actors'
  FROM movie
   JOIN casting
    ON movieid = movie.id
 WHERE yr = 1978
 GROUP BY title
 ORDER BY actors DESC, title;

-- List all the people who have worked with 'Art Garfunkel'. 
SELECT name FROM casting
  JOIN actor ON actorid = actor.id
 WHERE movieid IN (
  SELECT movieid FROM casting
   WHERE actorid IN (
    SELECT id FROM actor
      WHERE name = 'Art Garfunkel'))
 AND name <> 'Art Garfunkel';


-- Quiz answers
-- 1) 3
-- 2) 5
-- 3) 3
-- 4) 2 (table B)
-- 5) 4
-- 6) 3
-- 7) 2
