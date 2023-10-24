/* Write your T-SQL query statement below */
-- select distinct
-- -- a.tiv_2015 as tiv_15_a,
-- a.tiv_2016 as tiv_16_a,
-- -- b.tiv_2015 as tiv_15_b,
-- -- b.tiv_2016 as tiv_16_b,
-- concat(a.lat,a.lon) as city
-- from Insurance a
-- inner join Insurance b on
-- a.tiv_2015=b.tiv_2015 and a.pid<> b.pid
-- and concat(a.lat,a.lon) <> concat(b.lat,b.lon)

with cte as (
select tiv_2015,tiv_2016,concat(lat,lon) as city,
    count(*) over(partition by tiv_2015 ) as cnt,
    count(*) over(partition by concat(lat,lon)) as cnt_2
    from insurance
)
select ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM  cte
where cnt>=2 and cnt_2 =1 
