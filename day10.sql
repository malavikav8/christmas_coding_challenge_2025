--Question: https://leetcode.com/problems/project-employees-i/
SELECT 
    p.project_id,
    ROUND(CAST(AVG(e.experience_years) AS numeric), 2) AS average_years
FROM  Project p
JOIN  Employee e ON p.employee_id = e.employee_id
GROUP BY  p.project_id;

/* import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    merged = project.merge(employee, on='employee_id')
    result = merged.groupby('project_id')['experience_years'].mean().reset_index()
    result.rename(columns={'experience_years': 'average_years'}, inplace=True)
    result['average_years'] = result['average_years'].round(2)
    return result */
