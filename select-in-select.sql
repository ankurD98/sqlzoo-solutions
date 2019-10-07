--1 Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2 Richer than UK
select name 
from world
where gdp/population > (select gdp/population from world where name = 'United Kingdom') and continent = 'Europe'

--3 Neighbours of Argentina and Australia
select name, continent
from world
where continent in (select continent from world where name = 'Argentina' or name = 'Australia')
order by name

--4 Between Canada and Poland
select name, population
from world
where population > (select population from world where name = 'Canada') and population < (select population from world where name = 'Poland')

--5 Percentages of Germany
select name, concat(round(population / (select population from world where name = 'Germany') * 100, 0), '%')
from world
where continent = 'Europe'

--6 Bigger than every country in Europe
select name
from world
where gdp > all (select gdp from world where continent = 'Europe' and gdp > 0)

--7 Largest in each continent
select continent, name, area 
from world x
where area >= all (select area from world y where x.continent = y.continent and area > 0)

--8 First country of each continent (alphabetically)
select continent, name 
from world x
where name <= all (select name from world y where x.continent = y.continent)

--9 Difficult Questions That Utilize Techniques Not Covered In Prior Sections
select name, continent, population
from world
where continent in 
(select continent
from world x
where 25000000 >= all (select population from world y where x.continent = y.continent))

--10    
select name, continent
from world x
where population > all(select 3*population from world y where x.continent = y.continent and x.name <> y.name)