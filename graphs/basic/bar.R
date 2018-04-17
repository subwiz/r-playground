
x <- c(1, 2, 3, 4, 5,  1, 4, 9, 16, 25)

mx <- matrix(x, nrow=2, ncol=5, byrow=T)
colnames(mx) <- c(1960, 1961, 1962, 1963, 1964)
barplot(mx, beside=T)
