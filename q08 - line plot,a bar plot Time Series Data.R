# Load the necessary libraries
library(ggplot2)
library(zoo)
library(forecast)

# Load the data
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-02-01", "2023-03-01", "2023-04-01", "2023-05-01")),
  Sales = c(100, 120, 150, 130, 140)
)

# Task 1: Create a line plot of Sales over time
ggplot(data, aes(x = Date, y = Sales)) + 
  geom_line() + 
  labs(title = "Sales Over Time", x = "Date", y = "Sales")

# Task 2: Generate a bar plot showing monthly average Sales
data$Month <- format(data$Date, "%m")
monthly_avg <- aggregate(Sales ~ Month, data, mean)
ggplot(monthly_avg, aes(x = Month, y = Sales)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Monthly Average Sales", x = "Month", y = "Average Sales")

# Seasonal decomposition of Sales
sales_ts <- ts(data_timeseries$Sales, start=c(2023, 1), frequency=12)
decomposed <- decompose(sales_ts)
plot(decomposed)


# Task 4: Create a lag plot to analyze autocorrelation in Sales
ggplot(data, aes(x = Sales, y = lag(Sales))) + 
  geom_point() + 
  labs(title = "Lag Plot of Sales", x = "Sales (t)", y = "Sales (t-1)")

# Task 5: Generate a time series plot with a smoothed line of Sales
ggplot(data, aes(x = Date, y = Sales)) + 
  geom_line() + 
  geom_line(aes(y = fitted(loess(Sales ~ Date))), color = "red") + 
  labs(title = "Time Series Plot with Smoothed Line", x = "Date", y = "Sales")
