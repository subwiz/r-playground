# From: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
# Data: annual diameter of women???s skirts at the hem, from 1866 to 1911

# Plot data:

skirts <- scan("https://raw.githubusercontent.com/subwiz/r-playground/master/ts/forecast-exponential-smoothing-HoltWinters/skirts.dat",skip=5)
skirtsseries <- ts(skirts,start=c(1866))
plot.ts(skirtsseries)

# Forecast for input period:

skirtsseriesforecasts <- HoltWinters(skirtsseries, gamma=FALSE)
plot(skirtsseriesforecasts)

# Forecast for input period:

library("forecast")
skirtsseriesforecasts2 <- forecast:::forecast.HoltWinters(skirtsseriesforecasts, h=19)
plot(skirtsseriesforecasts2)
