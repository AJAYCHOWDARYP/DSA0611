# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample academic performance data
academic_data <- data.frame(
  Student = c('A', 'B', 'C', 'D', 'E'),
  MathScore = c(85, 72, 90, 78, 88),
  ScienceScore = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 1. Scatter plot of Science Score vs Math Score with Attendance as color
p1 <- ggplot(academic_data, aes(x = MathScore, y = ScienceScore, color = Attendance)) +
  geom_point(size = 3) +
  labs(title = "Science Score vs Math Score with Attendance",
       x = "Math Score", y = "Science Score") +
  scale_color_gradient(name = "Attendance (%)")
print(p1)

# 2. 3D Scatter Plot: Math Score vs Science Score vs Attendance
plot_ly(academic_data, x = ~MathScore, y = ~Attendance, z = ~ScienceScore, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ScienceScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Science Score')),
         title = "3D Scatter Plot: Math Score, Attendance, and Science Score")

# 3. Check for Correlation
plot_ly(academic_data, x = ~MathScore, y = ~Attendance, z = ~ScienceScore, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ScienceScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Science Score')),
         title = "3D Scatter Plot: Correlation between Math Score, Attendance, and Science Score")

# 4. 3D Surface Plot for Science Score with varying Math Score and Attendance
# Interpolate data
interp_data <- with(academic_data, interp(x = MathScore, y = Attendance, z = ScienceScore))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Science Score')),
         title = "3D Surface Plot: Science Score with Math Score and Attendance")

# 5. Compare 3D plots of Science Score against Math Score and Attendance separately
# 3D Scatter Plot for Science Score vs Math Score
plot_ly(academic_data, x = ~MathScore, y = ~ScienceScore, z = ~Attendance, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ScienceScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Attendance (%)')),
         title = "3D Scatter Plot: Math Score, Science Score, and Attendance")

# 3D Scatter Plot for Science Score vs Attendance
plot_ly(academic_data, x = ~Attendance, y = ~ScienceScore, z = ~MathScore, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~ScienceScore, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Attendance (%)'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Math Score')),
         title = "3D Scatter Plot: Attendance, Science Score, and Math Score")
