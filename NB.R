# Load necessary library
#install.packages("e1071") # Install e1071 package if not already installed
library(e1071) # Load the Naive Bayes algorithm

# Sample dataset: Iris dataset
data(iris) # Load the iris dataset

# Explore the dataset
str(iris) # Check the structure of the dataset
head(iris) # Display the first few rows

# Split the dataset into training and testing sets
set.seed(123) # Set seed for reproducibility
trainIndex <- sample(1:nrow(iris), 0.7 * nrow(iris)) # Randomly select 70% for training

trainData <- iris[trainIndex, ] # 70% data for training
testData <- iris[-trainIndex, ]  # 30% data for testing

# Implement Naive Bayes classifier
nb_model <- naiveBayes(Species ~ ., data = trainData) # Model with Species as the target variable

# View the model
nb_model

# Make predictions on the test set
predictions <- predict(nb_model, testData)

# Confusion Matrix to evaluate model performance
confusionMatrix <- table(Predicted = predictions, Actual = testData$Species)
print(confusionMatrix)

# Accuracy of the model
accuracy <- sum(predictions == testData$Species) / length(predictions)
print(paste("Accuracy: ", round(accuracy * 100, 2), "%"))

# Visualizing the decision boundaries (optional)
# You can use a plot if needed to visualize classification results
