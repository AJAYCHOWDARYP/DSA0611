# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample financial market data
financial_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# 1. Scatter plot of Stock Price vs Volume Traded with Market Cap as color
p1 <- ggplot(financial_data, aes(x = VolumeTraded, y = StockPrice, color = MarketCap)) +
  geom_point(size = 3) +
  labs(title = "Stock Price vs Volume Traded with Market Cap",
       x = "Volume Traded (millions)", y = "Stock Price ($)") +
  scale_color_gradient(name = "Market Cap ($)")
print(p1)

# 2. 3D Scatter Plot: Volume Traded vs Market Cap vs Stock Price
plot_ly(financial_data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Cap ($)'),
                      zaxis = list(title = 'Stock Price ($)')),
         title = "3D Scatter Plot: Volume Traded, Market Cap, and Stock Price")

# 3. Check for Clustering or Outliers
plot_ly(financial_data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Cap ($)'),
                      zaxis = list(title = 'Stock Price ($)')),
         title = "3D Scatter Plot: Clustering and Outliers in Volume Traded, Market Cap, and Stock Price")

# 4. 3D Surface Plot for Market Cap with varying Stock Price and Volume Traded
# Interpolate data
interp_data <- with(financial_data, interp(x = StockPrice, y = VolumeTraded, z = MarketCap))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Stock Price ($)'),
                      yaxis = list(title = 'Volume Traded (millions)'),
                      zaxis = list(title = 'Market Cap ($)')),
         title = "3D Surface Plot: Market Cap with Stock Price and Volume Traded")

# 5. Compare 3D plots of stock price against volume traded and market cap separately
# 3D Scatter Plot for Stock Price vs Volume Traded
plot_ly(financial_data, x = ~VolumeTraded, y = ~StockPrice, z = ~MarketCap, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Stock Price ($)'),
                      zaxis = list(title = 'Market Cap ($)')),
         title = "3D Scatter Plot: Volume Traded, Stock Price, and Market Cap")

# 3D Scatter Plot for Stock Price vs Market Cap
plot_ly(financial_data, x = ~MarketCap, y = ~StockPrice, z = ~VolumeTraded, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Market Cap ($)'),
                      yaxis = list(title = 'Stock Price ($)'),
                      zaxis = list(title = 'Volume Traded (millions)')),
         title = "3D Scatter Plot: Market Cap, Stock Price, and Volume Traded")
