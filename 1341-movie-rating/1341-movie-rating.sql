# Write your MySQL query statement below

(select name as results from (select u.name,
    count(mr.movie_id) as cnt
    from 
MovieRating mr
inner join Users u on mr.user_id = u.user_id
group by u.name)a
order by cnt desc, name asc 
limit 1)

union

(select title as results from (select m.title,
avg(mr.rating) as avg_rating
from
movierating mr inner join Movies m 
on mr.movie_id = m.movie_id
WHERE mr.created_at LIKE '2020-02%'
group by m.title)a
order by avg_rating desc, title
limit 1)
