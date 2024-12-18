Matrix.R Script

#Creating a Matrix
m <- matrix(c(11,12,13,14,15,16,17,18,19),nrow = 3, ncol = 3)
m

#Display the Dimesntion of matrix m
dim(m)

#Creating a Matrix Row wise
m <- matrix(c(11,12,13,14,15,16,17,18,19),nrow = 3, ncol = 3,byrow = TRUE)
m

#Using cbind() and rbind()
x <- c(1,2,3)
u <- c(11,12,13)

#Binding into a Matrix Column Wise
cbind(x,u)

#Binding into a Matrix Row wise
rbind(x,u)

#MATRIX OPERATIONS

#1. Scalar Multiplication
m <- matrix(c(11,12,13,14,15,16,17,18,19),nrow = 3, ncol = 3)
p <- 3*m
p

#2. Addtion of 2 Matrices
m <- matrix(c(11,12,13,14,15,16,17,18,19),nrow = 3, ncol = 3)
n <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3, ncol = 3)
q <- m+n
q

#3. Matrix Multiplication
r <- m %*% n
r

#4. Transpose of Matrix
TransposeM <- t(m)
TransposeM

#5. Determinant of Matrix s
s <- matrix(c(4,16,8,12,24,20,24,28,32),nrow = 3, ncol = 3)
s_det <- det(s)
s_det


