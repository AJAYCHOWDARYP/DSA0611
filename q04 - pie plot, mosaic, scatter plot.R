# 1 pie plot
library(ggplot2)

# Create the data frame
df <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = rep("Chrome", 5),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2) * 10^6  # Convert from millions to actual number
)

# Calculate percentage of users for each year
df$Percent <- df$Users / sum(df$Users) * 100

# Create the pie plot
ggplot(df, aes(x = "", y = Percent, fill = as.factor(Year))) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Pie Plot: Distribution of Users for Chrome by Year") +
  theme_void() +
  scale_fill_brewer(palette = "Set3")  # Color palette for fill


# 2 mosaic plot
# Load libraries
library(ggplot2)
library(ggmosaic)

library(vcd)

# Create a data frame from the provided data
data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = rep("Chrome", 5),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2) #* 1e6  # Convert users to millions
)

# Create the mosaic plot
mosaicplot(
  table(data$Year, data$Browser),  # Create contingency table
  shade = TRUE,                      # Add shading for visual interest
  main = "Browser Usage Over the Years (Millions)",
  cex = 0.8,                         # Adjust text size for better readability
  label = paste(round(prop.table(table(data$Year, data$Browser)) * 100, 1), "%")  # Add percentages as labels
)


# 3 scatter plot 

# Create the scatter plot
ggplot(df, aes(x = Year, y = Users)) +
  geom_point(size = 3, color = "blue") +
  labs(x = "Year", y = "Users",
       title = "Scatter Plot: Users vs Year for Chrome") +
  theme_minimal()

