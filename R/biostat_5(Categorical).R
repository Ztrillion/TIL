getwd()
setwd("C:/Users/82105/biostatistic")

bio_data = read.csv("biostat_ex_data.csv")
library(dplyr)

bio_data2 <- bio_data %>% mutate_at(vars(sex, Recur, stage, smoking, obesity, Recur_1y,
                                         post.CA19.9.binary, post.CA19.9.3grp), as.factor) %>% 
                          mutate(HTN=as.factor(ifelse(SBP>=140, 1, 0)))

xtabs(~smoking+HTN, data=bio_data2)

# Odds Ratio 추정
install.packages("epiR")
library(epiR)

epi.2by2(xtabs(~smoking+HTN, data = bio_data2))

# 카이제곱 검정
chisq.test(bio_data2$HTN, bio_data2$smoking)

# 기대빈도 출력
chisq.test(bio_data2$HTN, bio_data2$smoking)$expected

# 피셔의 정확 검정
fisher.test(bio_data2$HTN, bio_data2$smoking)

# 짝지어진 데이터 - 맥니마 검정
bio_data3 <- bio_data2 %>% mutate(CEA.grp=as.factor(ifelse(CEA>5, 1, 0)),
                                  post.CEA.grp = as.factor(ifelse(post.CEA>5, 1, 0)))

xtabs(~CEA.grp+post.CEA.grp, data = bio_data3)
mcnemar.test(xtabs(~CEA.grp+post.CEA.grp, data = bio_data3))
mcnemar.test(bio_data3$CEA.grp, bio_data3$post.CEA.grp)
