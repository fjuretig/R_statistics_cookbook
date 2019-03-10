library(anomalize) 

library(dplyr) 

library(tibbletime) 



currency_sales                       = read.csv("https://apis.datos.gob.ar/series/api/series/?metadata=full&ids=349.2_PROMEDIO_DIO__16 & limit=1000&format=csv") 
currency_sales$indice_tiempo         = as.Date(currency_sales$indice_tiempo,"%Y-%m-%d") 



results_anomalies                    = tibbletime::as_tbl_time(currency_sales,indice_tiempo) %>%time_decompose  
(promedio_diario,merge = TRUE) %>% anomalize(remainder) %>% time_recompose() 

results_anomalies %>% plot_anomaly_decomposition(ncol=3,alpha_dots = 0.3) 



results_anomalies                    = tibbletime::as_tbl_time(currency_sales,indice_tiempo) %>%time_decompose(promedio_diario, merge = TRUE) %>% anomalize(remainder,alpha=0.10,max_anoms=0.02) %>% time_recompose() 
results_anomalies %>% plot_anomaly_decomposition(ncol=3,alpha_dots = 0.3) 




results_anomalies                    = tibbletime::as_tbl_time(currency_sales,indice_tiempo) %>% time_decompose(promedio_diario, merge = TRUE,method="twitter") %>% anomalize(remainder,alpha=0.10,max_anoms=0.02) %>% time_recompose() 
results_anomalies %>% plot_anomaly_decomposition(ncol=3,alpha_dots = 0.3) 