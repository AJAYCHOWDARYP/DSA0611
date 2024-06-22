# 1 pie plot

library(ggplot2)
library(dplyr)# Create the data frame
df <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Job_Sector = c("IT", "Government Job", "Customer care", "Bank", "Games"),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)
# Calculate total job seekers
total_job_seekers <- sum(df$Job_Seekers_Rate)

# Calculate percentage of job seekers for each sector
df <- df %>%
  mutate(Job_Seekers_Percent = Job_Seekers_Rate / total_job_seekers * 100)

# Create the pie plot
ggplot(df, aes(x = "", y = Job_Seekers_Percent, fill = Job_Sector)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Pie Plot: Job Seekers Rate by Sector",
       fill = "Job Sector",
       y = "Job Seekers Rate (%)") +
  theme_minimal() +
  theme(legend.position = "bottom")  # Adjust legend position if needed


# 2 mosaic plot

# Load VCD library
library(vcd)

# Create the data frame
df <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Job_Sector = c("IT", "Government Job", "Customer care", "Bank", "Games"),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)

# Convert dataset to contingency table format
mosaic_data <- xtabs(Job_Seekers_Rate ~ Year + Job_Sector, data = df)

# Create the mosaic plot
mosaic(mosaic_data,
       shade = TRUE,  # Add shading to cells
       legend = TRUE,  # Show legend
       main = "Mosaic Plot: Job Seekers Rate by Year and Job Sector",
       labeling_args = list(rot_labels = c(90, 0)))  # Rotate labels for better readability


# 3 funnel plot

library(ggplot2)

# Inverted selection rate (assuming higher is better)
df$Inv_Selection_Rate <- 100 - df$Selection_Rate

# Plot
ggplot(df, aes(x = Job_Sector, y = Inv_Selection_Rate)) +
  geom_point(aes(size = Selection_Rate), color = "blue") +  # Point size based on Selection Rate
  geom_hline(yintercept = mean(df$Inv_Selection_Rate), linetype = "dashed", color = "red") + # Average selection rate line
  labs(title = "Selection Rate by Job Sector (Funnel Plot)",
       x = "Job Sector",
       y = "Inverted Selection Rate (%)") +
  theme_bw()  # Adjust plot theme for better readability




# Install and load the ggplot2 package
# install.packages("ggplot2")
library(ggplot2)
# Create the data frame
df <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Job_Sector = c("IT", "Government Job", "Customer care", "Bank", "Games"),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)
# Create the funnel plot
ggplot(df, aes(x = Job_Sector, y = Job_Seekers_Rate)) +
  geom_bar(stat = "identity", fill = "skyblue", width = 0.6) +
  geom_text(aes(label = paste0(Job_Seekers_Rate, "%")), vjust = -0.5) +
  labs(x = "Job Sector", y = "Job Seekers Rate", title = "Funnel Plot: Job Seekers Rate by Sector") +
  theme_minimal()

