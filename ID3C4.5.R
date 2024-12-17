# Install necessary packages if not already installed
#install.packages("C50") 
library(C50)  # For decision tree algorithms (C4.5)

# Load the Iris dataset
data(iris)

set.seed(123)  # Set seed for reproducibility

# Create a partition for training (70%) and testing (30%) the data
trainIndex <- sample(1:nrow(iris), 0.7 * nrow(iris))
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Train the C4.5 model (using the C50 package)
c4_model <- C5.0(Species ~ ., data = trainData)

# View the model summary
summary(c4_model)

# Train the C4.5 model (using the C50 package)
c4_model <- C5.0(Species ~ ., data = trainData)

# View the model summary
summary(c4_model)

# Make predictions on the test set
predictions <- predict(c4_model, testData)

# Confusion matrix to evaluate performance
confusionMatrix <- table(Predicted = predictions, Actual = testData$Species)
print(confusionMatrix)

# Calculate accuracy
accuracy <- sum(predictions == testData$Species) / length(predictions)
print(paste("Accuracy: ", round(accuracy * 100, 2), "%"))

# Plot the decision tree
plot(c4_model)

