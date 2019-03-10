data = read.csv("/Users/admin/Documents/R_book/chapter3/house_prices.csv")
model =lm(Property_price~ size +number.bathrooms+number.bedrooms+number.entrances+size_balcony
           +size_entrance,data=data)


plot(model)

library(lmtest)
bptest(model)