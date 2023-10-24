/* Write your T-SQL query statement below */
with cte as (
select tiv_2015,tiv_2016,concat(lat,lon) as city,
    count(*) over(partition by tiv_2015 ) as cnt,
    count(*) over(partition by concat(lat,lon)) as cnt_2
    from insurance
)
select ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM  cte
where cnt>=2 and cnt_2 =1 
