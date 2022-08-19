/* Write your T-SQL query statement below */

with cte as (
select pu.invoice_id , pr.product_id, pu.quantity,pu.quantity*pr.price as price,
sum(pu.quantity*pr.price) over(partition by pu.invoice_id) total_price,
    rank() over(order by pu.invoice_id) as rnk
from Products as Pr inner join Purchases as Pu
on pr.product_id = pu.product_id)
 
-- order by total_price desc, invoice_id
 
select product_id, quantity, price
from (select product_id, quantity, price, rnk from cte 
where total_price >=(select max(total_price) from cte)) t1
where  rnk = (select min(rnk) from cte 
where total_price >=(select max(total_price) from cte))


