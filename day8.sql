--Question https://leetcode.com/problems/employee-bonus/
-- Write your PostgreSQL query statement below
SELECT e.name, b.bonus from Employee e
left join Bonus b on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null ;

--in pandas
/*import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    merged_df = pd.merge(employee, bonus, on='empId', how='left')
    result_df = merged_df.loc[
        (merged_df['bonus'] < 1000) | (merged_df['bonus'].isnull())
    ]
    return result_df[['name', 'bonus']] */
    
    
