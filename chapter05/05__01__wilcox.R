data             = read.csv("/Users/admin/Documents/R_book/chapter2/01/heights.csv") 
data$Sample = as.factor(data$Sample) 


wilcox.test(Height ~ Sample,data=data) 

data = read.csv("/Users/admin/Documents/R_book/chapter2/03/paired_scores.csv") 

wilcox.test(data$Score1, data$Score2,paired=TRUE) 