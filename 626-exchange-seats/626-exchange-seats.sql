# Write your MySQL query statement below

select 

case when id%2!=0 and id!=sc.counts then id+1
when id%2<>0 and id=sc.counts then id
else id -1
end as id,
student
from Seat,
(select count(*) counts from seat) sc
order by id
