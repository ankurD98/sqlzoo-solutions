--1 Winners from 1950
select *
from nobel 
where yr = 1950

--2 1962 Literature
select winner
from nobel
where yr = 1962 and subject = 'literature'

--3 Albert Einstein
select yr, subject
from nobel
where winner = 'albert einstein'

--4 Recent Peace Prizes
select winner
from nobel
where yr >= 2000 and subject = 'peace'

--5 Literature in the 1980's
select * 
from nobel
where yr between 1980 and 1989 and subject = 'literature'

--6 Only Presidents
select * 
from nobel
where winner in ('theodore roosevelt', 'woodrow wilson', 'jimmy carter', 'barack obama')

--7 John
select winner
from nobel
where winner like 'john %'

--8 Chemistry and Physics from different years
select *
from nobel
where (yr = 1980 and subject = 'physics') or (yr = 1984 and subject = 'chemistry')

--9 Exclude Chemists and Medics
select *
from nobel
where yr = 1980 and subject not in ('chemistry', 'medicine')

--10 Early Medicine, Late Literature
select * from 
nobel
where (subject = 'medicine' and yr < 1910) or (subject = 'literature' and yr >= 2004)

--11 Umlaut
select * 
from nobel
where winner like 'peter gr_nberg'

--12 Apostrophe
select * 
from nobel
where winner like 'eugene o\'neill'

--13 Knights of the realm
select winner, yr, subject
from nobel
where winner like 'sir %'
order by yr desc, winner

--14 Chemistry and Physics last
select winner, subject
from nobel
where yr = 1984 
order by subject in ('Chemistry', 'Physics'), subject, winner