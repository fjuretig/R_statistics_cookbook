library(Hotelling) 
data1 = read.csv("./class1.csv") 
data2 = read.csv("./class2.csv") 

sapply(data1,mean) 
sapply(data2,mean) 


test_hotelling = hotelling.test(data1,data2) 
print(test_hotelling) 


library(heplots) 

data1$group = "1" 
data2$group = "2" 
combined = rbind(data1,data2) 
combined$group = as.factor(combined$group) 

boxM(cbind(combined$Math,combined$History,combined$Sociology)~group,data = combined) 