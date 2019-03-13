library("tscount") 
library(dummy) 
library(dplyr) 

data               = read.table("./E1.txt",sep="\t",head=T) 
data$home_away     = ifelse(data$ha == "H", 1, 0) 
data$date          = as.Date(data$date,format="%m/%d/%Y") 
data               = data %>% mutate(diff_days = as.numeric(date-lag(date))) 
data[is.na(data)]  = 0  
model <- tsglm(data$Goals, model = list(past_obs = c(1:3)), link = "log", distr = "poisson",xreg = cbind(data$home_away,data$pos,data$diff_days,data$champions_next_days_after,data$champions_next_days_before)) 
summary(model)


J = matrix(c(1,7,10,1,1),c(1,5)) 
predict(model, n.ahead = 1,  level   = 0.9, global  = TRUE,B       = 2000, newxreg = J)$pred 

J = matrix(c(0,7,10,1,1),c(1,5)) 
predict(model, n.ahead = 1,  level   = 0.9, global  = TRUE, B       = 2000, newxreg = J)$pred 

J = matrix(c(0,7,10,0,0),c(1,5)) 
predict(model, n.ahead = 1,  level   = 0.9, global  = TRUE,  B       = 2000,   newxreg = J)$pred 


library(ggplot2) 

frame = data.frame(true_vals = model$response, fit =  round(model$fitted.values)) 
ggplot(frame,aes(1:38)) + geom_line(aes(y = true_vals, colour = "Observed goals")) + geom_line(aes(y = fit, colour = "predicted goals")) 
