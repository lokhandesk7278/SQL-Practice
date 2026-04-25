/*You are given a table containing match information from a tournament.
Each record represents a match between two teams and the winner of that match.

Write a SQL query to generate a points table that shows for each team:

Matches played

Wins

Losses

Points (2 points per win)

📂 Table Structure

create table icc_world_cup
(
    team_1 varchar(20),
    team_2 varchar(20),
    winner varchar(20)
);
*/

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;
select team_name, count(1) as no_of_matches_played, sum(win_flag) as no_of_matches_won, count(1) - sum(win_flag) as no_of_losses
from (
    select team_1 as team_name, case when team_1=winner then 1 else 0 end as win_flag
    from icc_world_cup
    union all
    select team_2 as team_name, case when team_2=winner then 1 else 0 end as win_flag
    from icc_world_cup
) A
group by team_name
order by no_of_matches_won desc;

/*Explanation :
The query calculates team-wise performance from the icc_world_cup table by first transforming match data into a team-centric format and then aggregating results.
Since each match row contains two teams (team_1 and team_2), a subquery is used with UNION ALL to split every match into two rows—one for each team—so that each team appears separately. 
Inside this subquery, a CASE statement assigns a win_flag of 1 if the team is the winner and 0 otherwise, effectively marking wins and losses. 
The outer query then groups these rows by team_name using GROUP BY and applies aggregate functions:
COUNT(1) to calculate the total matches played, SUM(win_flag) to count wins, and the difference between them to compute losses.
Finally, the results are sorted in descending order of wins using ORDER BY, giving a clear leaderboard-style summary of team performance.*/
