-- Question1: https://leetcode.com/problems/students-and-examinations/
--learnt use of cross joins in sql
-- Write your PostgreSQL query statement below
SELECT
    s.student_id,
    s.student_name,
    sb.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN
    Examinations e ON s.student_id = e.student_id
    AND sb.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sb.subject_name
ORDER BY s.student_id, sb.subject_name;

-- Question2: https://leetcode.com/problems/not-boring-movies/
-- Write your PostgreSQL query statement below
SELECT id, movie, description, rating 
FROM Cinema 
WHERE MOD(id,2) != 0 and description != 'boring'
ORDER BY rating desc;

--Question3: https://leetcode.com/problems/find-followers-count/
--Write your PostgreSQL query statement below
SELECT DISTINCT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id asc;

--Question4:https://leetcode.com/problems/classes-with-at-least-5-students/
-- Write your PostgreSQL query statement below
SELECT class FROM Courses
GROUP BY class
HAVING count(student)>=5;

