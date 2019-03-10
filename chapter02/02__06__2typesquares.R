library(dplyr) 
r = read.csv("./2wayanova.csv") 
r = r[-c(22,44),] 

d = aov(Sales ~ Colour + Font + Font*Colour,data=r ) 
summary(d) 


options(contrasts = c("contr.sum","contr.poly")) 
f = Anova(aov(Sales ~ Colour + Font + Font*Colour,data=r ),type=c("III")) 
f 