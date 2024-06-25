# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample sales data by region
sales_data <- data.frame(
  Region = c('North', 'South', 'East', 'West', 'Central'),
  Sales = c(250, 300, 280, 270, 260),
  AdvertisingCost = c(1000, 1200, 1100, 1050, 1150),
  CustomerSatisfaction = c(8, 7, 9, 7.5, 8.5)
)

# 1. Scatter plot of Customer Satisfaction vs Sales with Advertising Cost as color
p1 <- ggplot(sales_data, aes(x = Sales, y = CustomerSatisfaction, color = AdvertisingCost)) +
  geom_point(size = 3) +
  labs(title = "Customer Satisfaction vs Sales with Advertising Cost",
       x = "Sales ($ thousands)", y = "Customer Satisfaction (out of 10)") +
  scale_color_gradient(name = "Advertising Cost ($)")
print(p1)

# 2. 3D Scatter Plot: Advertising Cost vs Sales vs Customer Satisfaction
plot_ly(sales_data, x = ~AdvertisingCost, y = ~Sales, z = ~CustomerSatisfaction, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Rainbow')) %>%
  layout(scene = list(xaxis = list(title = 'Advertising Cost ($)'),
                      yaxis = list(title = 'Sales ($ thousands)'),
                      zaxis = list(title = 'Customer Satisfaction (out of 10)')),
         title = "3D Scatter Plot: Advertising Cost, Sales, and Customer Satisfaction")

# 3. Check for Correlation
plot_ly(sales_data, x = ~AdvertisingCost, y = ~Sales, z = ~CustomerSatisfaction, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Advertising Cost ($)'),
                      yaxis = list(title = 'Sales ($ thousands)'),
                      zaxis = list(title = 'Customer Satisfaction (out of 10)')),
         title = "3D Scatter Plot: Correlation between Advertising Cost, Sales, and Customer Satisfaction")

# 4. 3D Surface Plot for Customer Satisfaction with varying Sales and Advertising Cost
# Interpolate data
interp_data <- with(sales_data, interp(x = Sales, y = AdvertisingCost, z = CustomerSatisfaction))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Sales ($ thousands)'),
                      yaxis = list(title = 'Advertising Cost ($)'),
                      zaxis = list(title = 'Customer Satisfaction (out of 10)')),
         title = "3D Surface Plot: Customer Satisfaction with Sales and Advertising Cost")

# 5. Compare 3D plots of Customer Satisfaction against Sales and Advertising Cost separately
# 3D Scatter Plot for Customer Satisfaction vs Sales
plot_ly(sales_data, x = ~Sales, y = ~CustomerSatisfaction, z = ~AdvertisingCost, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Sales ($ thousands)'),
                      yaxis = list(title = 'Customer Satisfaction (out of 10)'),
                      zaxis = list(title = 'Advertising Cost ($)')),
         title = "3D Scatter Plot: Sales, Customer Satisfaction, and Advertising Cost")

# 3D Scatter Plot for Customer Satisfaction vs Advertising Cost
plot_ly(sales_data, x = ~AdvertisingCost, y = ~CustomerSatisfaction, z = ~Sales, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Advertising Cost ($)'),
                      yaxis = list(title = 'Customer Satisfaction (out of 10)'),
                      zaxis = list(title = 'Sales ($ thousands)')),
         title = "3D Scatter Plot: Advertising Cost, Customer Satisfaction, and Sales")
