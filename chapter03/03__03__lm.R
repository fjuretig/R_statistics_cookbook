data = read.csv("/Users/admin/Documents/R_book/chapter3/sales__shop.csv")
library(caret)
X =data[-1]
findLinearCombos(X)

X =as.matrix(X)
det(t(X) %*% X)

model =lm(data=data,Sales~women_apparel_price+male_apparel_price+shoes_female_price+ 
             shoes_male_price+shoes_kids_prices+shoes_male_price.1+prices_shoes)
summary(model)

det(t(X[,c(-6,-7)]) %*% X[,c(-6,-7)])

fixedmodel=lm(data=data,Sales~women_apparel_price+male_apparel_price+shoes_female_price+ 
                  shoes_male_price+shoes_kids_prices)
summary(fixedmodel)


aggregated_apparel=data$women_apparel_price+data$male_apparel_price
finalmodel=lm(data=data,Sales~ aggregated_apparel+shoes_female_price+shoes_male_price 
                +shoes_kids_prices)
summary(finalmodel)
vif(finalmodel)