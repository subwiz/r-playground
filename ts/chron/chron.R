library("chron")

x <- read.csv("https://raw.githubusercontent.com/subwiz/r-playground/master/ts/chron/data.csv", header=TRUE)
x$tm <- as.character(x$time)
dtparts <- t(as.data.frame(strsplit(x$tm,"T")))
x$chron <- chron(dates=dtparts[,1],times=dtparts[,2],format=c('y-m-d','h:m:s'))
plot(x$chron, x$val, xlab="Time", ylab="Value", col="black", type='l')
