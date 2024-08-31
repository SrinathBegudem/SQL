# Write your MySQL query statement below
  
-- Solution 1 (advance)

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);

-- solution 2 (beginner)

-- Step 1: Count the total number of distinct products
WITH TotalProducts AS (
    SELECT COUNT(DISTINCT product_key) AS total_product_count
    FROM Product
),

-- Step 2: Count the distinct products each customer has bought
CustomerPurchases AS (
    SELECT c.customer_id, COUNT(DISTINCT p.product_key) AS products_bought
    FROM Customer c
    JOIN Product p ON c.product_key = p.product_key
    GROUP BY c.customer_id
)

-- Step 3: Find customers who bought all products
SELECT c.customer_id
FROM CustomerPurchases c
JOIN TotalProducts t
ON c.products_bought = t.total_product_count;
