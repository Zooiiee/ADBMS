
x <- c(61,4,21,67,89,2)
cat('Vector using c Function : \n',x)

y <- seq(1,10,2)
cat('Vector using seq Function :\n',y)

z <- 2:7
cat('Vector using (:)\n',z)

x <- c(1,2,3,4,5)
length(x)
typeof(x)

y <- c('Apple', 'Banana', 'Cherry')
length(y)
typeof(y)

z <- c(TRUE,FALSE,TRUE,TRUE)
length(z)
typeof(z)

cat("Accessing Elements Using Subscript Operator\n",x[2])

y <- c(4,12,45,23,67,22,3)
cat("Using Combine Function\n",y[c(1,4)])

#assigning value 
y[4]<-90
y

y<-NULL
y

#Sorting
#ascending
x <- c(4,12,45,23,67,22,3)
p<- sort(x)
print(p)

#descending
d <- sort(x,decreasing = TRUE)
print(d)
