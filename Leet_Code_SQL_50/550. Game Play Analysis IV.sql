# Write your MySQL query statement below

-- Solution 1
select round(count(distinct(f.player_id)) / count(distinct(a.player_id)),2) as fraction
from Activity a
left join 
(select player_id, min(event_date) as first_day
from Activity 
group by player_id) f
on a.event_date - Interval 1 day = f.first_day and 
a.player_id = f.player_id


  
-- Solution 2 

with FirstLogin as (
    select player_id, min(event_date) as first_date
    from Activity 
    group by player_id
),
ConsectiveLogin as (
    select f.player_id
    from Activity a
    left join 
    FirstLogin f 
    on a.player_id = f.player_id 
    and a.event_date - interval 1 day = f.first_date 
)
select round(count(distinct c.player_id)/(select count(distinct player_id) from Activity),2) as fraction
from ConsectiveLogin c
