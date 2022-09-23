# 2020년 7월 성별에 따라 총구매건수, 총Revenue, 성별은 하나로 묶기

select case when B.gender = 'M' then '남성'
			when B.gender = 'F' then '여성'
            when B.gender = 'Others' then '기타'
            when length(B.gender)<1 then '기타'
            end as gender
		, count(*) as cnt
        , sum(price) as revenue
from fastcampus.tbl_purchase A
left join fastcampus.tbl_customer B
on A.customer_id = B.customer_id
where A.purchased_at >= '2020-07-01' and A.purchased_at < '2020-08-01'
group by 1;

# 성별 및 연령대에 따라
select case when B.gender = 'M' then '남성'
			when B.gender = 'F' then '여성'
            when B.gender = 'Others' then '기타'
            when length(B.gender) < 1 then '기타'
            end as gender
	  , case when B.age <= 15 then '15세 이하'
			 when B.age <= 20 then '15~20세'
             when B.age <= 25 then '21~25세'
             when B.age <= 30 then '26~30세'
             when B.age <= 35 then '31~35세'
             when B.age <= 40 then '36~40세'
             when B.age <= 45 then '41~45세'
             when B.age >= 46 then '46세 이상'
			end as age_group
		, count(*) as cnt
        , sum(price) as revenue
from fastcampus.tbl_purchase A
left join fastcampus.tbl_customer B
on A.customer_id = B.customer_id
where A.purchased_at >= '2020-07-01' and A.purchased_at < '2020-08-01'
group by 1,2
order by 4 desc