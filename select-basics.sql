--1 Introducing the world table of countries
SELECT population 
FROM world
WHERE name = 'Germany'

--2 Scandinavia
select name, population 
from world 
where name in ('Sweden', 'Norway', 'Denmark')

--3 Just the right size
SELECT name, area 
FROM world
WHERE area between 200000 and 250000
