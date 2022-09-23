
# 7월에 신규유저가 하루안에 결제로 넘거갈 비율, 결제까지 소요되는 시간
# 시간유저의 가입일, 최초구매일
with rt_tbl as (
			select A.customer_id
				-- , A.created_at
				, B.customer_id as paying_user
				-- , B.purchased_at
				, time_to_sec(timediff(B.purchased_at, A.created_at))/3600 as diff_hour
                
			from fastcampus.tbl_customer A
            
			left join(
					select customer_id
						, min(purchased_at) as purchased_at
					from fastcampus.tbl_purchase
					group by 1 ) B
			on A.customer_id = B.customer_id
			and B.purchased_at < A.created_at + interval 1 day
			where A.created_at >= '2020-07-01'
			and A.created_at < '2020-08-01'
)
select round(count(paying_user) / count(customer_id) * 100,2)
from rt_tbl

union all
select avg(diff_hour)
from rt_tbl
