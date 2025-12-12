--Question: https://leetcode.com/problems/find-followers-count/
--Write your PostgreSQL query statement below
SELECT DISTINCT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id asc;

--Question:https://leetcode.com/problems/classes-with-at-least-5-students/
-- Write your PostgreSQL query statement below
SELECT class FROM Courses
GROUP BY class
HAVING count(student)>=5;
