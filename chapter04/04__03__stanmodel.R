data   = read.csv("/Users/admin/Documents/R_book/chapter3/house_prices.csv") 

model =" 

data { 

real y[125]; 

real x[125,6]; 

} 

parameters { 

real beta[6]; 

real sigma; 

real alpha; 

} 

model { 

beta[1]  ~ uniform(0,1000); 

for (n in 1:125) 

y[n] ~ normal(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3] + beta[4]*x[n,4] + beta[5]*x[n,5] +   

beta[6]*x[n,6], sigma); 

} 

" 

xy     = list(y=data[,1],x=data[,2:7]) 

fit    = stan(model_code = model, data = xy, warmup = 500, iter = 1000, chains = 1, cores = 1, thin =   
                
                1,verbose=FALSE) 

stan_dens(fit) 
beta[6]  ~ normal(1,0.7); 
beta[6]  ~ normal(1,0.2); 