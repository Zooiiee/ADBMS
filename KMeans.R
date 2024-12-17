# Full K-Means Implementation

# Install required packages
#install.packages("graphics")
#install.packages("factoextra")

# Load libraries
library(graphics)
library(factoextra)

# Generate synthetic dataset
set.seed(123) # For reproducibility
x <- c(rnorm(50, mean = 5, sd = 1), rnorm(50, mean = 8, sd = 1))
y <- c(rnorm(50, mean = 5, sd = 1), rnorm(50, mean = 8, sd = 1))
data <- data.frame(x, y)

# Plot the dataset using base R
plot(data, main = "Scatter Plot of the Dataset", pch = 19, col = "blue")

# Apply K-Means clustering with k = 2
kmeans_result <- kmeans(data, centers = 2, nstart = 25)

# Display the result
print(kmeans_result)

# Add cluster assignments to the dataset
data$cluster <- as.factor(kmeans_result$cluster)

# Visualize clusters using base R
plot(data$x, data$y, col = data$cluster, pch = 19,
     xlab = "X", ylab = "Y", main = "K-Means Clustering")
points(kmeans_result$centers, col = 1:2, pch = 8, cex = 2) # Cluster centers

# Elbow method to determine optimal clusters
wss <- numeric(10) # Within-cluster sum of squares
for (k in 1:10) {
  kmeans_result <- kmeans(data[, 1:2], centers = k, nstart = 25)
  wss[k] <- kmeans_result$tot.withinss
}

# Plot the Elbow graph
plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Number of Clusters K", ylab = "Total Within-Cluster Sum of Squares",
     main = "Elbow Method for Optimal K")

# Perform clustering with the optimal number of clusters (e.g., k = 3)
kmeans_optimal <- kmeans(data[, 1:2], centers = 3, nstart = 25)

# Visualize optimal clustering using base R
plot(data$x, data$y, col = kmeans_optimal$cluster, pch = 19,
     xlab = "X", ylab = "Y", main = "Optimal K-Means Clustering (k=3)")
points(kmeans_optimal$centers, col = 1:3, pch = 8, cex = 2)
