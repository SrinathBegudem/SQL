# Write your MySQL query statement below

-- Solution 1 (without joins)

select product_id, year as first_year, quantity, price 
from sales 
where (product_id,year) in 
(select product_id, min(year) 
from sales 
group by product_id);

-- Solution 2 (with joins)

select s.product_id, f.first_year, s.quantity, s.price
from Sales s
left join 
(select product_id, min(year) as first_year 
from sales 
group by product_id) as f
on s.product_id = f.product_id
where s.year = f.first_year;
