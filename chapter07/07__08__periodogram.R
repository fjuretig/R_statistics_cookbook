library(imputeTS) 

library(timesboot) 

butane                        =read.csv("https://apis.datos.gob.ar/series/api/series/metadata=full&ids=Acero_produccion _8wf4nP&limit=1000&format=csv") 
butane                        = ts(butane$valor,start=c(1993,1),frequency = 12) 
plot.ts(butane)  
spectrum(butane, spans = c(5, 7),lty = 1) 





butane_trend = decompose(butane) 
corrected    = butane-butane_trend$trend 
corrected    = imputeTS::na.kalman(corrected) 
plot.ts(corrected)  




td = timesboot::boot_spec(corrected,de_trend = FALSE) 