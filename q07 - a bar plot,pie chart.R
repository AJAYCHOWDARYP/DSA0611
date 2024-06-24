# Creating the data frame
df <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Gender = c("Male", "Female", "Male", "Female", "Male"),
  Education = c("Graduate", "Undergrad", "High School", "Graduate", "Undergrad"),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer", "Artist")
)

# Bar plot showing the count of each Gender
barplot(table(df$Gender), main="Count of Each Gender", 
        xlab="Gender", ylab="Count", col=c("blue", "pink"))
# Pie chart representing the distribution of Education levels with percentage values
education_counts <- table(df$Education)
education_percentages <- round(100 * education_counts / sum(education_counts), 1)
education_labels <- paste(names(education_counts), education_percentages, "%")

pie(education_counts, labels = education_labels, main = "Distribution of Education Levels", 
    col = rainbow(length(education_counts)))
# Stacked bar plot showing the count of each Occupation by Gender
occupation_gender <- table(df$Occupation, df$Gender)
barplot(occupation_gender, main="Count of Each Occupation by Gender", 
        xlab="Occupation", ylab="Count", col=c("blue", "pink"), legend=rownames(occupation_gender))
# Mosaic plot to visualize the association between Education and Occupation
library(vcd)
mosaic(~ Education + Occupation, data=df, shade=TRUE, 
       main="Association Between Education and Occupation")
# Grouped bar plot showing counts of Gender across different Education levels
gender_education <- table(df$Gender, df$Education)
barplot(gender_education, beside=TRUE, main="Counts of Gender Across Different Education Levels", 
        xlab="Education", ylab="Count", col=c("blue", "pink"), legend=rownames(gender_education))
