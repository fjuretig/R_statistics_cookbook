e = lm(y ~ -1+ x1 + x2) 
summary(e) 


rlm_model = rlm(y ~ -1 + x1 + x2) 
summary(rlm_model) 


rlm_model = rlm(y ~ -1 + x1 + x2,psi = psi.bisquare) 
summary(rlm_model) 