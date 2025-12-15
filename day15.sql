--https://leetcode.com/problems/primary-department-for-each-employee/
-- Write your PostgreSQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION
--because PostgreSQL is strict about grouping, we use MAX(department_id) to select the department column. Since these employees only have one department anyway, MAX just returns that single ID.
SELECT employee_id, MAX(department_id)
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1;

/* in pandas
import pandas as pd

def find_primary_department(employee: pd.DataFrame) -> pd.DataFrame:
    employee['dept_count'] = employee.groupby('employee_id')['department_id'].transform('count')
    result = employee[
        (employee['primary_flag'] == 'Y') | 
        (employee['dept_count'] == 1)
    ]
    return result[['employee_id', 'department_id']] */
