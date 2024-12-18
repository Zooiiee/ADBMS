
#R program to create DataFrames

#Creating a DataFrame
friend.data <- data.frame(
  f_id = c(1:5),
  f_name = c("Priya","Iffah","Anita","Mansvi","Srushti"),
  stringsAsFactors = FALSE
)

#Print the dataFrame
print(friend.data)

#R Program to get the structure of the DataFrame using str()
print(str(friend.data))

#R Program to get the summary of the dataFrame using summary()
print(summary(friend.data))

#R Program to extract data from the dataFrame
#Extracting f_name column
result <- data.frame(friend.data$f_name)
print(result)

#R Program to expand the DataFrame
#Adding Loaction Column
friend.data$location <- c("Kolkata","Hydrabad","Delhi","Banglore","Chennai")
resultSet <- friend.data
print(resultSet)

#Access Items using []
friend.data[1]

#Access Items using [[]]
friend.data[['f_name']]

#Access Items using $
friend.data$f_id

#Get the no. of Rows and Columns
dim(friend.data)

#Add rows and Columns in a R DataFrame

#Creating a DataFrame representing products in a store
Product <- data.frame(
  p_id = c(101,102,103),
  p_name = c("T-Shirt","Shirt","Shoes"),
  Price = c(15.99,29.99,20),
  Stock = c(50,34,25)
)

#Print the dataframe
cat("Existing DataFrame Products : \n")
print(Product)

#Adding a new row for a new Product
new_product <- c(104,"Sunglasses",39.99,40)
Product <- rbind(Product, new_product)

#Print the updated dataFrame
cat("\nUpdated Dataframe after adding new row : \n")
print(Product)

#Adding a new column for 'Discount' to the DstaFrame
Discount <- c(5,10,20,15)
Product <- cbind(Product,Discount)

#Print the updated dataFrame
cat("\nUpdated Dataframe after adding new column : \n")
print(Product)

#Rename the added column
#to Update the Last Column name
colnames(Product)[ncol(Product)] <- "Sale"

#Print the updated dataFrame
cat("\nUpdated Dataframe after changing Column name: \n")
print(Product)




CODE: DataFrames

Combining_DataFrames.R  Script

#Combining DataFrames in R

#Creating 2 Sample DataFrames
#df1
df1 <- data.frame(
  name = c("Alice", "Bob"),
  age = c(25,27),
  score = c(80,75)
)
#df2
df2 <- data.frame(
  name = c("Charlie", "David"),
  age = c(28,35),
  score = c(90,85)
)

#Print the existing data Frames
cat("\nDataFrame 1 : \n")
print(df1)
cat("\nDataFrame 2 : \n")
print(df2)
#Combining the DataFrames using rbind()
combined_df <- rbind(df1, df2)

#Print the Comnined DataFrame
cat("\nCombined Dataframe : \n")
print(combined_df)

#Combining the DataFrames using Cbind()
combined_df <- cbind(df1, df2)

#Print the Comnined DataFrame
cat("\nCombined Dataframe : \n")
print(combined_df)



CODE: DataFrames

RemovingData_DataFrames.R  Script

#Add Libraray 
library(dplyr)

#Creating a DataFrame
data <- data.frame(
  f_id = c(1:5),
  f_name = c("Priya","Iffah","Anita","Mansvi","Srushti"),
  location =  c("Kolkata","Hydrabad","Delhi","Banglore","Chennai"))
#Print the DataFrame
data
#Remove a Row with F_id = 3
data <- subset(data,f_id != 3)
#Print the Updated DataFrame after removing f_id=3
Data

#Remove the 'location' column
data <- select(data, -location)
#Print the Updated DataFrame after removing 'location' column
data





#CODE: ReadXL & WriteXL

#ReadWriteLibrary.R  Script

#Add Libraries and Install Packages
install.packages("XLConnect")
library(XLConnect)
install.packages("readxl")
library(readxl)
install.packages("writexl")
library(writexl)

#Reading and Writing data From csv
dataT <- read.table("mydata.csv", sep=",", header=TRUE, fill=TRUE)

#Print the csv file data
dataT

#Get the Dimensions 
dim(dataT)

#Load just few lines at the top or bottom 
#head
head(dataT,2)
#tail
tail(dataT,2)

#Subsetting
#Print rows fro 1 to 2 and all Columns
dataY <- dataT[1:2,]
dataY

#Create a csv file
z <- data.frame(a=5, b=10, c=pi)
write.csv(z,file="data.csv")



