# Install and load the necessary packages
#install.packages("arules")
#install.packages("Matrix")

library(arules)
library(Matrix)

# Load the Groceries dataset (preloaded in arules package)
data("Groceries")

# View the structure of the dataset
summary(Groceries)

# Apply the Apriori algorithm
# We set the support = 0.01 (minimum support of 1%), and confidence = 0.5 (minimum confidence of 50%)
rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.5, target = "rules"))

# Inspect the generated rules
inspect(head(rules, 10))

# Sort the rules by lift
sorted_rules <- sort(rules, by = "lift")
inspect(head(sorted_rules, 10))

# Filter rules based on support > 0.02 and confidence > 0.7
filtered_rules <- subset(rules, support > 0.02 & confidence > 0.7)
inspect(filtered_rules)

# Visualize the rules using base R functions
# Create a data frame for rules visualization
rule_data <- as(rules, "data.frame")

# Scatter plot: Support vs Confidence
plot(rule_data$support, rule_data$confidence,
     xlab = "Support", ylab = "Confidence",
     main = "Support vs Confidence",
     pch = 19, col = "blue")

# Scatter plot: Lift vs Confidence
plot(rule_data$lift, rule_data$confidence,
     xlab = "Lift", ylab = "Confidence",
     main = "Lift vs Confidence",
     pch = 19, col = "red")

# Matrix visualization of support and confidence
support_matrix <- matrix(rule_data$support, ncol = 1)
confidence_matrix <- matrix(rule_data$confidence, ncol = 1)

image(support_matrix, col = heat.colors(10), axes = FALSE, main = "Support Heatmap")
image(confidence_matrix, col = heat.colors(10), axes = FALSE, main = "Confidence Heatmap")
