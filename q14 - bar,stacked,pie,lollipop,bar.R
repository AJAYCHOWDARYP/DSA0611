library(ggplot2)


data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Rating = c("Good", "Excellent", "Fair", "Poor", "Good")
)



# Count occurrences of each rating
rating_counts <- table(data$Rating)

# Convert counts to percentages
rating_percentages <- prop.table(rating_counts) * 100

# Create a dataframe for plotting
rating_data <- data.frame(
  Rating = names(rating_percentages),
  Percentage = as.numeric(rating_percentages)
)

# Plotting bar plot
bar_plot <- ggplot(rating_data, aes(x = Rating, y = Percentage, fill = Rating)) +
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Count of Each Rating Category",
       x = "Rating",
       y = "Percentage",
       fill = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5))

# Display the bar plot
print(bar_plot)



# Create a table of counts by ID and Rating
rating_table <- table(data$ID, data$Rating)

# Convert to dataframe for plotting
rating_df <- as.data.frame.matrix(rating_table)

# Plotting stacked bar chart
stacked_bar_plot <- ggplot(rating_df, aes(x = factor(Var1), y = Freq, fill = Var2)) +
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Stacked Bar Plot of Rating over IDs",
       x = "ID",
       y = "Count",
       fill = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5)) +
  scale_x_discrete(labels = as.character(rating_df$Var1))

# Display the stacked bar plot
print(stacked_bar_plot)




# Calculate percentages for each rating category
rating_percentages <- prop.table(rating_counts) * 100

# Plotting pie chart
pie_chart <- ggplot(rating_data, aes(x = "", y = Percentage, fill = Rating)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of Ratings",
       fill = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# Display the pie chart
print(pie_chart)



# Example: Average rating by ID (replace with actual data)
average_ratings <- aggregate(as.numeric(as.factor(data$Rating)), by = list(data$ID), FUN = mean)

# Plotting lollipop chart
lollipop_plot <- ggplot(average_ratings, aes(x = Group.1, y = x)) +
  geom_point() +
  geom_segment(aes(x = Group.1, xend = Group.1, y = 0, yend = x), color = "blue") +
  labs(title = "Average Rating by ID",
       x = "ID",
       y = "Average Rating") +
  theme_minimal()

# Display the lollipop plot
print(lollipop_plot)


# Plotting bar chart of frequency
freq_bar_plot <- ggplot(data, aes(x = Rating)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Frequency of Each Rating Category",
       x = "Rating",
       y = "Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5))

# Display the frequency bar plot
print(freq_bar_plot)
