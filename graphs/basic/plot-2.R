# Example to plot two value line graph

x <- read.csv("https://raw.githubusercontent.com/subwiz/r-playground/master/graphs/basic/plot-2.csv", header=TRUE)
x$dt <- as.Date(x$year)
plot(x$dt, x$val2, xlab="Years", ylab="Value", col="blue", type='l')
lines(x$dt, x$val1, col="red")
legend("topleft", c("Blue Data", "Red Data"),
       fill=c("blue", "red"))
