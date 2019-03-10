xtabs(~ Group + Person, data) 

data       = read.csv("C:\\R_book\\company_areas.csv") 

lmer(Rating ~ -1 + (1 | Group/Person)        , data = data) 

lmer(Rating ~ -1 + (1 | Group) + (1 | Person), data = data) 

xtabs(~ Group + Person, data2) 



data2       = read.csv("C:\\R_book\\company_areas2.csv") 

lmer(Rating ~ -1 + (1 | Group/Person)        , data = data2) 

lmer(Rating ~ -1 + (1 | Group) + (1 | Person), data = data2) 