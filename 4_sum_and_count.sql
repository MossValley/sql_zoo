-- Show the total population of the world (answer given)
SELECT SUM(population)
  FROM world

-- List all the continents - just once each. 
SELECT DISTINCT continent
  FROM world;

-- Give the total GDP of Africa 
SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa';

-- How many countries have an area of at least 1000000 
SELECT COUNT(name)
  FROM world
 WHERE area >= 1000000;

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania') 
SELECT SUM(population)
  FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- For each continent show the continent and number of countries. 
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent;

-- For each continent show the continent and number of countries with populations of at least 10 million. 
SELECT continent, COUNT(name) AS 'min Million'
  FROM world
 WHERE population >= 10000000
 GROUP BY continent;

-- List the continents that have a total population of at least 100 million. 
SELECT DISTINCT continent
  FROM world x
 WHERE 100000000 <= ALL(
    SELECT SUM(population)
      FROM world y
     WHERE y.continent = x.continent
    );


-- Quiz answers
-- 1) 3
-- 2) 1
-- 3) 4
-- 4) 5
-- 5) 2
-- 6) 5
-- 7) 4
-- 8) 4 (table D)
