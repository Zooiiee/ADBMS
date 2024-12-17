#Data Preprocessing Techniques in R

#1. Naming and Renaming Variables

#Naming Variables (in a Data Frame):
#Use the names() function to assign or view column names.
# Example Data Frame
df <- data.frame(V1 = c(1, 2), V2 = c(3, 4))
print(df)

# Rename column names
names(df) <- c("Column1", "Column2")
print(df)

#Renaming Specific Variables:
#Use the dplyr package for renaming specific columns.
install.packages("dplyr")
library(dplyr)
df <- rename(df, NewName1 = Column1, NewName2 = Column2)
print(df)


#2. Adding a New Variable

#Add a new column to an existing Data Frame:
df$NewColumn <- df$Column1 + df$Column2
print(df)

#Add a calculated variable:
df$Average <- (df$Column1 + df$Column2) / 2
print(df)


#3. Dealing with Missing Data

#3.1 Identify Missing Data:
#Use is.na() to check for missing values.
data <- c(1, 2, NA, 4, 5)
print(is.na(data))  # TRUE indicates missing values

#3.2 Handling Missing Data:
#A)Remove Missing Values:
clean_data <- na.omit(data)
print(clean_data)

#B)Replace Missing Values:
#Replace NA with the mean or a specific value.
data[is.na(data)] <- mean(data, na.rm = TRUE)
print(data)

#In Data Frames:
df <- data.frame(A = c(1, NA, 3), B = c(4, 5, NA))
print(df)

# Replace NA with 0
df[is.na(df)] <- 0
print(df)


#4. Dealing with Categorical Data

#a)Convert Categorical Data into Factors:
df$Category <- c("Low", "Medium", "High", "Low","High")
df$Category <- as.factor(df$Category)
print(df$Category)

#b)Recode Factor Levels:
#Use levels() to rename levels of a factor.
levels(df$Category) <- c("L", "M", "H")
print(df$Category)

#Create Dummy Variables:
install.packages("fastDummies")
library(fastDummies)
df <- dummy_cols(df, select_columns = "Category")
print(df)

#5. Data Reduction Using Subsetting

#a)Select Specific Rows and Columns:
df <- data.frame(A = 1:5, B = 6:10, C = 11:15)
print(df)
# Subset rows where A > 2
subset_df <- subset(df, A > 2)
print(subset_df)
# Select specific columns
reduced_df <- df[, c("A", "C")]
print(reduced_df)

#b) Use dplyr for Subsetting:
filtered_df <- df %>% select(A, B) %>% filter(A > 2)
print(filtered_df)



#Final Example: Full Preprocessing Workflow
# Load necessary library
library(dplyr)

# Sample Data
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, NA, 30, 35),
  Salary = c(50000, 60000, 70000, NA),
  Department = c("HR", "Finance", "HR", "IT")
)

print("Original Data:")
print(df)

# 1. Handling Missing Data
# Replace missing Age with mean
df$Age[is.na(df$Age)] <- mean(df$Age, na.rm = TRUE)
# Remove rows with missing Salary
df <- na.omit(df)

# 2. Rename Columns
df <- rename(df, Employee_Name = Name, Department_Name = Department)

# 3. Add a New Variable
df$Annual_Salary <- df$Salary * 12

# 4. Handle Categorical Data
# Convert Department_Name to a factor
df$Department_Name <- as.factor(df$Department_Name)

# Recode Factor Levels
levels(df$Department_Name) <- c("Human Resources", "Finance Team", "IT Department")

# 5. Subset Data
# Select specific columns: Employee_Name, Age, Annual_Salary, and Department_Name
final_df <- df %>% select(Employee_Name, Age, Annual_Salary, Department_Name)

print("Processed Data:")
print(final_df)
