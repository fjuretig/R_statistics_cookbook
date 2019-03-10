library(forecast) 

average_temp                  = read.csv("https://apis.datos.gob.ar/series/api/series/?metadata=full&ids=367.3_TEMPERATURDIO__20&limit=1000&format=csv") 
average_temp$indice_tiempo    = as.Date(average_temp$indice_tiempo,"%Y-%m-%d") 
average_temp                  = ts(average_temp$temperatura_promedio,start=c(2001,1),frequency = 12)

best_mode                     = auto.arima(average_temp,max.p=5,max.q=5,max.Q=2,max.P=2,allowmean = TRUE,allowdrift = FALSE)


plot.ts(average_temp) 
lines(best_mode$fitted,col="red") 
