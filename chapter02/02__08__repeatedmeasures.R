library(ggplot2) 
library(nlme) 
data_company = read.csv("./repeated_measures.csv") 

ggplot(data_company,aes(x=Time,y=Performance)) + geom_line() +  
  geom_point(data=data_company,aes(x=Time,y=Performance)) + 
  facet_wrap(~Employee,nrow=3) 


fit <- lme(Performance ~ Bonus + Sector + Time + Time:Bonus , random = list( ~1 |Employee) , correlation = corAR1(form= ~Time|Employee), data = data_company) 
summary(fit) 


anova(fit) 


fit <- lme(Performance ~ Bonus + Sector + Time + Time:Bonus , random = list( ~1 |Employee) , data = data_company) 
summary(fit) 
anova(fit) 


anova(fit) 

library(lsmeans) 
fit <- lme(Performance ~ Bonus + Sector + Time , random = list( ~1 |Employee) , data = data_company) 
print(lsmeans(fit,pairwise ~ Bonus)) 

fit <- lme(Performance ~ Bonus + Sector + Time + Time:Bonus , random = list( ~1 + Time |Employee) , correlation = corAR1(form= ~Time|Employee), data = data_company) 