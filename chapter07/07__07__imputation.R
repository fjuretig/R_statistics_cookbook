library(imputeTS) 
library(ggplot2) 

biodisel_prod                        = read.csv("./biodiesel.csv") 
biodisel_prod$indice_tiempo          = as.Date(biodisel_prod$indice_tiempo,"%Y-%m-%d") 



biodisel_prod_removed = biodisel_prod 
biodisel_prod_removed[c(30,60,90,100,109,120),2] <- NA 
biodisel_prod_removed = na.kalman(biodisel_prod_removed) 



miss_lines = biodisel_prod_removed[c(30,60,90,100,109,120),1] 
plot(biodisel_prod_removed,type="l",col="red",lwd=6,xlab="Time",ylab="biodiesel_production") 

abline(v = miss_lines[1], untf = FALSE,col="gray") 
abline(v = miss_lines[2], untf = FALSE,col="gray") 
abline(v = miss_lines[3], untf = FALSE,col="gray") 
abline(v = miss_lines[4], untf = FALSE,col="gray") 
abline(v = miss_lines[5], untf = FALSE,col="gray") 
abline(v = miss_lines[6], untf = FALSE,col="gray") 
lines(biodisel_prod,type="l",pch=15) 



biodisel_prod_removed = biodisel_prod 
biodisel_prod_removed[c(30,60,90,100,109,120),2] <- NA 
plotNA.distribution(biodisel_prod_removed$biodisel_produccion) 
plotNA.distributionBar(biodisel_prod_removed$biodisel_produccion) 

statsNA(biodisel_prod_removed$biodisel_produccion) 
