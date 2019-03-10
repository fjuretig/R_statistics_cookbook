library(SemiPar) 

x1       = rnorm(100,20,6) 

x2       = runif(100,1,8) 

y        = x1 + x2 + rnorm(100,0,5)  

data_sim = data.frame(x1=x1,x2=x2,y=y) 



fit <- spm(data_sim$y ~ f(data_sim$x1)+f(data_sim$x2)) 

summary(fit) 

par(mfrow=c(1,2)) 

plot(fit) 



x1       = rnorm(100,20,6) 

x2       = runif(100,1,8) 

y        = x1 + 150*exp(-x2) + rnorm(100,0,5)  

data_sim = data.frame(x1=x1,x2=x2,y=y) 

fit <- spm(data_sim$y ~ f(data_sim$x1)+f(data_sim$x2)) 

summary(fit) 



par(mfrow=c(2,2)) 

plot(fit) 

fit <- spm(data_sim$y ~ data_sim$x1 + f(data_sim$x2)) 

summary(fit) 