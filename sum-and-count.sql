--1 Total world population
SELECT SUM(population)
FROM world

--2 List of continents
select distinct continent
from world

--3 GDP of Africa
select sum(gdp)
from world
where continent = 'africa'

--4 Count the big countries
select count(name)
from world
where area >= 1000000

--5 Baltic states population
select sum(population)
from world
where name in ('estonia', 'latvia', 'lithuania')

--6 Counting the countries of each continent
select continent, count(name) 
from world
group by continent

--7 Counting big countries in each continent
select continent, count(name)
from world
where population >= 10000000
group by continent

--8 Counting big continents
select continent
from world
group by continent
having sum(population) >= 100000000
