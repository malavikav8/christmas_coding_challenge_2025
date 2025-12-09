--https://leetcode.com/problems/average-time-of-process-per-machine/

-- Write your PostgreSQL query statement below
SELECT a1.machine_id, 
ROUND(CAST(AVG(a2.timestamp - a1.timestamp) AS numeric), 3) as processing_time
FROM Activity a1
Join Activity a2 on a1.machine_id = a2.machine_id
and a1.process_id = a2.process_id
WHERE a1.activity_type = 'start' and a2.activity_type='end'
GROUP BY a1.machine_id;

--IN pandas
/* import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    df = activity.pivot(index=['machine_id', 'process_id'], 
                    columns='activity_type', 
                    values='timestamp')
    df['processing_time'] = df['end'] - df['start']
    result = df.groupby('machine_id')['processing_time'].mean().reset_index()
    result['processing_time'] = result['processing_time'].round(3)
    
    return result */
