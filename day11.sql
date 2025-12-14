--https://leetcode.com/problems/queries-quality-and-percentage/
-- Write your PostgreSQL query statement below
select query_name, 
ROUND(AVG(rating::numeric / position), 2) AS quality,
ROUND(AVG(CASE WHEN rating < 3 THEN 100.0 ELSE 0 END), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name

/* IN PANDAS
import pandas as pd

def queries_stats(queries: pd.DataFrame) -> pd.DataFrame:
   queries['quality'] = queries['rating'] / queries['position']
   queries['poor_query_percentage'] = (queries['rating'] < 3) * 100
   result = queries.groupby('query_name')[['quality','poor_query_percentage']].mean().reset_index()
   result[['quality', 'poor_query_percentage']] = (result[['quality', 'poor_query_percentage']] + 1e-9).round(2) 

   return result
   */
   

    

