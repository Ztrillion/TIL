getwd()
setwd("C:/Users/82105/biostatistic/")
getwd()

dat0 <- read.csv("biostat_ex_data.csv")
library(dplyr)

dat1 <- dat0 %>% mutate_at(vars(sex,Recur,stage,smoking,
                                obesity,Recur_1y,
                                post.CA19.9.binary,post.CA19.9.3grp),
                           as.factor)

library(ggplot2)
ggplot(dat1) + geom_histogram(aes(x=log(CEA)), color="black", fill="skyblue")

# 아노바 F 검정
fit <- aov(log(CEA)~stage, data=dat1)
summary(fit)

#웰치의  F 검정
oneway.test(log(CEA)~stage, data=dat1)

#크루스칼 왈리스 검정
kruskal.test(CEA~stage, data=dat1)

#양측검정
t.test(dat1$weight, mu=65)

# 수술 전, 후의 CEA값 차이 
ggplot(dat1) + geom_histogram(aes(x=log(post.CEA) - log(CEA)), color = "black",
                              fill = "skyblue")
# 0을 기준으로 좌우 대칭으로 보인다

t.test(log(dat1$post.CEA),log(dat1$CEA), paired=TRUE)
