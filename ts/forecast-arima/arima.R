# From the tutorial available at:
# https://www.datascience.com/blog/introduction-to-forecasting-with-arima-in-r-learn-data-science-tutorials

library('ggplot2')
library('forecast')
library('tseries')

# Input CSV data format:
# instant,dteday,season,yr,mnth,holiday,weekday,workingday,weathersit,temp,atemp,hum,windspeed,casual,registered,cnt

# Step 1: Load data

daily_data = read.csv('https://raw.githubusercontent.com/subwiz/r-playground/master/ts/forecast-arima/day.csv', header=TRUE, stringsAsFactors=FALSE)
daily_data$Date = as.Date(daily_data$dteday)
ggplot(daily_data, aes(Date, cnt)) + geom_line() + scale_x_date('month')  + ylab("Daily Bike Checkouts") + xlab("")

# Step 2: Remove outliers using tsclean

count_ts = ts(daily_data[, c('cnt')])
daily_data$clean_cnt = tsclean(count_ts)
ggplot() + geom_line(data = daily_data, aes(x = Date, y = clean_cnt)) + ylab('Cleaned Bicycle Count')

# Step 3: Removing noisy fluctuations using moving avg

daily_data$cnt_ma = ma(daily_data$clean_cnt, order=7)
daily_data$cnt_ma30 = ma(daily_data$clean_cnt, order=30)
ggplot() +
  geom_line(data = daily_data, aes(x = Date, y = clean_cnt, colour = "Counts")) +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma,   colour = "Weekly Moving Average"))  +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('Bicycle Count')

# Step 4: Decompose

# 1. Seasonal
# 2. Trend
# 3. Cyclic
# 4. Error

count_ma = ts(na.omit(daily_data$cnt_ma), frequency=30)
decomp = stl(count_ma, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)
plot(decomp)

# Step 5: Stationarity

# We use Augmented Dickey-Fuller (ADF) to test for stationarity
adf.test(count_ma, alternative = "stationary")

Acf(count_ma, main='')
Pacf(count_ma, main='')

count_d1 = diff(deseasonal_cnt, differences = 1)
plot(count_d1)
adf.test(count_d1, alternative = "stationary")

Acf(count_d1, main='ACF for Differenced Series')
Pacf(count_d1, main='PACF for Differenced Series')

# Step 6: Fitting ARIMA model

# (p, d, q)
auto.arima(deseasonal_cnt, seasonal=FALSE)
fit <- auto.arima(deseasonal_cnt, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=45, main='(1,1,1) Model Residuals')

fit2 <- arima(deseasonal_cnt, order=c(1,1,7))
tsdisplay(residuals(fit2), lag.max=15, main='Seasonal Model Residuals')
arima(x = deseasonal_cnt, order = c(1, 1, 7))

# Forecast:
fcast <- forecast(fit2, h=30)
plot(fcast)

# Forecast with holdout, to verify the actual with prediction:
hold <- window(ts(deseasonal_cnt), start=700)
fit_no_holdout <- arima(ts(deseasonal_cnt[-c(700:725)]), order=c(1,1,7))
fcast_no_holdout <- forecast(fit_no_holdout,h=25)
plot(fcast_no_holdout, main=" ")
lines(ts(deseasonal_cnt))

# Forecast with seasonality:
fit_w_seasonality <- auto.arima(deseasonal_cnt, seasonal=TRUE)
seas_fcast <- forecast(fit_w_seasonality, h=30)
plot(seas_fcast)
