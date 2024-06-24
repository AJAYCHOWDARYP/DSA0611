# Load necessary libraries
library(GGally)
library(ggplot2)
library(plotly)
library(reshape2)
library(fmsb)

# Data
data_multivariate <- data.frame(
  ID = 1:5,
  X1 = c(5, 7, 6, 8, 4),
  X2 = c(10, 12, 11, 9, 13),
  X3 = c(15, 14, 13, 16, 17)
)

# Pairwise scatter plot matrix of X1, X2, and X3
ggpairs(data_multivariate, columns=2:4)

# 3D scatter plot of X1, X2, and X3
plot_ly(data_multivariate, x=~X1, y=~X2, z=~X3, type='scatter3d', mode='markers')

# Parallel coordinates plot of X1, X2, and X3
data_multivariate_melt <- melt(data_multivariate, id.vars="ID")
ggplot(data_multivariate_melt, aes(x=variable, y=value, group=ID, color=factor(ID))) +
  geom_line() +
  ggtitle("Parallel Coordinates Plot")

# Radar chart to compare values of X1, X2, and X3 for ID 1
data_radar <- data_multivariate[1, 2:4]
max_val <- max(data_multivariate[,-1])
radar_data <- rbind(rep(max_val, 3), rep(0, 3), data_radar)
colnames(radar_data) <- colnames(data_multivariate)[2:4]
radar_data <- as.data.frame(t(radar_data))

# Plot radar chart
radarchart(radar_data, axistype=1, 
           pcol=2, pfcol=rgb(0.2,0.5,0.5,0.5), plwd=4,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0, max_val, max_val/5), cglwd=0.8,
           vlcex=0.8)

# Heatmap showing correlations between X1, X2, and X3
corr_matrix <- cor(data_multivariate[,-1])
ggplot(melt(corr_matrix), aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  ggtitle("Heatmap of Correlations")
