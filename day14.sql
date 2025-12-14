-- QUestion: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
-- Write your PostgreSQL query statement below
select contest_id,
Round(count(user_id) *100/(select count(distinct user_id) from Users):: numeric, 2) as percentage
FROM Register
GROUP BY contest_id
ORDER BY 
percentage desc,
contest_id asc

/* IN PANDAS
import pandas as pd

def users_percentage(users: pd.DataFrame, register: pd.DataFrame) -> pd.DataFrame:
    total_users = len(users)
    df = register.groupby('contest_id')['user_id'].count().reset_index()
    df['percentage'] = (df['user_id'] / total_users) * 100
    df['percentage'] = df['percentage'].round(2)
    df = df.sort_values(by=['percentage', 'contest_id'], ascending=[False, True])
    return df[['contest_id', 'percentage']]
*/
