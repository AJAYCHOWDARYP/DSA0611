# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample productivity data
productivity_data <- data.frame(
  Employee = c('A', 'B', 'C', 'D', 'E'),
  HoursWorked = c(40, 35, 45, 38, 42),
  TasksCompleted = c(10, 8, 12, 9, 11),
  Efficiency = c(80, 75, 85, 78, 82)
)

# 1. Scatter plot of Efficiency vs Hours Worked with Tasks Completed as size
p1 <- ggplot(productivity_data, aes(x = HoursWorked, y = Efficiency, size = TasksCompleted)) +
  geom_point() +
  scale_size_area(max_size = 10) +
  labs(title = "Efficiency vs Hours Worked with Tasks Completed as Size",
       x = "Hours Worked", y = "Efficiency (%)",
       size = "Tasks Completed") +
  theme_minimal()
print(p1)

# 2. 3D Scatter Plot: Tasks Completed vs Efficiency vs Hours Worked
plot_ly(productivity_data, x = ~TasksCompleted, y = ~Efficiency, z = ~HoursWorked, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Tasks Completed'),
                      yaxis = list(title = 'Efficiency (%)'),
                      zaxis = list(title = 'Hours Worked')),
         title = "3D Scatter Plot: Tasks Completed, Efficiency, and Hours Worked")

# 3. Check for Correlation
plot_ly(productivity_data, x = ~TasksCompleted, y = ~Efficiency, z = ~HoursWorked, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Tasks Completed'),
                      yaxis = list(title = 'Efficiency (%)'),
                      zaxis = list(title = 'Hours Worked')),
         title = "3D Scatter Plot: Correlation between Tasks Completed, Efficiency, and Hours Worked")

# 4. 3D Surface Plot for Efficiency with varying Tasks Completed and Hours Worked
# Interpolate data
interp_data <- with(productivity_data, interp(x = TasksCompleted, y = HoursWorked, z = Efficiency))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Tasks Completed'),
                      yaxis = list(title = 'Hours Worked'),
                      zaxis = list(title = 'Efficiency (%)')),
         title = "3D Surface Plot: Efficiency with Tasks Completed and Hours Worked")

# 5. Compare 3D plots of Efficiency against Tasks Completed and Hours Worked separately
# 3D Scatter Plot for Efficiency vs Tasks Completed
plot_ly(productivity_data, x = ~TasksCompleted, y = ~Efficiency, z = ~HoursWorked, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Tasks Completed'),
                      yaxis = list(title = 'Efficiency (%)'),
                      zaxis = list(title = 'Hours Worked')),
         title = "3D Scatter Plot: Tasks Completed, Efficiency, and Hours Worked")

# 3D Scatter Plot for Efficiency vs Hours Worked
plot_ly(productivity_data, x = ~HoursWorked, y = ~Efficiency, z = ~TasksCompleted, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Hours Worked'),
                      yaxis = list(title = 'Efficiency (%)'),
                      zaxis = list(title = 'Tasks Completed')),
         title = "3D Scatter Plot: Hours Worked, Efficiency, and Tasks Completed")
