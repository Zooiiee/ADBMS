# Install and load the necessary packages
install.packages("cluster")    # For clustering functions
install.packages("factoextra") # For visualizations

library(cluster)
library(factoextra)

# Step 1: Generate synthetic dataset
set.seed(123) # For reproducibility

# Create two distinct groups with normal distribution
x <- c(rnorm(50, mean = 5, sd = 1), rnorm(50, mean = 8, sd = 1))  # x values
y <- c(rnorm(50, mean = 5, sd = 1), rnorm(50, mean = 8, sd = 1))  # y values

# Combine the x and y values into a data frame
data <- data.frame(x, y)

# Step 2: Visualize the dataset using a scatter plot
# Initial scatter plot to view the distribution of the data points
plot(data, main = "Scatter Plot of the Dataset", pch = 19, col = "blue")

# Step 3: Compute the distance matrix
# We calculate the Euclidean distance matrix between the points
dist_matrix <- dist(data)

# Step 4: Perform Agglomerative Clustering using Complete Linkage
# Complete linkage is used to merge clusters based on the maximum distance between them
hc_complete <- hclust(dist_matrix, method = "complete")

# Plot the dendrogram to visualize the clustering process
plot(hc_complete, main = "Dendrogram (Complete Linkage)",
     xlab = "Points", ylab = "Height", sub = "")

# Step 5: Cut the dendrogram into 2 clusters
# We specify k = 2 to cut the dendrogram into 2 clusters
clusters <- cutree(hc_complete, k = 2)

# Step 6: Add the cluster assignments to the dataset
data$cluster <- as.factor(clusters)

# Visualize the clustering results
# Create a scatter plot colored by cluster assignments
plot(data$x, data$y, col = data$cluster, pch = 19,
     xlab = "X", ylab = "Y", main = "Agglomerative Clustering (k=2)")

# Step 7: Perform Agglomerative Clustering using Average Linkage
# Average linkage merges clusters based on the average distance between them
hc_average <- hclust(dist_matrix, method = "average")

# Plot the dendrogram for the average linkage method
plot(hc_average, main = "Dendrogram (Average Linkage)",
     xlab = "Points", ylab = "Height", sub = "")

# Step 8: Cut the dendrogram into 3 clusters
# This time we cut the tree into 3 clusters
clusters_3 <- cutree(hc_average, k = 3)

# Step 9: Visualize the clustering results with 3 clusters
# Create a scatter plot colored by the 3 cluster assignments
plot(data$x, data$y, col = clusters_3, pch = 19,
     xlab = "X", ylab = "Y", main = "Agglomerative Clustering (k=3)")
