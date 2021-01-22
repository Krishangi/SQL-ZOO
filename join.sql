# TABLE 1 - game (id,	mdate,	stadium,	team1,	team2)
# TABLE 2 - goal (matchid,	teamid,	player,	gtime)
# TABLE 3 - eteam (id,	teamname,	coach)

#1. The first example shows the goal scored by a player with the last name 'Bender'. 
The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player
FROM goal 
WHERE teamid='GER'

#2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
Notice in the that the column matchid in the goal table corresponds to the id column in the game table. 
We can look up information about game 1012 by finding that row in the game table.
Show id, stadium, team1, team2 for just game 1012

SELECT DISTINCT id, stadium, team1, team2
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE id=1012

OR ---->

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

#3. The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.
Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id=matchid)
WHERE teamid='GER'

#4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
FROM game
JOIN goal on (id=matchid)
WHERE player LIKE 'Mario%'

#5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON (teamid=id)
WHERE gtime<=10

#6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT game.mdate,eteam.teamname
FROM game
game JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

#7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
FROM goal
goal JOIN game ON game.id=goal.matchid
WHERE game.stadium='National Stadium, Warsaw'

#8. Show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER'

#9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(teamname) AS goals
FROM goal
goal JOIN eteam ON goal.teamid=eteam.id
GROUP BY teamname

#10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(id) AS goals
FROM goal
goal JOIN game ON goal.matchid=game.id
GROUP BY stadium

#11. For every match involving 'POL', show the matchid, date and the number of goals scored.



