library(ggplot2)
library(tidyr)
library(dplyr)
library(vcd)


data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Variable1 = c(0, 1, 0, 1, 0),
  Variable2 = c(1, 0, 1, 1, 0),
  Variable3 = c(0, 1, 1, 0, 0)
)

ggplot(data, aes(x = as.factor(Variable1))) +
  geom_bar(aes(fill = as.factor(Variable1)), color = "black") +
  geom_text(stat='count', aes(label=..count..), vjust=-0.5) +
  ggtitle("Count of Each Value (0 or 1) for Variable1") +
  xlab("Variable1") +
  ylab("Count") +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "lightgreen"), name = "Value")


data_long <- data %>% 
  pivot_longer(cols = c(Variable1, Variable2, Variable3), names_to = "Variable", values_to = "Value")

ggplot(data_long, aes(x = Variable, fill = as.factor(Value))) +
  geom_bar(position = "stack", color = "black") +
  geom_text(stat='count', aes(label=..count..), position = position_stack(vjust = 0.5)) +
  ggtitle("Stacked Bar Plot of Variable1, Variable2, and Variable3") +
  xlab("Variable") +
  ylab("Count") +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "lightgreen"), name = "Value")

variable2_counts <- data %>%
  count(Variable2) %>%
  mutate(Percentage = n / sum(n) * 100,
         Label = paste0(n, " (", round(Percentage, 1), "%)"))

ggplot(variable2_counts, aes(x = "", y = n, fill = as.factor(Variable2))) +
  geom_bar(width = 1, stat = "identity", color = "black") +
  coord_polar(theta = "y") +
  geom_text(aes(label = Label), position = position_stack(vjust = 0.5), color = "white") +
  ggtitle("Proportion of 0s and 1s in Variable2") +
  theme_void() +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "lightgreen"), name = "Variable2")

mosaic_data <- table(data$Variable1, data$Variable2)
mosaicplot(mosaic_data, main = "Mosaic Plot of Variable1 and Variable2", color = TRUE)

combination_counts <- data %>%
  count(Variable1, Variable2)

ggplot(combination_counts, aes(x = interaction(Variable1, Variable2), y = n, fill = interaction(Variable1, Variable2))) +
  geom_bar(stat = "identity", color = "black") +
  geom_text(aes(label = n), vjust = -0.5) +
  ggtitle("Frequency of Each Combination of Values in Variable1 and Variable2") +
  xlab("Combination of Variable1 and Variable2") +
  ylab("Count") +
  scale_fill_manual(values = c("0.0" = "lightblue", "1.0" = "lightgreen", "0.1" = "pink", "1.1" = "orange"), name = "Combination")
