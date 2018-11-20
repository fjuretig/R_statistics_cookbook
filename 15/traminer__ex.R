
library(TraMineR)

datax       <- read.csv("./data__model.csv",stringsAsFactors = FALSE)
mvad.labels <- c("CLOSED","L1", "L2", "L3")
mvad.scode  <- c("CLD","L1", "L2", "L3")
mvad.seq    <- seqdef(datax, 3:22, states = mvad.scode,labels = mvad.labels)
group__     <- paste0(datax$Sex,"-",datax$Age)


seqfplot(mvad.seq, with.legend = T, border = NA,group=group__, title = "Sequence frequency plot")
seqdplot(mvad.seq, with.legend = T,group=group__, border = NA, title = "State distribution plot")
seqHtplot(mvad.seq,group=group__, title = "Entropy index")




Turbulence <- seqST(mvad.seq,)
summary(Turbulence)
hist(Turbulence, col = "cyan", main = "Sequence turbulence")


datax$Turbulence = Turbulence
fee = Turbulence
fee[Turbulence>7] = 1
fee[Turbulence<=7] = 0
fee[Turbulence<=3] = 2
seqfplot(mvad.seq, with.legend = T,group=fee, border = NA, title = "Sequence frequency plot")





seqmtplot(mvad.seq)





dist.om1 <- seqdist(mvad.seq, method = "OM", indel = 1, sm = "TRATE")
library(cluster)
clusterward1 <- agnes(dist.om1, diss = TRUE, method = "ward")
plot(clusterward1, which.plot = 2)
cl1.4 <- cutree(clusterward1, k = 4)
cl1.4fac <- factor(cl1.4, labels = paste("Type", 1:4))

seqrplot(mvad.seq, diss = dist.om1, group = cl1.4fac,border = NA)

seqIplot(mvad.seq, group = cl1.4fac, sortv = "from.start")




