/* Question1 : https://leetcode.com/problems/recyclable-and-low-fat-products/description/ */
-- Write your PostgreSQL query statement below
SELECT product_id FROM Products 
WHERE low_fats = 'Y' and recyclable='Y';

/* Question2: https://leetcode.com/problems/find-customer-referee/ */
-- Write your PostgreSQL query statement below
SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL; 

/* Question3: https://leetcode.com/problems/big-countries/ */
-- Write your PostgreSQL query statement below
SELECT name, population, area  FROM World
WHERE area >= 3000000 OR population >= 25000000;

/* Question4: https://leetcode.com/problems/article-views-i/description/ */
-- Write your PostgreSQL query statement below
SELECT DISTINCT author_id as id FROM Views
WHERE author_id = viewer_id
ORDER BY author_id asc;

/* Question5: https://leetcode.com/problems/invalid-tweets/ */
-- Write your PostgreSQL query statement below
SELECT tweet_id FROM tweets
WHERE  CHAR_LENGTH(content) > 15 ;
