library(ggplot2)

# Create the data frame
df <- data.frame(
  Month = c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec"),
  
  Economic_Condition = c("Good", "Good", "Good", "Good", "Fair", "Fair", "Good", "Bad", "Fair", "Good", "Bad", "Fair"),
  
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)


# 1 Create the stacked bar chart
library(ggplot2)

# Create the data frame
data <- data.frame(
  Month = c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec"),
  Economic_Condition = c("Good", "Good", "Good", "Good", "Fair", "Fair", "Good", "Bad", "Fair", "Good", "Bad", "Fair"),
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)

# Create the stacked bar plot
ggplot(data, aes(x = Economic_Condition, y = Unemployment_Rate, fill = Month)) +
  geom_bar(stat = "identity") +
  ggtitle("Unemployment Rate by Economic Condition and Month") +
  xlab("Economic Condition") +
  ylab("Unemployment Rate (%)") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




# pie chart
pie(df$Unemployment_Rate, labels = df$Month, main = "Unemployment Rate by Month")



# Grouped bar plot
ggplot(df, aes(fill = Economic_Condition, y = Unemployment_Rate, x = Month)) +
  geom_bar(position = 'dodge', stat = 'identity') +
  labs(x = 'Month', y = 'Unemployment Rate', title = 'Grouped Bar Plot: Unemployment Rate by Month') +
  theme_minimal()



library(ggplot2)
# Create the stacked bar chart
ggplot(df, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity", position = "fill") +  # Stack bars on top of each other
  labs(title = "Unemployment Rate by Economic Condition",
       x = "Month",
       y = "Unemployment Rate (%)",
       fill = "Economic Condition") +
  theme_classic()  # Adjust theme for better readability

# Print the chart
ggsave("unemployment_by_condition.png")



