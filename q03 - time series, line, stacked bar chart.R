# Create the data frame
df <- data.frame(
  Date = as.Date(c("01/01/2024", "02/01/2024", "03/01/2024", "04/01/2024", "05/01/2024", "06/01/2024"), format = "%m/%d/%Y"),
  Station_A_Temperature = c(25.0, 24.5, 26.2, 23.8, 25.5, 23.0),
  Station_A_Precipitation = c(0.1, 0.0, 0.3, 0.2, 0.1, 0.4),
  Station_B_Temperature = c(23.5, 22.8, 25.0, 22.5, 24.5, 21.8),
  Station_B_Precipitation = c(0.2, 0.3, 0.1, 0.0, 0.4, 0.2)
)
# 1 time series
library(ggplot2)

# Melt the data frame to long format
library(reshape2)
df_long <- melt(df, id.vars = "Date")

# Create the time series plot
ggplot(df_long, aes(x = Date, y = value, color = variable)) +
  geom_line() +
  labs(x = "Date", y = "Value", title = "Temperature and Precipitation Time Series") +
  theme_minimal()


# 2 line plot
library(ggplot2)
library(tidyr)

# Reshape the data to long format
df_long <- df %>%
  pivot_longer(cols = -Date, names_to = c("Station", "Measure"), names_sep = "_", values_to = "Value")

# Create the line plot
ggplot(df_long, aes(x = Date, y = Value, color = Station, linetype = Measure)) +
  geom_line(size = 1) +
  labs(x = 'Date', y = 'Value', title = 'Temperature and Precipitation Over Time') +
  theme_minimal() +
  theme(legend.position = "bottom")



# 3  stacked bar
# Reshape the data to long format
df_long <- df %>%
  pivot_longer(cols = -Date, names_to = c("Station", "Measure"), names_sep = "_", values_to = "Value")

# Create the stacked bar plot
ggplot(df_long, aes(x = Date, y = Value, fill = interaction(Station, Measure))) +
  geom_bar(position = "stack", stat = "identity") +
  labs(x = 'Date', y = 'Value', title = 'Stacked Bar Plot: Temperature and Precipitation Over Time') +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_fill_discrete(name = "Station and Measure")
