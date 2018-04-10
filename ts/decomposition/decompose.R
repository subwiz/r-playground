# Example from: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
plot.ts(birthstimeseries)
birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)
?scan
