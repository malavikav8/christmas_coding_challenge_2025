-- Write your PostgreSQL query statement below
--https://leetcode.com/problems/game-play-analysis-iv/
WITH first_logins AS (
   --Finding the first login date for each unique player
    SELECT player_id, MIN(event_date) as first_date
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND(
        --first_date + 1
        COUNT(a.player_id)::DECIMAL 
        / 
        -- Counting total unique players
        COUNT(fl.player_id), 
        2
    ) AS fraction
FROM first_logins fl
LEFT JOIN Activity a 
    ON fl.player_id = a.player_id 
    AND a.event_date = fl.first_date + 1;
