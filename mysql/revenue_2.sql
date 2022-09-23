# 일별 고과금 유저
select *
from(
select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') d_date 
	, customer_id
    , sum(price)
    , dense_rank() over(partition by date_format(purchased_at - interval 9 hour, '%Y-%m-%d') order by sum(price) desc) as rank_rev
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
group by 1,2) fo
where rank_rev <4

