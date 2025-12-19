-- Write your PostgreSQL query statement below
/* Question 1:  https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/ */
SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans
FROM  Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY 
    customer_id;

--Question 2: https://leetcode.com/problems/monthly-transactions-i/
SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    TO_CHAR(trans_date, 'YYYY-MM'), country;

-- Write your PostgreSQL query statement below
--Question 3: https://leetcode.com/problems/game-play-analysis-iv/
WITH first_logins AS (
   --Finding the first login date for each unique player
    SELECT player_id, MIN(event_date) as first_date
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND(
        --first_date + 1
        COUNT(a.player_id)::DECIMAL 
        / 
        -- Counting total unique players
        COUNT(fl.player_id), 
        2
    ) AS fraction
FROM first_logins fl
LEFT JOIN Activity a 
    ON fl.player_id = a.player_id 
    AND a.event_date = fl.first_date + 1;

--Question4 : https://leetcode.com/problems/product-sales-analysis-iii/
-- Write your PostgreSQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);

-- Question5: https://leetcode.com/problems/customers-who-bought-all-products/
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
