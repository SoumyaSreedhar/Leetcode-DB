/* Write your T-SQL query statement below */

-- select CONCAT(YEAR(pay_date),'-',RIGHT(CONCAT('00', MONTH(pay_date)),2)) from Salary;
with cte as (select distinct S.pay_date, E.department_id,
avg(S.amount) over(partition by E.department_id, S.pay_date) dep_avg
from Salary S inner join Employee E
on S.employee_id = E.employee_id
--order by E.department_id
            ),
pay as (select pay_date,avg(amount) comp_avg from Salary
group by pay_date)

select distinct CONCAT(YEAR(pay.pay_date),'-',RIGHT(CONCAT('00', MONTH(pay.pay_date)),2)) as pay_month ,
cte.department_id,
case when cte.dep_avg > pay.comp_avg then 'higher'
              when cte.dep_avg < pay.comp_avg then 'lower' 
              when cte.dep_avg = pay.comp_avg then 'same'
              end as comparison
   from  cte  inner join pay on cte.pay_date = pay.pay_date





