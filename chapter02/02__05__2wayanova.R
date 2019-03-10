library(dplyr) 
r = read.csv("./2wayanova.csv") 

d = aov(Sales ~ Colour + Font + Font*Colour,data=r ) 
plot(d, 2) 
shapiro.test(residuals(d)) 


r = r[-c(22,44),] 
d = aov(Sales ~ Colour + Font + Font*Colour,data=r ) 
plot(d, 2) 
shapiro.test(residuals(d)) 


plot(d, 1) 
anova(d) 
rbind(TukeyHSD(d)$Colour,TukeyHSD(d)$Font) 
