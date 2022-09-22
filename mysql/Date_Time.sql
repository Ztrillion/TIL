# Date Format Function

SELECT NOW();
SELECT CURRENT_DATE(); # NOW와 똑같지만 년,월,일까지만 보여즘
SELECT EXTRACT(MONTH FROM '2020-01-01');
SELECT DAY('2020-01-01');
SELECT DATE_ADD('2020-01-01', INTERVAL 7 DAY);
SELECT DATE_SUB('2021-06-15', INTERVAL 7 DAY);
SELECT DATEDIFF('2017-06-25', '2017-06-15');
SELECT TIMEDIFF('2021-01-15 12:00:00','2021-01-13 10:00:00');
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %p');

# 7월의 평균 DAU(Daily Active Users)
select avg(users)
from(
select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date_at,
count(distinct customer_id) as users
from fastcampus.tbl_visit
where visited_at >= '2020-07-01' and visited_at < '2020-08-01'
group by 1
order by 1) foo;

# WAU(Weekly Active Users)
select avg(users)
from(
select date_format(visited_at - interval 9 hour, '%Y-%m-%U') as date_at,
count(distinct customer_id) as users
from fastcampus.tbl_visit
where visited_at >= '2020-07-05' and visited_at < '2020-07-26'
group by 1
order by 1) foo;


#daily revenue
select avg(revenue)
from(
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at, sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by 1
order by 1)f;

# weekly revenue
select avg(revenue)
from(
select date_format(purchased_at - interval 9 hour, '%Y-%m-%U') as date_at, sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-05' and purchased_at < '2020-07-26'
group by 1
order by 1)f;


# 요일별 revenue
select date_format(date_at, '%w') as day_order,
	date_format(date_at, '%W') as day_name,
	avg(revenue)
from(
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
    , sum(price) as revenue
	from fastcampus.tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1)foo
group by 1,2
order by 1;

# 요일 및 사건eo뵬 revenue
select dayofweek_at,hour_at,avg(revenue)
from(
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as date_at
	, date_format(purchased_at - interval 9 hour, '%W') as dayofweek_at
	, date_format(purchased_at - interval 9 hour, '%H') as hour_at
    , sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by 1,2,3)foo
group by 1,2
order by 3 desc


