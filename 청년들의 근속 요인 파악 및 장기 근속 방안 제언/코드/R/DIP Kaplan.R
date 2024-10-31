#DIP
#.libPaths()
#.libPaths("C:/Program Files/R/R-4.2.2/library")



#install.packages("survival")
#install.packages("survminer")
#install.packages("ggsurvplot")
library(KMsurv)
library(survminer)
#library(tableone)
library(survival)
library(ggplot2)
library(ggpubr)
library(survminer)
library(dplyr)


#ixtdata<- read.csv("2023_04_06_data_step.csv", header= T, sep=',', fileEncoding = "euc-kr")
data <- read.csv("C:/Users/exo12/Downloads/data_d.csv")
ixt<-as.data.frame(data) #데이터 프레임으로 바꾸기
#a <- as.data.frame(ixtdata)

# 종사자수 결측 처리 값 제거
df <- ixt[!(ixt$big_companyG == " " ), ]
# df
# 데이터 불러오기


###################생존분석 KM
survfit_sex <- survfit(Surv(FirstWorkPeriod, Resign)~sex, data=ixt)
survfit_major <- survfit(Surv(FirstWorkPeriod, Resign)~majorcatG, data=ixt)
survfit_big_companyG <- survfit(Surv(FirstWorkPeriod, Resign)~big_companyG, data=df)
survfit_overall <- survfit(Surv(FirstWorkPeriod, Resign)~1, data=ixt)

summary(survfit_sex)
summary(survfit_major)
summary(survfit_major_sameG)




ggsurvplot(survfit_sex,pval=TRUE,
           conf.int = TRUE,
           int=FALSE, 
           risk.table = TRUE,
           surv.median.line = "hv",
           ylab="근속비율",
           xlab="근속기간(Month)",
           lineend="round",
           size=2,
           alpha=0.05,
           legend.title="Sex",
           legend.labs=c("남자","여자"),
           palette = c("#7777DD","#CC6666"), xlim = c(0,36),
           break.time.by = 6)
ggsurvplot(survfit_major,pval=TRUE, conf.int = TRUE, int=FALSE, risk.table = TRUE, surv.median.line = "hv",
           ylab="Recurrence", xlab="Time to Recurrence (Month)",lineend="round",size=2,alpha=0.05,
           legend.title="Dominant",legend.labs=c("문과","예체능","이공계"), palette = c("seagreen3","steelblue2","lightpink"), xlim = c(0,36),
           break.time.by = 6)
ggsurvplot(survfit_big_companyG, data=ixt,pval=TRUE, conf.int = TRUE, risk.table = TRUE, surv.median.line = "hv",
           ylab="Recurrence", xlab="Time to Recurrence (Month)",lineend="round",size=2,alpha=0.025,
           legend.title="coworker_count",legend.labs=c("1000명미만","1000명이상"), xlim = c(0,36),
           break.time.by = 6, risk.table.y.text = FALSE)



# Re plot



overall <- ggsurvplot(
  survfit_overall,                     # survfit object with calculated statistics.
  risk.table = TRUE,       # show risk table.
  pval = TRUE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimates of survival curv
  xlim = c(0,36),         # present narrower X axis, but not affect
  # survival estimates.
  xlab = "근속기간(Month)",
  ylab = '근속비율', # customize X axis label.
  lineend="round",
  size = 0.7,
  break.time.by = 6,
  palette = "steelblue2",
  legend.title="Overall",
  legend.labs="ALL",
  surv.median.line = "hv",
)
overall

gender <- ggsurvplot(
  survfit_sex,                     # survfit object with calculated statistics.
  risk.table = TRUE,       # show risk table.
  pval = TRUE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimates of survival curves.
  xlim = c(0,36),         # present narrower X axis, but not affect
  # survival estimates.
  xlab = "근속기간(Month)",
  ylab = '근속비율', # customize X axis label.
  lineend="round",
  size = 0.7,
  break.time.by = 6,
  palette = c("steelblue2","#CC6666"),
  theme = theme_survminer(base_size = 17, # 기본 글꼴 크기 설정
                          title = element_text(size = 30), # 타이틀 크기 설정
                          legend_title = element_text(size = 25), # 범례 타이틀 크기 설정
                          legend_text = element_text(size = 20), # 범례 텍스트 크기 설정
                          axis_title = element_text(size = 25), # 축 타이틀 크기 설정
                          axis_text = element_text(size = 20)) # 축 레이블 크기 설정
  ,
  legend.title="성별",
  legend.labs=c("남자","여자"),
  surv.median.line = "hv",
)
gender
ggsave("성별.png", dpi=300, dev='png', height=4.5, width=6.5, units="in",path = "C:/Users/exo12/OneDrive/바탕 화면/대구 빅데이터/Kaplan")


major <- ggsurvplot(
  survfit_major,                     # survfit object with calculated statistics.
  risk.table = TRUE,       # show risk table.
  pval = TRUE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimates of survival curves.
  xlim = c(0,36),         # present narrower X axis, but not affect
  # survival estimates.
  xlab = "근속기간(Month)",
  ylab = '근속비율', # customize X axis label.
  lineend="round",
  size = 0.7,
  break.time.by = 6,
  palette = c("steelblue2","#CC6666","burlywood2"),
  legend.title="본전공",
  legend.labs=c("인문사회어문계열","예체능계열","이공계열"),
  surv.median.line = "hv",
)
major

big_companyG <- ggsurvplot(
  survfit_big_companyG,                     # survfit object with calculated statistics.
  risk.table = TRUE,       # show risk table.
  pval = TRUE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimates of survival curves.
  xlim = c(0,36),         # present narrower X axis, but not affect
  # survival estimates.
  xlab = "근속기간(Month)",
  ylab = '근속비율', # customize X axis label.
  lineend="round",
  size = 0.7,
  break.time.by = 6,
  palette = c("#CC6666", "steelblue2"),
  legend.title="종사자 수",
  legend.labs=c("1000명미만","1000명이상"),
  surv.median.line = "hv",
)

big_companyG

