# Write your MySQL query statement below
with ubanned as (
select * from Users where banned = 'No'
),
drivers as (

select t.client_id, t.driver_id, t.status, t.request_at from Trips t
    inner join ubanned u on t.driver_id = u.users_id
),
final as (

select * from drivers d
     inner join ubanned u
     on d.client_id = u.users_id

)

select request_at as 'Day', round(coalesce((SUM(CASE WHEN STATUS LIKE 'cancelled%' then 1 else 0 end)/count(*)),0),2) as 'Cancellation Rate'
from final
where request_at between "2013-10-01" and "2013-10-03"
group by request_at




# {"headers": ["client_id", "driver_id", "status", "request_at", "users_id", "banned", "role"], "values": 
# [[1, 10, "completed", "2013-10-01", 1, "No", "client"],
#  [3, 12, "completed", "2013-10-01", 3, "No", "client"],
#  [4, 13, "cancelled_by_client", "2013-10-01", 4, "No", "client"], 
#  [1, 10, "completed", "2013-10-02", 1, "No", "client"], 
#  [3, 12, "completed", "2013-10-02", 3, "No", "client"],
#  [3, 10, "completed", "2013-10-03", 3, "No", "client"], 
#  [4, 13, "cancelled_by_driver", "2013-10-03", 4, "No", "client"]]}



