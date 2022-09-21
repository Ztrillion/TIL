SELECT * FROM fastcampus.tbl_purchase;

# Revenue
SELECT sum(price) AS Revenue
FROM fastcampus.tbl_purchase
WHERE  purchased_at >= '2020-07-01' and purchased_at < '2020-08-01';

# MAU(Monthly Active Users)
select count(distinct customer_id)
from fastcampus.tbl_visit
where visited_at >= '2020-07-01' and visited_at < '2020-08-01';

# 결제요금
select count(distinct customer_id)
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01';

# ARPPU(Average Revenue per Playing User)
select avg(Revenue)
from (select customer_id, sum(price) as Revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by customer_id) hoo ;

# 7월 매출  top3 고객
-- 1인당 얼마를 썻는지 확인
select customer_id, sum(price) as Revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by 1
order by 2 desc
limit 3 ;