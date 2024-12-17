# Creating the Data Frame 

# Data Frame with marks in two subjects
marks_data <- data.frame(
  subject1 = c(85, 78, 90, 88, 76, 65, 94, 70, 82, 89),  # Marks in Subject 1
  subject2 = c(80, 75, 88, 85, 70, 60, 90, 68, 78, 84)   # Marks in Subject 2
)

# View the data
print("Marks Data:")
print(marks_data)

# Linear Regression

# Linear Regression: Predict 'subject2' marks using 'subject1' marks
linear_model <- lm(subject2 ~ subject1, data = marks_data)

# Summary of the Regression Model
print("Summary of Linear Regression:")
summary(linear_model)

# Plotting the Regression Line 

# Scatter plot with Regression Line
plot(marks_data$subject1, marks_data$subject2,
     xlab = "Marks in Subject 1",
     ylab = "Marks in Subject 2",
     main = "Linear Regression: Subject 1 vs Subject 2",
     col = "blue", pch = 19)

# Add Regression Line to the Plot
abline(linear_model, col = "red", lwd = 2)

# Adding legend for clarity
legend("topleft", legend = "Regression Line", col = "red", lwd = 2)
