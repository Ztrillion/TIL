# 성,연령을 남성(25~29세) 와 같이 통합, 각 성/연령이 전체 고객에서 얼마나 차지하는지 분포% 높은순서대로


-- 전체유저수



select concat(case when length(gender)<1 then '기타'
			when gender = 'Others' then '기타'
            when gender = 'M' then '남성'
            when gender = 'F' then '여성'
			end 
        , "("    
		, case when age<=15 then '15세 이하'
				when age<= 20 then '15~20세'
                when age<= 25 then '21~25세'
                when age<= 30 then '26~30세'
                when age<= 35 then '31~35세'
                when age<= 40 then '36~40세'
                when age<= 45 then '41~45세'
                when age >= 46 then '46세 이상'
                end ,")") as 'Segement'
	, round(count(*)/(select  count(*) from fastcampus.tbl_customer)*100,2) as per
from fastcampus.tbl_customer
group by 1
order by 2 desc





