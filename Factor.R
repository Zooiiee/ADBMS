#Creating a Vector
x <- c("female","male","male","female")
print(x)

#Converting vector x to a factor named gender
gender <- factor(x)
print(gender)

#Creating a factor with levels defined explicitly
gender <- factor(c("female","male","male","female"),
                 levels = c("female","male","transgender"))
print(gender)

#Checking for a factor in R
gender <- factor(c("female","male","male","female"))
print(is.factor(gender))

#Accessing elements of a Factor in R
gender <- factor(c("female","male","male","female"))
#accessing the 3rd element
gender[3]

#Accessing more than one elements of a Factor at a time in R
gender <- factor(c("female","male","male","female"))
#Accessing the 3rd and 4th element
gender[c(2,4)]

#Subtracting One element at a time
gender <- factor(c("female","male","male","female"))
#Subtracting the 3rd element
gender[-3]

#Modification of a Factor in R
gender <- factor(c("female","male","male","female"))
#Changing element 2 from male to female
gender[2] <- "female"
gender
