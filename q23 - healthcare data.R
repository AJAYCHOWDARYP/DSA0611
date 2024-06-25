# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Sample healthcare data
healthcare_data <- data.frame(
  Patient = c('A', 'B', 'C', 'D', 'E'),
  Age = c(45, 55, 60, 50, 65),
  BloodPressure = c('120/80', '130/85', '140/90', '125/82', '150/95'),
  CholesterolLevel = c(180, 200, 220, 190, 240)
)

# Extract systolic and diastolic blood pressure values
healthcare_data$Systolic <- as.numeric(sapply(strsplit(healthcare_data$BloodPressure, "/"), `[`, 1))
healthcare_data$Diastolic <- as.numeric(sapply(strsplit(healthcare_data$BloodPressure, "/"), `[`, 2))

# 1. Scatter plot of Cholesterol Level vs Age with Blood Pressure as size
p1 <- ggplot(healthcare_data, aes(x = Age, y = CholesterolLevel, size = Systolic)) +
  geom_point() +
  scale_size_area(max_size = 10) +
  labs(title = "Cholesterol Level vs Age with Blood Pressure (Systolic) as Size",
       x = "Age", y = "Cholesterol Level (mg/dL)",
       size = "Systolic BP (mmHg)") +
  theme_minimal()
print(p1)

# 2. 3D Scatter Plot: Blood Pressure (Systolic) vs Age vs Cholesterol Level
plot_ly(healthcare_data, x = ~Systolic, y = ~Age, z = ~CholesterolLevel, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
                      yaxis = list(title = 'Age'),
                      zaxis = list(title = 'Cholesterol Level (mg/dL)')),
         title = "3D Scatter Plot: Systolic BP, Age, and Cholesterol Level")

# 3. Check for Correlation
plot_ly(healthcare_data, x = ~Systolic, y = ~Age, z = ~CholesterolLevel, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
                      yaxis = list(title = 'Age'),
                      zaxis = list(title = 'Cholesterol Level (mg/dL)')),
         title = "3D Scatter Plot: Correlation between Systolic BP, Age, and Cholesterol Level")

# 4. 3D Surface Plot for Cholesterol Level with varying Age and Systolic BP
# Interpolate data
interp_data <- with(healthcare_data, interp(x = Age, y = Systolic, z = CholesterolLevel))

plot_ly(x = interp_data$x, y = interp_data$y, z = interp_data$z, type = 'surface') %>%
  layout(scene = list(xaxis = list(title = 'Age'),
                      yaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
                      zaxis = list(title = 'Cholesterol Level (mg/dL)')),
         title = "3D Surface Plot: Cholesterol Level with Age and Systolic BP")

# 5. Compare 3D plots of Cholesterol Level against Age and Systolic BP separately
# 3D Scatter Plot for Cholesterol Level vs Age
plot_ly(healthcare_data, x = ~Age, y = ~CholesterolLevel, z = ~Systolic, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Age'),
                      yaxis = list(title = 'Cholesterol Level (mg/dL)'),
                      zaxis = list(title = 'Systolic Blood Pressure (mmHg)')),
         title = "3D Scatter Plot: Age, Cholesterol Level, and Systolic BP")

# 3D Scatter Plot for Cholesterol Level vs Systolic BP
plot_ly(healthcare_data, x = ~Systolic, y = ~CholesterolLevel, z = ~Age, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis')) %>%
  layout(scene = list(xaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
                      yaxis = list(title = 'Cholesterol Level (mg/dL)'),
                      zaxis = list(title = 'Age')),
         title = "3D Scatter Plot: Systolic BP, Cholesterol Level, and Age")
