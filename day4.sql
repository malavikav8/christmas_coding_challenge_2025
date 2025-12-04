/* https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/ */
-- Write your PostgreSQL query statement below
select teacher_id, count(DISTINCT subject_id) as cnt
FROM Teacher
GROUP BY teacher_id;
/* in pandas it would be 
import pandas as pd
def count_unique_subjects(teacher: pd.DataFrame) -> pd.DataFrame:
    return teacher.groupby('teacher_id').agg(cnt=('subject_id', 'nunique')).reset_index() */

-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
-- Write your PostgreSQL query statement below
select activity_date as day, count(DISTINCT user_id) as active_users
FROM  Activity
WHERE  activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY day;

--https://leetcode.com/problems/biggest-single-number/
-- Write your PostgreSQL query statement below
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS single_numbers;

/*import pandas as pd
def biggest_single_number(my_numbers: pd.DataFrame) -> pd.DataFrame:
    singles = my_numbers.drop_duplicates(subset=['num'], keep=False)
    biggest = singles['num'].max()
    return pd.DataFrame({'num': [biggest]}) */
