#나이와 수축기혈압의 산점도와 상관계수

getwd()
setwd("C:/Users/82105/biostatistic")
dat0 <- read.csv("biostat_ex_data.csv")
library(dplyr)
dat3 <- dat0 %>% mutate_at(vars(sex,Recur,stage,smoking,obesity,Recur_1y,
                                post.CA19.9.binary, post.CA19.9.3grp),
                           as.factor) %>%
  mutate(HTN=as.factor(ifelse(SBP>=140, 1, 0)),
         CEA.grp=as.factor(ifelse(CEA>5, 1, 0)),
         post.CEA.grp=as.factor(ifelse(post.CEA>5, 1, 0)))

library(ggplot2)
ggplot(dat3) + geom_point(aes(age,SBP))
cor(dat3$age, dat3$SBP)
cor(dat3$age, dat3$SBP, method = "spearman")

#단순선형 회귀분석

dat4 <- dat3 %>% mutate(log.CEA=log(CEA),
                        log.post.CEA=log(post.CEA))
dat4_lm <- lm(log.post.CEA~log.CEA, data = dat4)
summary(dat4_lm)

# (Intercept) -0.64788 => 베타0
# log.CEA      1.23684 => 베타1

적합된 회귀식 : log.post.CEA = -0.65 + 1.24*log.CEA 

ggplot(dat4, aes(log.CEA, log.post.CEA)) + geom_point() +
  geom_smooth(method = "lm")

log(CEA) = 1,2,3인 3명의 환자들에 대해서 회귀직선이 예측하는 log(post.CEA)값 구하기
cea_coef <- data.frame(log.CEA=c(1,2,3))
predict(dat4_lm, newdata = cea_coef)
