install.packages('flexdashboard')
library('flexdashboard')
library(tidyverse)
library(lubridate)

df <- readRDS('d:/new_R/회사/2020_2030/계좌기본.rds')

names(df) <- c('개설일', '폐쇄일', '휴면일', '계좌번호', '고객', '연령', '성별', '관리점', '관리사원')

df$ID <- 1:nrow(df)
df <- df[-4]
df <- df %>% relocate(ID)

getwd()
saveRDS(df,'d:/new_R/flexdashboard/flex_df.rds')
df <- readRDS('d:/new_R/flexdashboard/flex_df.rds')

##일별계좌개설수

df %>% group_by(개설일) %>% summarise(n= n()) %>% 
  ggplot(aes(x=ymd(개설일),y=n,fill=n))+
  geom_col()
