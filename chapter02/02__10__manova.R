library(MASS) 
f = matrix(c(2,1,1,1,2,1,1,1,2),3,3) 


x1 = mvrnorm(50,c(10,10,10),f) 
x1 = cbind(x1,1) 
x2 = mvrnorm(50,c(10,10,10),f) 
x2 = cbind(x2,2) 
x3 = mvrnorm(50,c(30,10,10),f) 
x3 = cbind(x3,3) 


total_data = data.frame(rbind(x1,x2,x3)) 
colnames(total_data) = c("History","Math","Biology","class") 



result = manova(cbind(History,Math,Biology) ~ class,data=total_data) 
summary(result) 


summary.aov(result) 
SS = summary(result)$SS 
print(SS) 


library(MASS) 
f1 = matrix(c(2,1,1,1,2,1,1,1,2),3,3) 
f2 = matrix(c(3,2,1,2,3,1,1,1,3),3,3) 
f3 = matrix(c(2,1,-0.5,1,2,1,-0.5,1,2),3,3) 

x1 = mvrnorm(50,c(10,10,10),f1) 
x1 = cbind(x1,1) 
x2 = mvrnorm(50,c(10,10,10),f2) 
x2 = cbind(x2,2) 
x3 = mvrnorm(50,c(30,10,10),f3) 
x3 = cbind(x3,3) 

total_data = data.frame(rbind(x1,x2,x3)) 
colnames(total_data) = c("History","Math","Biology","class") 

result = manova(cbind(History,Math,Biology) ~ class,data=total_data) 
summary(result) 