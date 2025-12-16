--https://leetcode.com/problems/triangle-judgement/
-- Write your PostgreSQL query statement below
select x,y,z,
CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle 
from Triangle;

/* import pandas as pd
import numpy as np

def triangle_judgement(triangle: pd.DataFrame) -> pd.DataFrame:
    condition = (triangle['x'] + triangle['y'] > triangle['z']) & \
                (triangle['x'] + triangle['z'] > triangle['y']) & \
                (triangle['y'] + triangle['z'] > triangle['x'])
    
    triangle['triangle'] = np.where(condition, 'Yes', 'No')
    return triangle */

--https://leetcode.com/problems/product-sales-analysis-iii/
-- Write your PostgreSQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);

    
