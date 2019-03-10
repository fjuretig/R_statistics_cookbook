library(sjPlot)
clients <- read.csv("/Users/admin/Documents/R_book/chapter2/07/clients.csv")
model1 <-lm(Sales ~ Strategy + (Client) + (Salesman),data=clients)
tab_model(model1)


model2 <-lmer(Sales ~ Strategy + (1|Client) + (1|Salesman),data=clients)
tab_model(model2)

tab_df(clients,title="Clients dataset",alternate.rows= TRUE)