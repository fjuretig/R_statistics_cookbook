library(multcomp)
data =read.csv("/Users/admin/Documents/R_book/chapter3/house_prices.csv")
model =lm(Property_price~ size +number.bathrooms+number.bedrooms+number.entrances+
             size_balcony +size_entrance,data=data)


summary(glht(model,linfct= c("number.bathrooms+number.entrances-number.bedrooms= 0")))

summary(glht(model,linfct= c("size_balcony- size = 0")))