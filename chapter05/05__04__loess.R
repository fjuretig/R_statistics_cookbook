data = read.csv("/Users/admin/Documents/R_book/chapter4/price__sales.csv") 

model_loess1 = loess(data$Sales~data$Price,  span = 2/3, degree = 2, family = c("gaussian")) 

model_loess2 = loess(data$Sales~data$Price,  span = 0.1, degree = 2, family = c("gaussian")) 


loess1_wrapper <- function(x){ 
  
  return (predict(model_loess1,x)) 
  
}  

loess2_wrapper <- function(x){ 
  
  return (predict(model_loess2,x)) 
  
} 


plot(data$Price,data$Sales) 

curve(loess1_wrapper,add=TRUE,col="red",lwd=3) 

curve(loess2_wrapper,add=TRUE,col="blue",lwd=3) 

legend(70, 4500, legend=c("span=0.75", "span=0.1"),col=c("red", "blue"), lty=1:1, cex=0.8) 



loess1_wrapper(0.5)-loess1_wrapper(20) 

loess1_wrapper(20)-loess1_wrapper(40) 

ggplot(data, aes(x=Price, y=Sales)) + geom_point(size=2, shape=1) + geom_smooth(se = TRUE, method = "loess") 