# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample weather data
weather_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# 1. Scatter plot of Temperature vs Humidity with Wind Speed as color
p1 <- ggplot(weather_data, aes(x = Humidity, y = Temperature, color = WindSpeed)) +
  geom_point(size = 3) +
  labs(title = "Temperature vs Humidity with Wind Speed",
       x = "Humidity (%)", y = "Temperature (°C)") +
  scale_color_gradient(name = "Wind Speed (km/h)")
print(p1)

# 2. Scatter plot of Wind Speed vs Humidity with Temperature as color
p2 <- ggplot(weather_data, aes(x = WindSpeed, y = Humidity, color = Temperature)) +
  geom_point(size = 3) +
  labs(title = "Wind Speed vs Humidity with Temperature",
       x = "Wind Speed (km/h)", y = "Humidity (%)") +
  scale_color_gradient(name = "Temperature (°C)")
print(p2)

# 3. Scatter plot of Wind Speed vs Temperature with Humidity as color
p3 <- ggplot(weather_data, aes(x = WindSpeed, y = Temperature, color = Humidity)) +
  geom_point(size = 3) +
  labs(title = "Wind Speed vs Temperature with Humidity",
       x = "Wind Speed (km/h)", y = "Temperature (°C)") +
  scale_color_gradient(name = "Humidity (%)")
print(p3)

# 4. 3D Surface Plot for Temperature with varying Humidity and Wind Speed
# Interpolate data
interp_data <- with(weather_data, interp(x = WindSpeed, y = Humidity, z = Temperature))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'Temperature (°C)')),
         title = "3D Surface Plot: Temperature with Humidity and Wind Speed")

# 5. Compare 3D plots of temperature against humidity and wind speed separately
# 3D Scatter Plot for Temperature vs Humidity
plot_ly(weather_data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, type = 'scatter3d', mode = 'markers', 
        marker = list(size = 5, color = ~Temperature, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Wind Speed (km/h)')),
         title = "3D Scatter plot: Humidity, Temperature, and Wind Speed")

# 3D Scatter Plot for Temperature vs Wind Speed
plot_ly(weather_data, x = ~WindSpeed, y = ~Temperature, z = ~Humidity, type = 'scatter3d', mode = 'markers', 
        marker = list(size = 5, color = ~Temperature, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Wind Speed (km/h)'),
                      yaxis = list(title = 'Temperature (°C)'),
                      zaxis = list(title = 'Humidity (%)')),
         title = "3D Scatter plot: Wind Speed, Temperature, and Humidity")
