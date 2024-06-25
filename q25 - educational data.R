# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample educational data
educational_data <- data.frame(
  Student = c('A', 'B', 'C', 'D', 'E'),
  MathScore = c(85, 72, 90, 78, 88),
  ReadingScore = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 1. Scatter plot of Reading Score vs Math Score with Attendance as size
p1 <- ggplot(educational_data, aes(x = MathScore, y = ReadingScore, size = Attendance)) +
  geom_point() +
  scale_size_area(max_size = 10) +
  labs(title = "Reading Score vs Math Score with Attendance as Size",
       x = "Math Score", y = "Reading Score",
       size = "Attendance (%)") +
  theme_minimal()
print(p1)

# 2. 3D Scatter Plot: Math Score vs Reading Score vs Attendance
plot_ly(educational_data, x = ~MathScore, y = ~ReadingScore, z = ~Attendance, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Reading Score'),
                      zaxis = list(title = 'Attendance (%)')),
         title = "3D Scatter Plot: Math Score, Reading Score, and Attendance")

# 3. Check for Correlation
plot_ly(educational_data, x = ~MathScore, y = ~ReadingScore, z = ~Attendance, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Reading Score'),
                      zaxis = list(title = 'Attendance (%)')),
         title = "3D Scatter Plot: Correlation between Math Score, Reading Score, and Attendance")

# 4. 3D Surface Plot for Reading Score with varying Math Score and Attendance
# Interpolate data
interp_data <- with(educational_data, interp(x = MathScore, y = Attendance, z = ReadingScore))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Reading Score')),
         title = "3D Surface Plot: Reading Score with Math Score and Attendance")

# 5. Compare 3D plots of Reading Score against Math Score and Attendance separately
# 3D Scatter Plot for Reading Score vs Math Score
plot_ly(educational_data, x = ~MathScore, y = ~ReadingScore, z = ~Attendance, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Reading Score'),
                      zaxis = list(title = 'Attendance (%)')),
         title = "3D Scatter Plot: Math Score, Reading Score, and Attendance")

# 3D Scatter Plot for Reading Score vs Attendance
plot_ly(educational_data, x = ~Attendance, y = ~ReadingScore, z = ~MathScore, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Attendance (%)'),
                      yaxis = list(title = 'Reading Score'),
                      zaxis = list(title = 'Math Score')),
         title = "3D Scatter Plot: Attendance, Reading Score, and Math Score")
