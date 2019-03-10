library(vars) 

natural_gas_prod               = read.csv("https://apis.datos.gob.ar/series/api/series/metadata=full&ids=364.3_INDUSTRIARIA__9&limit=1000&format=csv") 
natural_gas_prod$indice_tiempo = as.Date(natural_gas_prod$indice_tiempo,format="%Y-%m-%d") 

super_oil                      = read.csv("https://apis.datos.gob.ar/series/api/series/metadata=full&ids=363.3_PRODUCCIONRON_2__37&limit=1000&format=csv") 
super_oil$indice_tiempo        = as.Date(super_oil$indice_tiempo,format="%Y-%m-%d") 

finished_wells                 = read.csv("https://apis.datos.gob.ar/series/api/series/metadata=full&ids=366.3_POZOS_TERMION__28&limit=1000&format=csv") 
finished_wells$indice_tiempo   = as.Date(finished_wells$indice_tiempo,format="%Y-%m-%d") 

asfalto                        =read.csv("https://apis.datos.gob.ar/series/api/series/metadata=full&ids=363.3_DESPACHOS_LTO__20&limit=1000&format=csv") 
asfalto$indice_tiempo          = as.Date(asfalto$indice_tiempo,format="%Y-%m-%d")  

joined_data                    = merge(merge(natural_gas_prod,super_oil,by="indice_tiempo"),asfalto,by="indice_tiempo")[-1] 
joined_data                    = ts(joined_data,start=c(1996,1),frequency=12) 

m = VAR(joined_data,p=12) 
restrict(m, method = "ser") 
roots(m)
vars::normality.test(m)


predict(m,24)