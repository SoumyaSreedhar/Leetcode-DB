/* Write your T-SQL query statement below */

-- select e1.id,
-- count(e1.id) cnt  from
-- Employee E1 left join Employee E2
-- on E1.id = e2.managerId
-- group by e1.id)
-- having cnt>=5

Select name
from Employee
where id in (
Select managerid from Employee
group by managerid
having count(managerid) >=5)