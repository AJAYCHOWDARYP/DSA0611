library(ggplot2)
# Create the data frame
df <- data.frame(
  SCHOOL = c("A", "A", "A", "B", "B", "B", "C", "C", "C", "D", "D", "D"),
  GRADE_LEVEL = c("Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3",
                  "Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3"),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)


# Load necessary libraries
library(vcd)

# Create the data frame
df <- data.frame(
  SCHOOL = c("A", "A", "A", "B", "B", "B", "C", "C", "C", "D", "D", "D"),
  GRADE_LEVEL = c("Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3",
                  "Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3"),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)

# Convert the data frame to a contingency table
table_data <- xtabs(NUMBER_OF_STUDENTS ~ SCHOOL + GRADE_LEVEL, data = df)

# Create the mosaic plot
mosaic(table_data, shade = TRUE, legend = TRUE, main = "Mosaic Plot: Number of Students by Grade Level and School")




# 2 histogram
# Create a vector with the number of students
students <- c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)

# Create a histogram of the number of students
result <- hist(students)

# Print the histogram object
print(result)


# 3 scatter plot
# Create the scatter plot
ggplot(df, aes(x = GRADE_LEVEL, y = NUMBER_OF_STUDENTS, color = SCHOOL)) +
  geom_point(size = 4) +
  labs(x = 'Grade Level',
       y = 'Number of Students',
       title = 'Scatter Plot: Number of Students by Grade Level and School') +
  theme_minimal()


#install.packages("ggmosaic")
#library(ggmosaic)
#library(ggplot2)
# Create the mosaic plot
#ggplot(df, aes(x = product(SCHOOL, GRADE_LEVEL), fill = SCHOOL)) +
#  geom_mosaic() +
#  labs(x = "Grade Level", y = "School", title = "Mosaic Plot: School vs. Grade Level")
