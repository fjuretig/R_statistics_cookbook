library(robust) 

r = read.csv("/Users/admin/Documents/R_book/chapter2/05/2wayanova.csv") 


d = aov(Sales ~ Colour + Font + Font*Colour,data=r ) 

plot(d, 2) 

summary(d) 



robanova = robust::lmRob(Sales ~ Colour + Font + Font*Colour,data=r ) 
robust::anova.lmRob(robanova) 