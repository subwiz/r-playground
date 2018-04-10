# From: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html
# Data: annual diameter of women???s skirts at the hem, from 1866 to 1911

# Plot data:

skirts <- scan("https://raw.githubusercontent.com/subwiz/r-playground/master/ts/forecast-exponential-smoothing-HoltWinters/skirts.dat",skip=5)
skirtsseries <- ts(skirts, start=c(1866), frequency=1)
plot.ts(skirtsseries)

# Forecast for input period:

skirtsseriesforecasts <- HoltWinters(skirtsseries, gamma=FALSE)
plot(skirtsseriesforecasts)

# Forecast for 19 time units beyond:

library("forecast")
hw <- stats::HoltWinters(skirtsseries, gamma=FALSE)
skirtsseriesforecasts2 <- forecast(hw, h=19)
plot(skirtsseriesforecasts2)
