-- Question https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
SELECT e.name
FROM Employee e
JOIN Employee m ON e.id = m.managerId
GROUP BY e.id, e.name
HAVING COUNT(DISTINCT m.id) >= 5;
