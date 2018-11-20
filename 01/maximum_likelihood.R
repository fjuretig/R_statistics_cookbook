library(stats4)
N <- 1000
x <- rgamma(N, shape=20,rate=2)


LL <- function(shape, rate) {
R = suppressWarnings(dgamma(x, shape=shape, rate=rate))
        return(-sum(log(R)))
}

P = mle(LL, start = list(shape = 1, rate=1))

summary(P)



N <- 10
x <- rgamma(N, shape=20,rate=2)
P = mle(LL, start = list(shape = 1, rate=1))
summary(P)