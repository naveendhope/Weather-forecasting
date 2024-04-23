# Load necessary libraries
library(forecast)
library(tseries)

# Read the data
data <- read.csv("C:/Users/navee/OneDrive/Desktop/Business Analytics/Machine Learning/Weather/archive (5)/DailyDelhiClimateTrain.csv")  # Update the path accordingly

# Convert date column to Date type and set it as a time series
data$date <- as.Date(data$date)
ts_data <- ts(data$meantemp, frequency = 365, start = c(2013, 1))  # Adjust frequency for your specific dataset

# Check the structure of the time series
plot(ts_data)

# Decompose the time series to identify seasonality and trend
decomposed <- stl(ts_data, s.window = "periodic")
plot(decomposed)

# Fit the ARIMA model
model <- auto.arima(ts_data, seasonal = TRUE)

# Check model summary
summary(model)

# Forecast future temperatures
future_forecast <- forecast(model, h = 365)  # Forecasting the next year
plot(future_forecast)

# Optional: View the forecast values
print(future_forecast)

