--https://leetcode.com/problems/average-selling-price/
SELECT
    p.product_id,
    COALESCE((SUM(us.units * p.price) * 1.0 / SUM(us.units)), 0)::NUMERIC(10,2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold us ON p.product_id = us.product_id
AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

--https://leetcode.com/problems/rising-temperature/
SELECT w1.id FROM Weather w1
JOIN Weather w2 ON w1.recordDate = (w2.recordDate + INTERVAL '1 day')
AND w1.temperature > w2.temperature;
