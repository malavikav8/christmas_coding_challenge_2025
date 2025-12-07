--Question: https://leetcode.com/problems/confirmation-rate/
--Aproach 1(Complicated)
WITH conf_actions AS ( 
    SELECT user_id, count(action) as confirmed_cnt
    FROM Confirmations 
    WHERE action = 'confirmed'
    GROUP BY user_id
), 
all_actions AS ( 
    SELECT user_id, count(action) as total_cnt
    FROM Confirmations
    GROUP BY user_id
)

SELECT 
    s.user_id, 
    ROUND(
        COALESCE(c.confirmed_cnt, 0)::DECIMAL / COALESCE(a.total_cnt, 1), 
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN conf_actions c ON s.user_id = c.user_id
LEFT JOIN all_actions a ON s.user_id = a.user_id;

--Approach 2(Simple Straight forward)
SELECT 
    s.user_id, 
    ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1.0 ELSE 0.0 END), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;
