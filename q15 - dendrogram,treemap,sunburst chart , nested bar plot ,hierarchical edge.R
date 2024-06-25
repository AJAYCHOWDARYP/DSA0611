library(dendextend)
library(ggplot2)
library(treemap)
library(plotly)
library(dplyr)
library(networkD3)


data <- data.frame(
  Parent_Category = c("A", "A", "B", "B", "C"),
  Subcategory = c("A1", "A2", "B1", "B2", "C1"),
  Value = c(10, 15, 20, 25, 12)
)


# Reshape data for hierarchical clustering
dend_data <- dcast(data, Subcategory ~ Parent_Category, value.var = "Value", fill = 0)

# Compute hierarchical clustering
hc <- hclust(dist(as.matrix(dend_data)))

# Create dendrogram
dend <- as.dendrogram(hc)

# Plot dendrogram
plot(dend)


# Create treemap data
treemap_data <- aggregate(Value ~ Parent_Category + Subcategory, data = data, FUN = sum)

# Plot treemap
treemap(treemap_data,
        index = c("Parent_Category", "Subcategory"),
        vSize = "Value",
        title = "Treemap of Parent Category and Subcategory based on Value")




# Create hierarchy for sunburst chart
sunburst_data <- list(
  type = "sunburst",
  labels = paste(data$Parent_Category, " / ", data$Subcategory),
  parents = c("", "A", "", "B", ""),
  values = data$Value,
  ids = paste(data$Parent_Category, data$Subcategory, sep = " / ")
)

# Plot sunburst chart
plot_ly(sunburst_data, ids = ~ids, labels = ~labels, parents = ~parents, values = ~values,
        hoverinfo = "label+value", type = "sunburst") %>%
  layout(title = "Sunburst Chart of Values across Categories")



# Prepare data for nested bar plot
nested_data <- data %>%
  group_by(Parent_Category, Subcategory) %>%
  summarise(Value = sum(Value)) %>%
  arrange(Parent_Category, desc(Value)) %>%
  mutate(Subcategory = factor(Subcategory, levels = unique(Subcategory)))

# Plot nested bar chart
ggplot(nested_data, aes(x = Parent_Category, y = Value, fill = Subcategory)) +
  geom_bar(stat = "identity") +
  labs(title = "Nested Bar Plot of Parent Category and Subcategory",
       x = "Parent Category",
       y = "Value",
       fill = "Subcategory") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Prepare data for edge bundling plot
edge_data <- data %>%
  group_by(Parent_Category, Subcategory) %>%
  summarise(Value = sum(Value))

# Create hierarchical edge bundling plot
hierarchical_edge_bundling <- forceNetwork(Links = edge_data, Source = "Parent_Category", Target = "Subcategory", Value = "Value",
                                           NodeID = c(levels(factor(edge_data$Parent_Category)), levels(factor(edge_data$Subcategory))),
                                           Nodes = NULL, fontSize = 12, opacity = 0.9)

# Display hierarchical edge bundling plot
hierarchical_edge_bundling
