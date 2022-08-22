with cte1 as 
(
select 
    action_date,
    count(distinct r.post_id)*100/count(distinct a.post_id) perc
from actions a
left join removals r using (post_id) 
where action = 'report' and extra = 'spam'
group by 1
)

select round(avg(perc),2) average_daily_percent from cte1


