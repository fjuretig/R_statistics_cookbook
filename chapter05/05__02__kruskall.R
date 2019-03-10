library(rcompanion) 

library(FSA) 

library(dplyr) 


t     = read.csv("/Users/admin/Documents/R_book/chapter2/04/anova_example.csv") 

kruskal.test(Result ~ Food.Type,data=t) 

dunnTest(Result ~ Food.Type,data=t) 