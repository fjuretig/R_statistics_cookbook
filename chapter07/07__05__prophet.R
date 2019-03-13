library(Rcpp)

currency_sales                       =read.csv("./sold_usd_oilseeds.csv") 
currency_sales$indice_tiempo         = as.Date(currency_sales$indice_tiempo,"%Y-%m-%d") 
colnames(currency_sales)             = c("ds","y") 


model    <- prophet::prophet(currency_sales,changepoints=c("2003-10-01","2007-10-01","2011-10-01","2015-10-01")) 
future   <- prophet::make_future_dataframe(model,periods=36,freq="month",include_history = TRUE) 
preds    <- predict(model,future) 
plot(model,preds) 





beer_prices                       = read.csv("./beerprices.csv") 
beer_prices$indice_tiempo         = as.Date(beer_prices$indice_tiempo,"%Y-%m-%d") 
colnames(beer_prices)          = c("ds","y") 
beer_prices1                      = beer_prices[1:106,] 
plot(ts(beer_prices$y,frequency=12,start=c(1993,1)))


model    <- prophet::prophet(beer_prices1) 
future   <- prophet::make_future_dataframe(model,periods=48,freq="month",include_history = TRUE) 
preds    <- predict(model,future) 
plot(model,preds) 