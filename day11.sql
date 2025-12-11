/* Question: https://leetcode.com/problems/article-views-i/description/ */
-- Write your PostgreSQL query statement below
SELECT DISTINCT author_id as id FROM Views
WHERE author_id = viewer_id
ORDER BY author_id asc;

/* Question: https://leetcode.com/problems/invalid-tweets/ */
-- Write your PostgreSQL query statement below
SELECT tweet_id FROM tweets
WHERE  CHAR_LENGTH(content) > 15 ;
