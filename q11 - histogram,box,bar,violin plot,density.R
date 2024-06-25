# Load necessary libraries
library(ggplot2)

# Sample data
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Score = c(85, 92, 78, 88, 90)
)

# 1. Create a histogram of Score
ggplot(data, aes(x = Score)) +
  geom_histogram(binwidth = 5, color = "black", fill = "blue") +
  ggtitle("Histogram of Scores") +
  xlab("Score") +
  ylab("Frequency")

# 2. Generate a box plot of Score
ggplot(data, aes(x = "", y = Score)) +
  geom_boxplot() +
  ggtitle("Box Plot of Scores") +
  xlab("") +
  ylab("Score")

# 3. Plot a bar chart showing the count of scores in different ranges (0-50, 51-100)
data$ScoreRange <- cut(data$Score, breaks = c(0, 50, 100), right = TRUE)
ggplot(data, aes(x = ScoreRange)) +
  geom_bar(color = "black", fill = "green") +
  ggtitle("Bar Chart of Score Ranges") +
  xlab("Score Range") +
  ylab("Count")

# 4. Create a density plot of Score
ggplot(data, aes(x = Score)) +
  geom_density(fill = "red", alpha = 0.5) +
  ggtitle("Density Plot of Scores") +
  xlab("Score") +
  ylab("Density")

# 5. Plot a violin plot of Score
ggplot(data, aes(x = "", y = Score)) +
  geom_violin(fill = "purple") +
  ggtitle("Violin Plot of Scores") +
  xlab("") +
  ylab("Score")
