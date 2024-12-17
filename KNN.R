# Load necessary libraries
install.packages("caret")
library(class)      # For KNN algorithm
library(datasets)   # For the Iris dataset
library(caret)      # For model evaluation

# Load the Iris dataset
data(iris)

# Split the dataset into training and testing sets (80% train, 20% test)
set.seed(42)  # Set a seed for reproducibility
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]  # Training set
testData <- iris[-trainIndex, ]  # Testing set

# Separate the feature variables and target variable ('Species') for both train and test sets
trainX <- trainData[, -5]  # Exclude the target variable 'Species' (columns 1 to 4)
trainY <- trainData$Species # Target variable for training
testX <- testData[, -5]    # Exclude the target variable 'Species' (columns 1 to 4)
testY <- testData$Species  # Target variable for testing

# Train the KNN model with k=3 (number of nearest neighbors)
k <- 3
knn_model <- knn(train = trainX, test = testX, cl = trainY, k = k)

# Evaluate the model using a confusion matrix
confMatrix <- confusionMatrix(knn_model, testY)
print(confMatrix)  # Print confusion matrix for model evaluation

# Calculate the accuracy of the model
accuracy <- sum(knn_model == testY) / length(testY)  # Correct predictions / total predictions
cat("Accuracy:", accuracy * 100, "%\n")  # Print accuracy as a percentage

# Visualize the KNN classification results (using first two features: Sepal.Length and Sepal.Width)
plot(testX[, 1], testX[, 2], col = as.factor(knn_model), pch = 19, 
     xlab = "Sepal Length", ylab = "Sepal Width", 
     main = "KNN Classification: Sepal Length vs Sepal Width")

# Add a legend to the plot for class labels
legend("topright", legend = levels(testY), fill = 1:length(levels(testY)))
