--1 1962 movies
select id, title
from movie
where yr = 1962

--2 When was Citizen Kane released?
select yr 
from movie
where title = 'citizen kane'

--3 Star Trek movies
select id, title, yr
from movie
where title like 'Star Trek%'
order by yr

--4 id for actor Glenn Close
select id from actor
where name = 'glenn close' 

--5 id for Casablanca
select id
from movie
where title = 'casablanca'

--6 Cast list for Casablanca
select name 
from actor 
where id in (select actorid from casting where movieid = 11768)

--7 Alien cast list
select name 
from actor join casting
on id = actorid and movieid = (select id from movie where title = 'Alien')

--8 Harrison Ford movies
select title
from movie join casting
on id = movieid and actorid = (select id from actor where name = 'Harrison Ford')

--9 Harrison Ford as a supporting actor
select title
from movie join casting
on id = movieid and actorid = (select id from actor where name = 'Harrison Ford') and ord <> 1

--10 Lead actors in 1962 movies
select title, name
from movie 
join casting on yr = 1962 and movie.id = casting.movieid and ord = 1
join actor on casting.actorid = actor.id

--11 Busy years for Rock Hudson
select yr, count(movie.id)
from movie
join casting on movie.id = casting.movieid
join actor on actor.name = 'rock hudson' and actor.id = casting.actorid
group by yr
having count(movie.id) > 2

--12 Lead actor in Julie Andrews movies
select title, name
from movie
join casting on movie.id = casting.movieid and casting.movieid in (select casting.movieid from casting where casting.actorid = (select actor.id from actor where name = 'Julie Andrews')) and ord = 1
join actor on actor.id = casting.actorid

--13 Actors with 30 leading roles
select name
from actor 
join casting on actor.id = casting.actorid and ord = 1
group by name
having count(movieid) >= 30

--14 
select title, count(actorid)
from movie
join casting on yr = 1978 and movie.id = casting.movieid
group by title
order by count(actorid) desc, title

--15
select name from actor
join casting on actor.id = casting.actorid and movieid in (select movieid 
from casting
join actor on casting.actorid = actor.id and actor.name = 'art garfunkel')
where name <> 'art garfunkel'

