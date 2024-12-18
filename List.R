myList <- list(name="Zoya", age=20, city="Mumbai")
print(myList)

empId=c(1,2,3,4)
empName=c("abc","pqr","hij","xyz")
numberofEmp=4

empList1 = list("ID"=empId, "Name"=empName,"TotalEmp"=numberofEmp)
print(empList1)

#Accessing the names
print(empList1$Name)

#Accessing the name of the 2nd record
print(empList1$Name[2])

#Accessing the 3rd Record ie numberofEmp
print(empList1[3][1])

#Modify the element of the list
empList1$'TotalEmp' = 5
#Adding a new Record into the existing List
empList1[[1]][5] = 5
empList1[[2]][5] = "Zoya"
print(empList1)

#Modify the employee name at FIRST position
empList1[[2]][1] = "Ram"

#Print employee names
empList1$Name

#Concat Two Lists
list1 <- list(name="Zoya", age=20, city="Mumbai")
list2 <- list(name="Srushti", age=21, city="Mumbai")

newList <- c(list1,list2)
print(newList)
