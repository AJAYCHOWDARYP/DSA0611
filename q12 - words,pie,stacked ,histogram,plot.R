library(ggplot2)
library(wordcloud)
library(dplyr)
library(tidyr)


data <- data.frame(
  Word = c("Apple", "Orange", "Banana", "Grape", "Cherry"),
  Frequency = c(15, 10, 8, 12, 5)
)

set.seed(1234) # For reproducibility
wordcloud(words = data$Word, freq = data$Frequency, min.freq = 1,
          scale = c(3, 0.5), colors = brewer.pal(8, "Dark2"))

ggplot(data, aes(x = reorder(Word, -Frequency), y = Frequency)) +
  geom_bar(stat = "identity", fill = "blue") +
  ggtitle("Top 5 Most Frequent Words") +
  xlab("Word") +
  ylab("Frequency")

data_long <- data %>% 
  pivot_longer(cols = Frequency, names_to = "Type", values_to = "Value")

ggplot(data_long, aes(x = Word, y = Value, fill = Word)) +
  geom_bar(stat = "identity") +
  ggtitle("Stacked Bar Chart of Word Frequencies") +
  xlab("Word") +
  ylab("Frequency") +
  theme(legend.position = "none")

pie_data <- data %>% 
  arrange(desc(Frequency)) %>%
  mutate(prop = Frequency / sum(Frequency) * 100) %>%
  mutate(ypos = cumsum(prop) - 0.5 * prop)

ggplot(pie_data, aes(x = "", y = prop, fill = Word)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(y = ypos, label = paste0(Frequency)), color = "white") +
  ggtitle("Pie Chart of Word Frequencies") +
  theme_void()
ggplot(data, aes(x = Frequency)) +
  geom_histogram(binwidth = 1, color = "black", fill = "green") +
  ggtitle("Histogram of Frequencies") +
  xlab("Frequency") +
  ylab("Count")
