data = read.csv("/Users/admin/Documents/R_book/chapter3/house_prices.csv")
model =lm(Property_price~ size +number.bathrooms+number.bedrooms+number.entrances+size_balcony
           +size_entrance,data=data)


library(sandwich)
summary(model)


coeftest(model,vcov=sandwich)