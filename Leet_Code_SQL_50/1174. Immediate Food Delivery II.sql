# Write your MySQL query statement below

Type 1
select ROUND(AVG(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) * 100, 2) AS immediate_percentage
from Delivery d
join
(select customer_id, min(order_date) as first_order_date
from Delivery
group by customer_id)  f
on 
d.customer_id = f.customer_id 
and d.order_date = f.first_order_date


Type 2
select ROUND(AVG(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) * 100, 2) AS immediate_percentage
from Delivery d
where (customer_id,order_date) in (select customer_id, min(order_date) as first_order_date
from Delivery
group by customer_id)
