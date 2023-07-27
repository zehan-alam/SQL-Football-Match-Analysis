-- What are the top 30 teams with the highest average overall rating?
SELECT team_long_name,ROUND((buildUpPlaySpeed+
CASE WHEN buildUpPlayDribbling IS NULL 
    THEN (SELECT ROUND(AVG(buildUpPlayDribbling),2) FROM team_attributes)
ELSE buildUpPlayDribbling END+
buildUpPlayPassing+chanceCreationPassing+chanceCreationCrossing+
chanceCreationShooting+defencePressure+defenceAggression+
defenceTeamWidth)/9,2) as overall_rating
FROM team_attributes
LEFT JOIN team
USING (team_api_id)
ORDER BY overall_rating DESC
LIMIT 30;



-- Which team has the highest goal-scoring rate (goals scored per match)?
WITH goal_by_team AS 
(SELECT match_api_id,home_team_api_id as team_api_id,home_team_goal as goal
FROM match
UNION
SELECT match_api_id,away_team_api_id as team_api_id,away_team_goal as goal
FROM match)

SELECT team_long_name, goal_per_match
FROM (SELECT team_api_id,SUM(goal)::FLOAT/COUNT(team_api_id)as goal_per_match
FROM goal_by_team
GROUP BY team_api_id) AS t1
LEFT JOIN team
USING(team_api_id)
ORDER BY goal_per_match DESC
LIMIT 10



-- Best player over the period 2008-2016
SELECT player_name, overall_rating,
EXTRACT('YEAR' FROM now())- EXTRACT('YEAR' FROM birthday) AS age,
height, weight
FROM (SELECT player_api_id, ROUND(AVG(overall_rating),2) as overall_rating
FROM player_attributes
WHERE overall_rating IS NOT NULL
GROUP BY player_api_id) as t1
LEFT JOIN player
USING (player_api_id)
ORDER BY overall_rating DESC
LIMIT 20



-- Real Madrid's(8633) performance over the years?
WITH team_result AS(SELECT home_team_api_id,away_team_api_id,home_team_goal,away_team_goal,
CASE WHEN (home_team_api_id = 8633 AND home_team_goal>away_team_goal) OR
    (away_team_api_id= 8633 AND home_team_goal<away_team_goal)
    THEN 'Won'
    WHEN (home_team_api_id = 8633 AND home_team_goal<away_team_goal) OR
    (away_team_api_id= 8633 AND home_team_goal>away_team_goal)
    THEN 'Lost'
    WHEN home_team_goal=away_team_goal
    THEN 'Draw' END AS result
FROM match
WHERE home_team_api_id=8633 OR away_team_api_id=8633)

SELECT result, COUNT(*)
FROM team_result
GROUP BY result



-- Team with most wins
WITH winner_teams AS(SELECT winner, COUNT(*) AS wins
FROM (SELECT match_api_id,home_team_api_id,home_team_goal,
away_team_goal,away_team_api_id,
CASE WHEN home_team_goal>away_team_goal
    THEN home_team_api_id
    WHEN home_team_goal<away_team_goal
    THEN away_team_api_id
    ELSE Null END AS winner
FROM match) as t1
GROUP BY winner
HAVING winner IS NOT NULL
ORDER BY wins DESC)

SELECT team_long_name,wins
FROM winner_teams
LEFT JOIN team
ON winner_teams.winner = team.team_api_id
LIMIT 20





-- Best Team in German, England, France, Spain, Italy leauges
WITH winner_teams AS(SELECT winner, COUNT(*) AS wins
FROM (SELECT match_api_id,home_team_api_id,home_team_goal,
away_team_goal,away_team_api_id,
CASE WHEN home_team_goal>away_team_goal
    THEN home_team_api_id
    WHEN home_team_goal<away_team_goal
    THEN away_team_api_id
    ELSE Null END AS winner
FROM match
WHERE league_id IN (1729,4769,7809,10257,21518)) as t1
GROUP BY winner),

loser_teams AS(SELECT loser, COUNT(*) AS losses
FROM (SELECT match_api_id,home_team_api_id,home_team_goal,
away_team_goal,away_team_api_id,
CASE WHEN home_team_goal<away_team_goal
    THEN home_team_api_id
    WHEN home_team_goal>away_team_goal
    THEN away_team_api_id
    ELSE Null END AS loser
FROM match
WHERE league_id IN (1729,4769,7809,10257,21518)) as t2
GROUP BY loser),

draw_teams AS(SELECT draw_team,count(*) AS draws
FROM (SELECT match_api_id,
CASE WHEN home_team_goal=away_team_goal
    THEN home_team_api_id
    END AS draw_team
FROM match
UNION
SELECT match_api_id,
CASE WHEN home_team_goal=away_team_goal
    THEN away_team_api_id
    END AS draw_team
FROM match
WHERE league_id IN (1729,4769,7809,10257,21518)) AS t3
GROUP BY draw_team)


SELECT team_long_name, wins, losses, draws,
(wins*3 + draws) AS points
FROM winner_teams AS w
LEFT JOIN loser_teams AS l
ON w.winner=l.loser
LEFT JOIN draw_teams AS d
ON l.loser=d.draw_team
LEFT JOIN team
ON d.draw_team=team.team_api_id
WHERE team_long_name IS NOT NULL
ORDER BY points DESC
LIMIT 50