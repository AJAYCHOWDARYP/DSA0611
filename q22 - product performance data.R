# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample product performance data
product_data <- data.frame(
  Product = c('A', 'B', 'C', 'D', 'E'),
  Price = c(50, 70, 60, 45, 55),
  UnitsSold = c(1000, 800, 1200, 1500, 900),
  CustomerRatings = c(4.2, 4.0, 4.5, 3.8, 4.3)
)

# 1. Scatter plot of Customer Ratings vs Price with Units Sold as size
p1 <- ggplot(product_data, aes(x = Price, y = CustomerRatings, size = UnitsSold)) +
  geom_point() +
  scale_size_area(max_size = 10) +
  labs(title = "Customer Ratings vs Price with Units Sold",
       x = "Price ($)", y = "Customer Ratings (out of 5)",
       size = "Units Sold") +
  theme_minimal()
print(p1)

# 2. 3D Scatter Plot: Units Sold vs Customer Ratings vs Product Price
plot_ly(product_data, x = ~UnitsSold, y = ~CustomerRatings, z = ~Price, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Units Sold'),
                      yaxis = list(title = 'Customer Ratings (out of 5)'),
                      zaxis = list(title = 'Product Price ($)')),
         title = "3D Scatter Plot: Units Sold, Customer Ratings, and Product Price")

# 3. Check for Correlation
plot_ly(product_data, x = ~UnitsSold, y = ~CustomerRatings, z = ~Price, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Units Sold'),
                      yaxis = list(title = 'Customer Ratings (out of 5)'),
                      zaxis = list(title = 'Product Price ($)')),
         title = "3D Scatter Plot: Correlation between Units Sold, Customer Ratings, and Product Price")

# 4. 3D Surface Plot for Customer Ratings with varying Units Sold and Product Price
# Interpolate data
interp_data <- with(product_data, interp(x = UnitsSold, y = Price, z = CustomerRatings))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Units Sold'),
                      yaxis = list(title = 'Product Price ($)'),
                      zaxis = list(title = 'Customer Ratings (out of 5)')),
         title = "3D Surface Plot: Customer Ratings with Units Sold and Product Price")

# 5. Compare 3D plots of Customer Ratings against Units Sold and Product Price separately
# 3D Scatter Plot for Customer Ratings vs Units Sold
plot_ly(product_data, x = ~UnitsSold, y = ~CustomerRatings, z = ~Price, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Units Sold'),
                      yaxis = list(title = 'Customer Ratings (out of 5)'),
                      zaxis = list(title = 'Product Price ($)')),
         title = "3D Scatter Plot: Units Sold, Customer Ratings, and Product Price")

# 3D Scatter Plot for Customer Ratings vs Product Price
plot_ly(product_data, x = ~Price, y = ~CustomerRatings, z = ~UnitsSold, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Product Price ($)'),
                      yaxis = list(title = 'Customer Ratings (out of 5)'),
                      zaxis = list(title = 'Units Sold')),
         title = "3D Scatter Plot: Product Price, Customer Ratings, and Units Sold")
