getwd()
setwd("C:/Users/82105/biostatistic/")
dat0 <- read.csv("biostat_ex_data.csv")
summary(bio_data)
library(dplyr)
dat1 <- dat0 %>% mutate_at(vars(sex, Recur, stage, smoking, obesity, Recur_1y,
                             post.CA19.9.binary,post.CA19.9.3grp),as.factor)
summary(dat1)

#도수분포표
summary(dat1$stage)

# 막대그래프 ggplot2

library(ggplot2)
ggplot(dat1) + geom_bar(aes(x=stage))

#평균
mean(dat1$age)

# 중앙값
median(dat1$age)

# 분산
var(dat1$age)

#표준편차
sd(dat1$age)

#다섯수치요약
fivenum(dat1$age)

summary(dat1$age)

#히스토그램

ggplot(dat1) + geom_histogram(aes(x=age))
ggplot(dat1) + geom_histogram(aes(x=age), breaks=seq(20,80,10),
                              color="black", fill="skyblue")
ggplot(dat1) + geom_boxplot(aes(x=1,y=age)) + scale_x_continuous(breaks = NULL)+theme(axis.title.x = element_blank())

# 기울어진 분포와 통계량 CA19-9의 분포

ggplot(dat1) + geom_histogram(aes(x=CA19.9), color="black", fill="grey")
summary(dat1$CA19.9)

# 결과 보고 참고사항

library(tableone)
t1 <- CreateTableOne(vars = c("age","sex","CA19.9","CRP","CEA","stage",
                              "smoking","obesity"),
                     data = dat1)
summary(t1)

print(t1)
print(t1, nonnormal = c("CA19.9","CRP","CEA"))
