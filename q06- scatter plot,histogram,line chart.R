# Creating the data frame
df <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Age = c(25, 30, 28, 35, 40),
  Height = c(175, 180, 170, 165, 185),
  Weight = c(70, 80, 65, 75, 90)
)

# Scatter plot between Age and Weight
plot(df$Age, df$Weight, main="Scatter Plot between Age and Weight",
     xlab="Age", ylab="Weight", pch=19, col="blue")
# Histogram of Height
hist(df$Height, main="Histogram of Height", 
     xlab="Height", col="lightblue", border="black")
# Line chart showing changes in Weight over IDs
plot(df$ID, df$Weight, type="o", main="Line Chart of Weight over IDs",
     xlab="ID", ylab="Weight", col="red", pch=19)
# Box plot of Age
boxplot(df$Age, main="Box Plot of Age", 
        ylab="Age", col="lightgreen")
# Density plot of Height
plot(density(df$Height), main="Density Plot of Height", 
     xlab="Height", col="purple")
