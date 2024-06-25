# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample environmental data
environmental_data <- data.frame(
  Location = c('A', 'B', 'C', 'D', 'E'),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)

# 1. Scatter plot of CO2 Levels vs Temperature with Humidity as color
p1 <- ggplot(environmental_data, aes(x = Temperature, y = CO2Levels, color = Humidity)) +
  geom_point(size = 3) +
  labs(title = "CO2 Levels vs Temperature with Humidity",
       x = "Temperature (°C)", y = "CO2 Levels (ppm)") +
  scale_color_gradient(name = "Humidity (%)")
print(p1)

# 2. 3D Scatter Plot: Temperature vs Humidity vs CO2 Levels
plot_ly(environmental_data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CO2Levels, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')),
         title = "3D Scatter Plot: Temperature, Humidity, and CO2 Levels")

# 3. Check for Spatial Patterns
plot_ly(environmental_data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CO2Levels, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')),
         title = "3D Scatter Plot: Spatial Patterns in Temperature, Humidity, and CO2 Levels")

# 4. 3D Surface Plot for CO2 Levels with varying Temperature and Humidity
# Interpolate data
interp_data <- with(environmental_data, interp(x = Temperature, y = Humidity, z = CO2Levels))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')),
         title = "3D Surface Plot: CO2 Levels with Temperature and Humidity")

# 5. Compare 3D plots of CO2 levels against temperature and humidity separately
# 3D Scatter Plot for CO2 Levels vs Temperature
plot_ly(environmental_data, x = ~Temperature, y = ~CO2Levels, z = ~Humidity, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CO2Levels, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'CO2 Levels (ppm)'),
                      zaxis = list(title = 'Humidity (%)')),
         title = "3D Scatter Plot: Temperature, CO2 Levels, and Humidity")

# 3D Scatter Plot for CO2 Levels vs Humidity
plot_ly(environmental_data, x = ~Humidity, y = ~CO2Levels, z = ~Temperature, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CO2Levels, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'CO2 Levels (ppm)'),
                      zaxis = list(title = 'Temperature (°C)')),
         title = "3D Scatter Plot: Humidity, CO2 Levels, and Temperature")
