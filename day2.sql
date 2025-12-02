/* Question: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/ */
SELECT unique_id, name 
from Employees 
LEFT JOIN  EmployeeUNI on Employees.id = EmployeeUNI.id;

/* Question: https://leetcode.com/problems/product-sales-analysis-i/ */
SELECT product_name,year,price 
from Sales
LEFT JOIN Product on Sales.product_id = Product.product_id;






