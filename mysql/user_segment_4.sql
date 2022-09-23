# 2020 7월 일별 매출의 전일 대비 증감폭, 증감률을 구해주세요


with tbl_revenue as (
			select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as d_date
				, sum(price) as revenue
			from fastcampus.tbl_purchase
			where purchased_at >= '2020-07-01'
			  and purchased_at < '2020-08-01'
			group by 1
)

select *
	, revenue - lag(revenue) over(order by d_date asc) diff_revenue
	, round((revenue - lag(revenue) over(order by d_date asc))/lag(revenue) over(order by d_date asc)*100,2) as chg_revenue
from tbl_revenue;


