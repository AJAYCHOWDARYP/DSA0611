# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample consumer survey data
consumer_data <- data.frame(
  Product = c('A', 'B', 'C', 'D', 'E'),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  AgeGroup = c('25-35', '35-45', '18-25', '45-55', '25-35')
)

# 1. Scatter plot of Rating vs Price with Age Group as color
p1 <- ggplot(consumer_data, aes(x = Price, y = Rating, color = AgeGroup)) +
  geom_point(size = 3) +
  labs(title = "Rating vs Price with Age Group",
       x = "Price ($)", y = "Rating (out of 5)") +
  scale_color_discrete(name = "Age Group")
print(p1)

# 2. 3D Scatter Plot: Price vs Rating vs Age Group
# Convert Age Group to numeric for 3D plot
consumer_data$AgeGroupNum <- as.numeric(factor(consumer_data$AgeGroup, levels = c('18-25', '25-35', '35-45', '45-55')))

plot_ly(consumer_data, x = ~Price, y = ~AgeGroupNum, z = ~Rating, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Rating, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Age Group', tickvals = 1:4, ticktext = c('18-25', '25-35', '35-45', '45-55')),
                      zaxis = list(title = 'Rating (out of 5)')),
         title = "3D Scatter Plot: Price, Age Group, and Rating")

# 3. Check for Correlation
plot_ly(consumer_data, x = ~Price, y = ~AgeGroupNum, z = ~Rating, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Rating, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Age Group', tickvals = 1:4, ticktext = c('18-25', '25-35', '35-45', '45-55')),
                      zaxis = list(title = 'Rating (out of 5)')),
         title = "3D Scatter Plot: Correlation between Price, Age Group, and Rating")

# 4. 3D Surface Plot for Rating with varying Price and Age Group
# Interpolate data
interp_data <- with(consumer_data, interp(x = Price, y = AgeGroupNum, z = Rating))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Age Group', tickvals = 1:4, ticktext = c('18-25', '25-35', '35-45', '45-55')),
                      zaxis = list(title = 'Rating (out of 5)')),
         title = "3D Surface Plot: Rating with Price and Age Group")

# 5. Compare 3D plots of Rating against Price and Age Group separately
# 3D Scatter Plot for Rating vs Price
plot_ly(consumer_data, x = ~Price, y = ~Rating, z = ~AgeGroupNum, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Rating, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Rating (out of 5)'),
                      zaxis = list(title = 'Age Group', tickvals = 1:4, ticktext = c('18-25', '25-35', '35-45', '45-55'))),
         title = "3D Scatter Plot: Price, Rating, and Age Group")

# 3D Scatter Plot for Rating vs Age Group
plot_ly(consumer_data, x = ~AgeGroupNum, y = ~Rating, z = ~Price, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Rating, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Age Group', tickvals = 1:4, ticktext = c('18-25', '25-35', '35-45', '45-55')),
                      yaxis = list(title = 'Rating (out of 5)'),
                      zaxis = list(title = 'Price ($)')),
         title = "3D Scatter Plot: Age Group, Rating, and Price")
