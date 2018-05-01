x <- c(5, 10, 12, 45, 23, 32, 19, 56, 92, 41)

range(x)

var(x) # variance
sd(x) # standard deviation
mad(x) # median absolute deviation

quantile(x, probs = c(.99)) # 99th percentile
IQR(x) # interquartile range: diff between 75th and 25th percentiles
