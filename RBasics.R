
#1.	Install package
install.packages("ggplot2")

#2. Loading Packages
library(ggplot2)

#3. Data Types and Checking Variable Types
x <- 10
class(x)       # Check class
typeof(x)      # Check Type
is.numeric(x)  # Check if numeric

myString <- "Hello World!!!"
class(myString)       # Check class
is.character(myString)  # Check if character

bool <- TRUE
class(bool)       # Check class
is.logical(bool)  # Check if logical

#as.Integer
x ='1'
as.integer(x)

#4. Printing Variables and Objects
#Basic Printing:
x <- "Hello, R!"
print(x)
x  # Directly displays the variable

#5. cbind-ing and rbind-ing

#cbind (Column Binding): Combine objects as columns.
a <- c(1, 2, 3)
b <- c(4, 5, 6)
cbind(a, b)

#rbind (Row Binding): Combine objects as rows.
x <- c(1, 2)
y <- c(3, 4)
rbind(x, y)

#Common Objects in R:

#Vector:
v <- c(1, 2, 3, 4)
print(v)

#Matrix:
m <- matrix(1:6, nrow=2, ncol=3)
print(m)

#List:
my_list <- list(name="Alice", age=25, scores=c(85, 90, 95))
print(my_list)

#Factor:
f <- factor(c("low", "high", "medium", "low"))
print(f)

#Data Frame:
df <- data.frame(Name=c("Tom", "Jerry"), Age=c(20, 22))
print(df)

#Table:
table_data <- table(df$Age)
print(table_data)

#6. Reading and Writing Data

#Reading CSV file:
data <- read.csv("Clg.csv")
print(data)
#Get the Dimensions 
dim(data)
#Load just few lines at the top or bottom 
#head
head(data,2)
#tail
tail(data,2)

#Writing CSV file:
write.csv(data, "Blank.csv")


#7. Basic Functions: setwd(), getwd(), data(), rm()

#Set working directory:
setwd("D:/MET MCA/SEM-1 MCA/ADVANCED DATABASE MANAGEMENT SYSTEMS/LAB")

#Get current working directory:
getwd()

#Display directory content
dir()

#Load built-in datasets:
data()
data("mtcars")
print(mtcars)

#Remove objects:
rm(x)   # Remove variable 'x'
rm(list=ls())  # Remove all variables

#list all available packages
library()
library(tools)


#8. Attaching and Detaching Data

#Attach makes the columns of a data frame directly accessible.
attach(mtcars)
print(mpg)  # Access mpg directly
detach(mtcars)

#9. Reading Data from the Console

#Use readline() to take input:
user_input <- readline(prompt="Enter your name: ")
print(paste("Hello,", user_input))

#10. Loading Data from Different Data Sources

#From CSV file:
data_csv <- read.csv("data.csv")

#From Excel file (using readxl package):
install.packages("readxl")
library(readxl)
data_excel <- read_excel("data.xlsx", sheet=1)
print(data_excel)
