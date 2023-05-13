# Write your MySQL query statement below
select ad_id
, round(coalesce(Ad_total_clicked/(Ad_total_clicked+Ad_total_views)*100,0),2) as ctr
from
(select ad_id
, sum(case when action = 'Clicked' then 1 else 0 end) as Ad_total_clicked 
, sum(case when action = 'Viewed' then 1 else 0 end) as Ad_total_views
from Ads 
group by ad_id
order by ad_id)x
order by ctr desc, ad_id 


