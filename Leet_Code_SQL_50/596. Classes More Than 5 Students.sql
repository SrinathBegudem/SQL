# Write your MySQL query statement below

-- Solution 1 (using joins)

 select distinct(c2.class)
 from Courses as c1
 join
 (select count(student) as num, class
 from Courses 
 group by class) as c2
 on c2.class = c1.class
 where num >= 5


--  Solution 2 (without joins)

select class
from Courses c 
group by class 
having count(student) >= 5
