# Write your MySQL query statement below

--Solution 1 (beginner)
select ROUND(AVG(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) * 100, 2) AS immediate_percentage
from Delivery d
join
(select customer_id, min(order_date) as first_order_date
from Delivery
group by customer_id)  f
on 
d.customer_id = f.customer_id 
and d.order_date = f.first_order_date


--Solution 2 (Intermediate)
select ROUND(AVG(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) * 100, 2) AS immediate_percentage
from Delivery d
where (customer_id,order_date) in (select customer_id, min(order_date) as first_order_date
from Delivery
group by customer_id)

--solution 3 (Advance)
-- Using windows dense rank function (to be posted once i learn the concpets)
