# Example from: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html

births <- scan("https://raw.githubusercontent.com/subwiz/r-playground/master/ts/decomposition/nybirths.dat")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
plot.ts(birthstimeseries)
birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)
