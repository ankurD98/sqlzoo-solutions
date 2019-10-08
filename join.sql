--1 
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

--2
SELECT id,stadium,team1,team2
FROM game
where id = 1012

--3
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (teamid = 'GER' and id=matchid)

--4
select team1, team2, player
from game 
join goal
on player like 'Mario%' and matchid = id

--5
select player, teamid, coach, gtime
from goal 
join eteam
on gtime <= 10 and id = teamid

--6
select mdate, teamname
from game
join eteam
on coach = 'Fernando Santos' and (eteam.id = team1)

--7
select player 
from goal
join game
on (stadium = 'National Stadium, Warsaw' and id = matchid)

--8
select distinct player
from goal
join game
on (id = matchid and teamid <> 'GER' and (team1 = 'GER' or team2 = 'GER'))

--9
select teamname, count(matchid)
from eteam
join goal
on teamid = id
group by teamname

--10
select stadium, count(matchid)
from game
join goal
on id = matchid
group by stadium

--11
SELECT matchid, mdate, count(teamid)
from game
join goal on id = matchid
where team1 = 'POL' or team2 = 'POL'
group by matchid, mdate

--12
select matchid, mdate, count(teamid)
from goal
join game on id = matchid
where teamid = 'GER'
group by matchid, mdate

--13
select mdate, team1,
sum(case when team1 = teamid then 1 else 0 end) score1, team2, 
sum(case when team2 = teamid then 1 else 0 end) score2 
from game
left join goal on matchid = id
group by mdate, team1, team2
order by mdate, matchid, team1, team2
