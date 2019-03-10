library("olsrr")
library(dplyr)
data = read.csv("/Users/admin/Documents/R_book/chapter3/movies.csv")
model =lm(Audience ~ -show_budget+ actors + Action +script_year+extra_actors+
             director_number_movies_involved,data= data)



head(ols_step_all_possible(model) %>% arrange(desc(adjr)))

ols_step_forward_p(model)


ols_step_backward_p(model)

ols_step_both_p(model)

ols_step_forward_aic(model)

ols_step_backward_aic(model)


ols_step_both_aic(model)