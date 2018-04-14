x <- c("1917", "1918", "1919", "1920")
y <- rnorm(4)
z <- data.frame(x, y)
z$DtStr <- paste(x, "-01-01", sep="") # Default sep char is " ". So specify null string.
z$DtStr
z$Dt <- as.Date(z$DtStr)
