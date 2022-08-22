with cte1 as 
(
select 
    action_date,
    (count(distinct r.post_id)/count(distinct a.post_id))*100 as percent
from actions a
left join removals r using (post_id) 
where action = 'report' and extra = 'spam'
group by 1
)

select round(avg(percent), 2) as average_daily_percent from cte1