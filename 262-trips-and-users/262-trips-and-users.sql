with banned_users as (
    select users_id from 
    Users
    where role = 'client' and banned = 'No'
), banned_drivers as (
    select users_id from 
    Users
    where role = 'driver' and banned = 'No'
), final_trips as (
    select t.*
    from Trips t
    join banned_users bu on t.client_id = bu.users_id
    join banned_drivers bd on t.driver_id = bd.users_id
    
)

select 
request_at as Day,
cast((sum(case when status like 'cancelled%' then 1.0 else 0 end) /count(request_at)) as decimal(10,2)) as 'Cancellation Rate'
from final_trips 
where request_at between '2013-10-01' and '2013-10-03'
group by request_at
