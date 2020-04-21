#####################################################################
#####       BASIC R OPERATIONS      #####
x <- 1:5 # Assigns values to x from 1 to 5
x
x+5 # Do vector addition(operation) on each elements of x

x <- c(1,2,6) # c function is used to concatenate the given values
x

y <- c(x, x, 8) # Duplicates x two times 
y

y[2:5] # Indexing in range from 2 to 5
x
mean(x) # To find mean of x
y
sd(y) # To find standard deviation of y

# INTRODUCTION TO FUNCTIONS 

# function() is a function which creates another function
g <- function(x) {
  return (x+1)
}
g(3)

formals(g) # It returns arguments of function
body(g) # It returns the body of function

f1 <- function(a, b) return(a+b) # Inline function to add two numbers
f2 <- function(a, b) return(a-b) # Inline function to subtract two numbers 

f <- f1
f(3, 2)

f <- f2
f(3, 2)

g <- function(h, a, b) h(a, b) # This function takes function as argument and argument of that function as argumnet too
g(f1, 3, 2)
g(f2, 3, 2)

# Looping over function
g1 <- function(x) return(sin(x))
g2 <- function(x) return(sqrt(x^2+1))
g3 <- function(x) return(2*x -1)
plot(c(0,1), c(-1,1.5))
for (f in c(g1, g2, g3)) plot(f, 0, 1, add=TRUE)

# How to change body of function using quote()
g <- function(x) return(x+10)
g
g(3)
body(g) <- quote(return(2*x + 3))
g
g(3)

# Counts number of odd integers in x
odd <- function(x) {
  count <- 0
  for (i in x) {
    if (i %% 2 == 1) count <- count + 1
  }
  return (count)
}
odd(c(1,3,5))
odd(c(1,2,3,7,9))

# NOTE
# A variable only within the function body is said to be local to that function. Example :- count in function odd above.
# Variables created outside function are global and are available within the function too. Example :- y in function f below.
# A global variable can be written to from within a function by using R's superassignment operator "<<-".
f <- function(x) return(x+y)
y <- 3
f(5)

# DEFAULT ARGUMENTS IN FUNCTION
f <- function(x, y = 10) {
  return(x + y)
}
f(10) # No need to pass since there is a defualt value for y
f(10, 20) # y gets assigned to new value

# NOTE : 
# R allows TRUE and FALSE to be abbreviated to T and F. However, you may choose not to abbreviate these values to avoid trouble if you have a variable named T or F.

# SOME IMPORTANT DATA STRUCTURED OF R

# 1) VECTORS : Vector is heart of R, everything in R is related to vectos. The elements of vectors must have same mode, or data type.
# Scalars do not exist in R, 8 is also a vector in R.
# Character Strings : Character strings are actually single-element vectors of mode character, (rather than mode numeric).
x <- c(5, 12, 13)
x
length(x)
mode(x)

y <- "abc"
y
length(y)
mode(y)

z <- c("abc", "29 88")
z
length(z)
mode(z)

# STRING FUNCTION IN R
u <- paste("abc", "de", "f") # concatenate the string
u
strsplit(u, " ") # Split the string u according to blanks

# 2) MATRICES : Matrix is a vector, with two additional attributes number of rows and columns.
# 3) LISTS
# 4) DATA FRAMES
# 5) CLASSES

# GETTING HELP IN R
help(seq)
?seq # Another method to get help
example(seq) # Gives few example of how the given function works
help.search("to create a sequence") # This works like a google search box in R
#################################################################################

#####       VECTORS       #####
# The most fundamental data type in R.
# In R individual numbers do not have seperate data types like in other languages, they all are special cases of vectors.
# Vectors must have the same mode, which can be integer, numeric, character, logical, complex and so on.
# Indexing of vectors starts with 1 in R

# ADDING DELETING ELEMENTS IN VECTOR
# The size of vectors remain same, we need to reassign it again to change it's size.

y <- c(2, 5, 9, 19, 34)
y
y <- c(y[1:4], 99, y[5]) # Inserts 99 before 34
y

length(y) # Gives the length of vector i.e the number of elements present in it.

# DECLARATION IN R
# Like other programming langauge we need not to declare variables
z <- 3 # Simply assignment works as a declartion.
# However if we wan't to assign value to not-initialized value it won't work. We must warn R. Example :-
y <- vector(length = 2)
y[1] <- 5
y[2] <- 12
m[1] <- 4 # Object not found

# RECYCLING
# When applying an operation to two vectors that requires them to be the same length, R automatically recycles, or repeats, the shorter one, until it is long enough to match the longer one.
c(1, 2, 4) + c(6, 0, 9, 20, 22)
# The operation was taken as c(1, 2, 4, 1, 2) + c(6, 0, 9, 20, 22)

x <- matrix(1:6, nrow = 3)
x
x+c(1,2) # Here c(1, 2) gets recycled as c(1, 2, 1, 2, 1, 2) and then converted to matrix column-major wise. So it becomes, 
# 1 2 
# 2 1
# 1 2

# ARITHMETIC AND LOGICAL OPERATIONS

# In R, every operator is a function even + operator.
# "+"()
2+3
"+"(2,3)

# Operations are performed element-wise in R vector if element is shorter it gets recycled
x <- c(1, 2, 4)
y <- c(5, 2, -1)
x + y
x * y
x / y
x %% y

# VECTOR INDEXING
y <- c(1.2, 3.9, 0.4, 0.12)
y[c(1,3)] # Extracts 1st and 3rd element of vector
y[2:3] # Slicing elements from 2 to 3
v <- 3:4
y[v]

# NOTE : Duplicates are allowed.

# Negative subscripts means we want to exclude given elements in our output.
# If we reassign output it works like element is deleted.
z <- c(5, 12, 13, 54)
z[-1] # Exclude 1st value of vector
z[-1:-3] # Excludes values in given range

# EXAMPLES OF : OPERATOR
5:8
5:1 # Backside vectorization also possible

# GENERATING VECTORS SEQUENCES WITH seq()
seq(from = 12, to = 30, by = 3) # Sepecifies seperation between 2 elements
seq(from = 1.1, to = 2, length = 10) # Specifies total number of elements in range

# How sequence better than length in loop
x <- c(5, 12, 13)
x
seq(x) # Gives indexes
length(x) # Gives total element
x <- NULL
x
seq(x) 
length(x) # Gives 0
# In case of for in range i:lenght(x) if x is null it gets evaluted to 1 0 which should not happen.
1:length(x)

# REPEATING VECTOR CONSTANTS WITH rep()
x <- rep(8, 4) # Repeats 8 four times
x
rep(c(5, 12, 14), 3)
rep(c(5, 12 ,23), each = 2) # Repeat each values two times

# USING all() AND any()
# They report whether any or all of their arguments are TRUE
x <- 1:10
any(x > 8)
any(x > 88)
all(x > 88)
all(x > 0)

###  VECTORIZED OPERATIONS ###

# Vector In, Vector Out
u <- c(5,2,8)
v <- c(1,3,9)
u > v # Compares each element in vector element wise

sqrt(1:9) # Examples of vectorized function

y <- c(1.2,3.9,0.4)
y
round(y) # Function to round off values to nearest integer

# In above all example, vector is given as input to a function and a vector is returned from the function

# Vector in, Matrix out
z <- function(x) return(c(x, x^2)) # It returns a vector
sapply(1:8, z) # sapply() known as simply apply applies the fucntionz to each element of x and then converts the result to a matrix.

# NA AND NULL VALUES
# NA -> Missing Value
# NULL -> Value doesn't exist

# Using NA
x <- c(88, NA, 12, 168, 13)
x
mean(x)
mean(x, na.rm=TRUE) # To find mean of remaining values after removing NA

# NOTE : There are multiple NA values one for each mode
x <- c(5, NA, 12)
mode(x[1])
mode(x[2])
y <- c("A", "c", "cv", NA)
mode(y[4])
mode(y[1])

# Using NULL
x <- c(88, NULL, 12, 168, 13)
mean(x) # NULL Simply doesn't exist

# Characteristics of NA
y <- NA
length(y)
mode(y)

# Characteristics of NULL
z <- NULL
length(z)
mode(z)
# NULL is a special object in R with no mode

# How NULL works in concatenating elements to vector in loop
z <- NULL
for(i in 1:10) if(i %% 2 == 0) z<-c(z,i)
z

# How NA works in concatenating elements to vector in loop
z <- NA
for(i in 1:10) if(i %% 2 == 0) z<-c(z,i)
z

# FILTERING

z <- c(5,2,-3,8)
z
w <- z[z*z > 8] # Assigns values only where condition z*z is true
w

# Using boolean vector from one vector to filter elements from another vector
z <- c(5,2,-3,8)
j <- z*z > 8
y <- c(1,2,30,5)
y[j]

# Example of assignment using filtering
x <- c(1,3,8,2,20)
x
x[x>3] <- 0 # Assigns 0 to all those elements where condition is TRUE
x

# Filtering with subset() Function :
#  When applied to vectors, the difference between using this function and ordinary filtering lies in the manner in which NA values are handled.
x <- c(6, 1:3, NA, 12)
x
x[x > 5]
subset(x, x > 5) # Using subset saves the trouble of excluding NA values

# The selection function which()
# To find the position at which given condition occured
z <- c(5, 2, -3, 8)
which(z*z > 8) # Return indexes of vector where condition is True

# VECTORIZED ifelse() FUNCTION
# Format : ifelse(condtion, do this if true, do this if false)
x <- 1:10
y <- ifelse (x %% 2 == 0, 5, 12) # Returns 5 if condition is True else return False
y

x <- c(5, 2, 9, 12)
ifelse(x > 6, 2*x, 3*x) # If condition true value becomes twice else thrice

# TESTING VECTOR EQUALITY
x <- 1:3
y <- c(1,3,4)
x == y # vectorized comparision return boolean values for each comparision
all(x == y) # Similar to AND operation of all boolean values
identical(x, y) # Similar to all(x == y)

# Becareful with identical, because it really means what it says. Example :
x <- 1:2
y <- c(1, 2)
x
y
identical(x, y)
typeof(x)
typeof(y)

# VECTOR ELEMENTS NAMES
x <- c(1, 2, 4)
names(x) # To show the names associated with values in vector
names(x) <- c("a", "b", "c") # Assign a specific name to each value in vector 
names(x)
x
x["b"] # Name can be used for indexing

# We can remove names from vector by assigning NULL
names(x) <- NULL
x

################################################################################################

#####       MATRICES AND ARRAYS       #####
# The internal storage of matrix is in column-major order i,e elements are stores column-wise, 1st column is stored 1st then 2nd and so on
# matrix() -> Function to create matrix

y <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
y
y <- matrix(c(1,2,3,4), nrow = 2) # No need of ncol since it is determined automatically
y

# Another method to form matrix is specify elements individually
y <- matrix(nrow = 2, ncol = 2)
y[1,1] <- 1
y[2,1] <- 2
y[1,2] <- 3
y[2,2] <- 4
y

# We can change internal storage of matrix by an argument in matrix() -> byrow argument
m <- matrix(c(1,2,3,4,5,6), nrow = 2, byrow=T) # It enables our input to come in row major form
m

# 2 GENERAL MATRIX OPERATIONS
# 2.1 LINEAR ALGEBRA OPERATIONS
y
y %*% y #Matrix multiplication
3*y #Scalar Matrix Multiplication
y+y #Matrix addition

# 2.2 MATRIX INDEXING 
# Similar to vector except [,] is used before , rows after that columns
z <- matrix(c(1,2,3,4,1,1,0,0,1,0,1,0), nrow = 4)
z
z[,2:3] # Submatrix containing 2nd and 3rd column
z[1:2,] # Extracting 1st two rows in submatrix

# Assigning Values to submatrix
y <- matrix(c(1,2,3,4,5,6), nrow = 3)
y
y[c(1,3), ] <- matrix(c(1,1,8,12), nrow = 2) # New matrix assigned to 2nd and 3rd row of y
y

x <- matrix(nrow=3, ncol=3)
y <- matrix(c(4,5,2,3), nrow=2)
y
x
x[2:3,2:3] <- y
x

# Negative subscript are used to exclude values
y <- matrix(1:6, nrow=3)
y
y[-2,] # 2nd column excluded


# 2.3 FILTERING ON MATRICES
# Same as that of vector
x <- matrix(c(1,2,3,2,3,4), nrow = 3)
x
x[x[,2] >= 3,]
# How above code works
j <- x[, 2] >= 3 # Gives a boolean vector
j
x[j,] # Only those rows where it is true is printed only

# Filtering can also be done on variable that are separate from the one to which filtering will be applied
z <- c(5,12,13)
x[z %% 2 == 1, ]

# Complex example
m <- matrix(1:6, nrow = 3)
m
m[m[,1] > 1 & m[,2] > 5,]

# Since matrix are vector we can apply vector function of them too
m <- matrix(c(5,2,9,-1,10,11), nrow = 3)
m
which(m > 2)

# 3 APPLYING FUNCTION TO MATRIX ROW AND COLUMN
# apply() tapply() lapply() 
# Here we will discuss apply() which instructs R to call a user-specified function on each row or column of matrix

# 3.1 apply() FUNCTION
# General form :- apply(m, dimcode, f, fargs)
# m -> matrix
# dimcode -> dimension, 1 for rows and 2 for columns
# f -> function to be applied
# fargs -> arguments of function f

# Example apply mean column-wise
y
apply(y, 2, mean) #we can use colMeans() function too
colMeans(y)

# Example with self defined-function
y
f <- function(x) x/c(2,8)
z <- apply(y, 1, f) 
z # If the function to be applied returns a vector of k components, then the result of apply() will have k rows
t(z)

# NOTE : If function returns a scalar then it will form a vector not matrix

# Q)  For each row of the matrix, the corresponding element of the vector will be either 1 or 0, depending on whether the majority of the first d elements in that row is 1 or 0. Here, d will be a parameter that we may wish to vary
x <- matrix(c(1,1,1,0,0,1,0,1,1,1,0,1,1,1,1,1,0,0,1,0), nrow = 4)
x
func <- function(r, d) {
  maj <- sum(r[1:d]) / d
  return(ifelse(maj > 0.5, 1, 0))
}
apply(x,1,func,3)
apply(x,1,func,2)

# 4 ADDING OR DELETING MATRIX ROWS AND COLUMNS
# NOTE : Technically, matrices are of fixed length and dimensions, so we cannot add or delete rows or columns. However, matrices can be reassigned, and thus we can achieve the same effect as if we had directly done additions or deletions.

# 3.1 CHANGING SIZE OF MATRIX
# NOTE : Reassignment occurs even when you don’t see it. For instance, even the innocuous-looking assignment x[2] <- 12 is actually a reassignment.
# rbind() and cbind() let us add rows and column to matrix
z <- matrix(c(1,2,3,4,1,1,0,0,1,0,1,0), nrow = 4)
z
one <- c(1,1,1,1)
cbind(one, z)
cbind(z,1) # We can simply use 1 too, 1 gets recycled
rbind(1,z)
rbind(z,1)

# We can also use cbind and rbind to create small matrix
cbind(c(1,2), c(3,4))

# We can delete rows and columns by reassignment too
m <- matrix(1:6, nrow = 3)
m <- m[c(1,3),]
m

# SOME BASICS OF MATRIX
dim(x) # Gives dimensions of x
nrow(x) # Gives rows of x
ncol(x) # Gives columns of x
length(x) # Gives total number of elements

# DIMENSTION REDUCTION
x <- matrix(1:6, nrow = 3)
x
y <- x[2,]
attributes(x) # This is a matric
attributes(y) # This is not a submatrix but a vector
# To keep y in matrix form add
y <- x[2,,drop=FALSE]
attributes(y) # Now it's a matrix

# TO CHANGE VECTOR TO MATRIX
# use as.matrix() function
i <- c(1,2,3)
attributes(i)
j <- as.matrix(i)
j
attributes(j)


# NAMING ROWS AND COLUMNS OF MATRIX
z <- matrix(1:4, nrow=2)
z
colnames(z)
colnames(z) <- c("a", "b") # Assingns names
z
z[,"a"]
rownames(z) <- c("x", "y")
z

# HIGHER-DIMENSIONAL ARRAYS
# In a statistical context, a typical matrix in R has rows corresponding to observations, say on various people, and columns corresponding to variables, such as weight and blood pressure. The matrix is then a two-dimensional data structure. But suppose we also have data taken at different times, one data point per person per variable per time. Time then becomes the third dimension, in addition to rows and columns. In R, such data sets are c

# Example 3 students marks in 2 subject in two test
firsttest <- matrix(c(46,21,50,30,25,50), nrow = 3)
firsttest
secondtest <- matrix(c(46,41,50,43,35,50), nrow = 3)
secondtest
tests <- array(data=c(firsttest, secondtest), dim=c(3,2,2))
tests
# In the argument dim=c(3,2,2), we are specifying two layers (this is the second 2), each consisting of three rows and two columns.
tests[3,2,1]

############################################################################################################

#####       LIST        #####
# In contrast to a vector, in which all elements must be of the same mode, R's list structure can combine objects of different types.
# Vectors which we used so far were ordinary vector also known as atomic vector(components cannot be broken), while list is a recursive vector.

j <- list(name="Joe", salary = 55000, union=T)
j
# Components also known as tags name are optional while creating list
jalt <- list(name="Joe", 55000, T)
jalt

# NOTE : List can be created via vector too
z <- vector(mode="list")
z[["abc"]] <- 3
z

# LIST INDEXING
# All three results the same
j$salary
j[["salary"]]
j[[2]]

# If single bracket is used it creates a sublist of that element
j[1:2]
j2 <- j[2]
j2 # This is a list
class(j2)
str(j2)

# Single brackets gives type of that component
j[[1:2]] # Error because it only used for referening single element with that element type
j3 <- j[[2]]
j3
class(j3)


# ADDING AND DELETING ELEMENTS IN LIST

# New component can be added after list is created
z <- list(a="Abc", b = 12)
z
z$c <- "Sailing" # Adds this to list z
z
# We can add component via vector index too
z[[4]] <- 25
z
z[5:7] <- c(F,T,T)
z

# Note : We can delete component by assigning NULL to it
z$b <- NULL
z # Index moved up by 1 by deleting element "b"

# WE CAN ADD TWO LIST using c() concatenate function
c(list("Joe", 33), list(5))

# SIZE OF LIST
length(j)

# ACCESSING LIST COMPONENTS AND VALUES
names(j) # Gives tag name of the list
names(z) # Elements not having tag name shows ""

# To obtain the values use unlist()
ulj <- unlist(j)
ulj
class(ulj) # Character vector obtained

z <- list(a=5, b=12, c=13)
y <- unlist(z)
y
class(y) # Numeric vector obtained

# In case of mix of number and character we get character
w <- list(a=5, b="xyz")
wu <- unlist(w)
class(wu)
wu

# NOTE : Where possible the list components are coerced to a common mode during the unlisting, and so the result often ends up as a character vector. Vectors will be coerced to the highest type of the components in the hierarchy NULL < raw < logical < integer < real < complex < character < list < expression: pairlists are treated as lists.

# To remove names from the obtained vecor
names(wu) <- NULL
wu
# or we can 
y <- unname(y)
y

# APPLYING FUNCTIONS TO LIST
# Two functions are used lapply() and sapply()
# lapply() known as list apply works like matrix apply(), calling the specified function on each component of a list and returing a another list
x <- list(1:3, 25:29)
x
lapply(x, median)

# To simply list to a vector or matrix, sapply() known as simplified apply us used
sapply(x,median)

# RECURSIVE LIST 
# List within a list
b <- list(u=5, v=12)
c <- list(w=14)
a <- list(b,c)
a
length(a)

x <- c(list(a=1, b=2,c=list(d=5,e=9))) # It gives a recursive list
class(x) # This is a list
x <- c(list(a=1, b=2,c=list(d=5,e=9)), recursive=T) # It gives a non-recursive list, only names look recursive
class(x) # This is a vector

# LIST CLASS QUESTIONS
# Question 1 : To select nested element of a given list
z <- list(c(0,2),c(3,4),c(5,6))
z
# Selecting 3rd element
z[[2]][1]

# Question 2 : From a list containing vector's of string, a 2x3 matrix and a list remove the second element.
z <- list(c(1, 2, 4), matrix(6:11,nrow=2), list("a","b"))
z
z[[2]] <- NULL
z
# Question 3 : Merge two list into one list.
l1 <- list(1,2,3)
l1
l2 <- list(4,5,6)
l2
l <- c(l1,l2)
l
# Question 4 : Convert list into vector
l <- list(1,2,3)
class(l)
v <- unlist(l)
class(v)

# Question 5 : Find all element of a list that are not in another list
l1 <- list(1, 2, 3, 4)
l2 <- list(3, 4, 5, 6)
setdiff(l1, l2)

############################################################################################################################

#####       DATAFRAME       #####

# On an intuitive level, a data frame is like a matrix, with a two-dimensional rows and columns structure. However, it differs from a matrix in that each column may have a different mode. For instance, one column may consist of numbers, and another column might have character strings. In this sense, just as lists are the heterogeneous analogs of vectors in one dimension, data frames are the heterogeneous analogs of matrices for two-dimensional data.

kids <- c("Jack", "Jill")
ages <- c(12, 10)
d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d

# If the named argument stringsAsFactors is not specified, then by default, stringsAsFactors will be TRUE. (You can also use options() to arrange the opposite default.) This means that if we create a data frame from a character vector—in this case, kids—R will convert that vector to a factor. Because our work with character data will typically be with vectors rather than factors, we’ll set stringsAsFactors to FALSE.

# ACCESSING DATA FRAMES
d[[1]]
d$kids

# We can use matrix like fashion too
d[,1]

# MATRIX LIKE OPERATION ON DATAFRAME
# EXTRACTING SUBDATA FRAMES
Exam.1 <- seq(from = 35, to = 70, length = 20)
Exam.2 <- seq(from = 36, to = 40, length = 20)
Exam.3 <- seq(from = 25, to = 100, length = 20)
exam <- data.frame(Exam.1, Exam.2, Exam.3, stringsAsFactors = FALSE)
exam

exam[2:5, ]

exam[2:5, 2] # Returns a vector
class(exam[2:5, 2])

exam[2:5, 2, drop = FALSE] # Keeps it in dataframe form
class(exam[2:5, 2, drop = FALSE])

# Filtering
exam[exam$Exam.1 > 50, ]

# subset() function to save from the trouble of na.rm = T, we can apply this to dataframe for row selection.
exam[exam$Exam.1 > 50, ]
subset(exam, Exam.1 > 50)

# WE CAN USE rbind() and cbind() to add rows and columns to dataframe
# FOR :
# 1) ADDING COLUMN : Length of vector == Number of rows. Function cbind() is used.
# 2) ADDING ROWS : Length of vector == NUmber of column. rbind is used.
d

d <- rbind(d, c("Ritik", 2))
d

marks <- c(45, 2, 100)
d <- cbind(d, marks)
d

# or

d$marks <- marks
d

# APPLYING FUNCTIONS TO DATAFRAME
d1 <- lapply(d, sort)
d <- as.data.frame(d1)
d

# MERGE FUNCTION
name <- c("A", "B", "C", "D")
name1 <- c("A", "B", "C", "D")
ages <- c(10,13,11,12)
marks <- c(67,34,100,80)

data1 <- data.frame(name, ages, stringsAsFactors = F)
data2 <- data.frame(name, marks, stringsAsFactors = F)
data3 <- data.frame(name1, marks, stringsAsFactors = F) # Same as data2 except name of column 1(Values same) is different

data1
data2
data3

merge(data1, data2) # Joins two dataframe on the basis of row having common column name
merge(data1, data3) # Since no column name is there it does cardinal mapping of data (which is not requires since we have value of column 1 same)

# For dataframe having different name for column having same value
merge(data1, data3, by.x = "name", by.y = "name1")

# MODIFYING DATASET FOR JOINT OPERATIONS 
data2 <- data2[-2,]
data2 <- rbind(data2, list(name = "E", marks = 40)) # Adding new column to dataframe2
data1 <- data1[-3,] # Deleting name "C"

data1
data2

# NATURAL JOIN
merge(data1, data2, all = FALSE) # Only column having common value of names in both data set will be selected

# FULL OUTER JOIN (Universal set)
merge(data1, data2, all = TRUE) # Everything from dataframe is added

# LEFT OUTER JOIN
merge(data1, data2, all.x = TRUE) # Only common names and everything of data1 will be selected

# RIGHT OUTER JOIN
merge(data1, data2, all.y = TRUE) # Only common names and everything of data1 will be selected

#######################################################################################################

#####       IRIS DATAFRAME        #####

# INBUILT DATASET
# head() is used to print only 1st 10 data values
head(iris, 10)

# OPERATION WE NEED TO PERFORM ON DATASET :
# -> Missing Values
# -> Whether all the elements of the column are of same datatype
# -> Redundancy checking (duplicate rows)

# INDEXING
iris[1:5,] # 1st 5 rows
head(iris[, c("Sepal.Length", "Sepal.Width")], 10) # To select 1st two columns (returns a dataframe)
iris[,"Sepal.Length"] # To select only one column (returns a vector)

# Q) Extract single column but the return type must be a dataframe
head(iris[,"Sepal.Length", drop = FALSE],10)

# REMOVE DUPLICATED ELEMENT
x <- duplicated(iris) # Gives TRUE where element is duplicated
x

# 1st method
index <- which(x) # Gives index of duplicated element
index
dim(iris)
head(iris[-index], 10)

# 2nd Method
head(iris <- iris[!x, ], 10)
dim(iris)

# ROWS WITH MISSING DATA
complete.cases(iris) # Returns FALSE where NA present
iris <- na.omit((iris))
head(iris, 10)

# ARITMETIC OPERATIONS
x <- iris$Sepal.Length / iris$Sepal.Width # Divides 1st column by 2nd column
x
y <- with(iris, Sepal.Length / Sepal.Width) # Using with we need no $ sign for using columns
y

# ADD NEW COLUMN TO DATAFRAME
iris <- within(iris, ratio <- Sepal.Length / Sepal.Width)
head(iris, 10)

############################################################################################################

#####         state.x77 data        #####
d <- state.x77
str(d)
summary(d) # Gives summariez overview of dataset, minimum value, 1st quartile, median, 3rd quartile, mean, maximum value

# Q) Find subset of cold.state having more than 150 days of frost
cold.state <- d[d[,"Frost"] > 150,"Frost", drop=FALSE]

# Q) Area is greater than or equal to 1lakh
large.state <- d[d[,"Area"] >= 100000,"Area", drop=FALSE]
large.state 

# Q) To find Large State that are also cold states
i <- match(cold.state, large.state)
i

#############################################################################################

#####         dplyr package       #####

# install.packages("dplyr")
library(dplyr)
chicago.x <- chicago
#Arguments to dplyr functions
# 1) Dataframe
# 2) What to do with dataframe specified in the first argument, can refer to the coulmn of data directly without using $ operator
# 3) Return result into a new dataframe

# Functions in dplyr :- 
# 1. select() -> extract columns
# 2. filter() -> extract rows
# 3. arrange() -> sorts the dataframe
# 4. rename() -> change column name
# 5. mutate() -> add new column to dataframe
# 6. group_by() -> groups data together

chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago) # Gives the structure of dataframe

# 1. select() FUNCTION 
# Helps to do the subset of dataframe

# To get 1st 3 column from dataframe
head(chicago[,names(chicago)[1:3]],10) # Base R
subset <- select(chicago, city:dptp)
head(subset,10) # head is used to print top 10 values of dataset only

# Q) TO SELECT EVERYTHING EXCEPT city:dptp (Assuming we don't know column numbers)

# With base R
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[,-(i:j)],10)

# With dplyr
head(select(chicago, -(city:dptp)),10) # We can use name of column directly

# Q) Select the column that ends with "2" or starts with a "d"
subset <- select(chicago, ends_with("2"))
head(subset,10)
subset <- select(chicago, starts_with("d"))
head(subset,10)

# 2. filter() FUNCTION
# Used to extract subset of rows from a dataframe

# Q) Extract where pm25tmean > 2 30 and temperature > 80
# With dplyr
chic.f <- filter(chicago, pm25tmean2>30 & tmpd > 80)
head(chic.f,10)

# With base R"
x <- subset(chicago, pm25tmean2 > 30 & tmpd > 80)
head(x,10)

# 3. arrange() FUNCTION
# Reorders rows of a datadrame according to one of the column or variable

chicago <- arrange(chicago, date) # Arranges in asending order
head(chicago, 4) # Shows only 4 rows
tail(chicago, 4) # Shows last 4 rows

chicago <- arrange(chicago, desc(date)) #Arranges data in descending order
head(chicago, 4)
tail(chicago, 4)

# With base R
head(chicago.x[order(chicago.x$date, decreasing = TRUE),],10)

# 4. rename() FUNCTION
# Using dplyr
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
names(chicago)

# With base R
names(chicago.x)[match("dptp", names(chicago.x))] <- "dewpoint"
names(chicago.x)[match("pm25tmean2", names(chicago.x))] <- "pm25"
names(chicago.x)

# 5. mutate() FUNCTION
# New variables that are derived from existing variables

# With dplyr
chicago <- mutate(chicago, pm25dtrend = pm25-mean(pm25, na.rm = TRUE))
head(chicago,10)

# With base R
chicago.x <- within(chicago.x, pm25dtrend <- pm25-mean(pm25, na.rm = TRUE))
head(chicago.x,10)

# group_by FUNCTION
# Combination of splitting a dataframe into seperate pieces defined by a variable or group of variable and then applying a summary function across those subset
chicago <- mutate(chicago, year = as.POSIXlt.date(date)$year + 1900)
year_new <- group_by(chicago, year)
year_new
summarize(year_new, pm25 = mean(pm25, na.rm =TRUE), o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))

# with base R

####################################################################################

###################################################################################

############## Date ####################

startdate <- as.Date("2019-01-01") # Converts character string to date
startdate

xm <- seq(startdate, by = "2 months", length.out = 6) # Generates sequence of date with interval of 2 months
xm

months(startdate) # Give the month of date
weekdays(startdate) # Gives the name of week

# POSIXct -> time that is internally stored as number of seconds since 1970
# POSIXlt -> named list of vector for years, months, days, hour and minute

apollo <- "July 20, 1969, 20:17:39, UTC"
fmt <- "%B %d, %Y, %H:%M:%S" # Format in which the date is stored
xct <- as.POSIXct(apollo, format = fmt, tz = "UTC")
xct

#################################################################################

#################################################################################### 

####### Exploratory Data Analysis ################

# Why we use exploratory graphs ?
# It is used to understand the data by visualizing it so that we can perform appropiate methods for the filteration and can apply appropiate learning algorithms.
class <- c("numeric", "character", "factor", "numeric", "numeric")
pollution <- read.csv("https://github.com/jtleek/modules/raw/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv", colClasses = class)
str(pollution)

# Summaries method we will be using :-
# Five-number summary
# Boxplots

# Five Number Summary
# The function fivenum() takes vector as input and give summary in 5 aspects i.e minimum number, 1st quartile , median, 3rd quartile and maximum number.
fivenum(pollution$pm25) 
summary(pollution$pm25) # It gives mean too along with the summary from output of fivenum()

# Boxplot
#  Note that in a boxplot, the “whiskers” that stick out above and below the box have a length of 1.5 times the inter-quartile range, or IQR, which is simply the distance from the bottom of the box to the top of the box. Anything beyond the whiskers is marked as an “outlier” and is plotted separately as an individual point.

boxplot(pollution$pm25, col="blue")
# We can see that everything above 15 is an outlier
# To see all the outliers above 15
library("dplyr")
filter(pollution, pm25 > 15)

# Overlaying features :- Useful to lay down annotations on our plot as reference points or markers. Suppose we need horizantal line at 12
boxplot(pollution$pm25, col = "blue")
abline(h = 12) # h is for horizantal

# Multiple boxplots : To show relationship between two variables side by side. 
# Show difference in pm2.5 levels between east and west
boxplot(pm25 ~ region, data = pollution, col = "red")
# boxlplot() function take formula, left side i.e pm25 indication varibale for which we want boxplot and rightside i.e region variable that stratifies the left hand side into categories.

# Scatterplots : For continuous variables, the most common visualization technique is the scatterplot, which simply maps each variable to an x- or y-axis coordinate.
with(pollution, plot(latitude, pm25))
abline(h = 12)

# If we wanted to add a third dimension to the scatterplot above, say the region variable indicating east and west, we could use color to highlight that dimension. Here we color the circles in the plot to indicate east (black) or west (red).
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12)
# The 1st level would be chosen as a default color which is black and the level 2 would be chosen as Red.
# It may be confusing at first to figure out which color gets mapped to which region. We can find out by looking directly at the levels of the region variable.
levels(pollution$region)
# Here we see that the first level is “east” and the second level is “west”. So the color for “east” will get mapped to 1 and the color for “west” will get mapped to 2. For plotting functions, col = 1 is black (the default color) and col = 2 is red.

#################################################################################### 

#################################################################################### 

############ Process of making plot ########################

# The Process of Making a Plot :-
# When making a plot one must first make a few considerations (not necessarily in this order):
#   (1) Where will the plot be made? On the screen? In a file?
#   (2) How will the plot be used?
#     – Is the plot for viewing temporarily on the screen?
#     – Will it be presented in a web browser?
#     – Will it eventually end up in a paper that might be printed?
#     – Are you using it in a presentation?
#   (3) Is there a large amount of data going into the plot? Or is it just a few points?
#   (4) Do you need to be able to dynamically resize the graphic?
#   (5) What graphics system will you use? 
#     - base
#     - lattice
#     - ggplot2?

# How Does a Plot Get Created?
# (1) Normal method
#   1. Call a plotting function like plot, xyplot, or qplot
#   2. The plot appears on the screen device
#   3. Annotate the plot if necessary

# Make plot appear on screen device
with(faithful, plot(eruptions, waiting))
# Annotate with a title
title(main = "Old Faithful Geyser data")

# (2) The second basic approach to plotting is most commonly used for file devices:
#   1. Explicitly launch a graphics device
#   2. Call a plotting function to make a plot (Note: if you are using a file device, no plot will appear on the screen)
#   3. Annotate the plot if necessary
#   4. Explicitly close graphics device with dev.off() (this is very important!)

# Open PDF device; create 'myplot.pdf' in my working directory
pdf(file = "myplot.pdf")
# Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
# Annotate plot; still nothing on screen
title(main ="Old Faithful Geyser data")
# Close the PDF file device
dev.off()

#################################################################################### 

#################################################################################### 

################ THE BASE PLOTTING SYSTEM ###########

# The base graphics system (hist, plot, boxplot, scatterplot) has many global parameters that can be set and tweak and used to control the global behavious of plot(par). It is used to control global behaviour of plot such as margins, axis-rotation.

# Some Important Base Graphics Parameters (Global parameters for plot) :
#   pch: the plotting symbol (default is open circle)
#   lty: the line type (default is solid line), can be dashed, dotted, etc.
#   lwd: the line width, specified as an integer multiple
#   col: the plotting color, specified as a number, string, or hex code; the colors() function gives you a vector of colors by name
#   xlab: character string for the x-axis label
#   ylab: character string for the y-axis label

# The par() function is used to specify the global graphics parameters that affect all plots in an R session.
# Diagram from copy.
# How to see default values.
par("lty")
par("col")

# Notice that when constructing the initial plot, we use the option type = "n" in the call to plot(). This is a common paradigm as plot() will draw everything in the plot except for the data points inside the plot window. Then you can use annotation functions like points() to add data points. So here, we create the plot without drawing the data points, then add the blue points and then add the red points. Finally, we add a legend with the legend() function explaining the meaning of the different colors in the plot.
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

#################################################################################### 


####################################################################################

############### Linear Regression #####################

marketingData <- read.csv("~/Desktop/Amity/5th Sem/R Programming/R_NOTES/data-marketing-budget-12mo.csv")
marketingData

# In linear regression model we predict the dependent variable values based on independent variable.
# In R, the lm(), or “linear model,” function can be used to create a simple regression model. The lm() function accepts a number of arguments (“Fitting Linear Models,” n.d.). The following list explains the two most commonly used parameters.
# formula: describes the model
#   Note that the formula argument follows a specific format. For simple linear regression, this is “YVAR ~ XVAR” where YVAR is the dependent, or predicted, variable and XVAR is the independent, or predictor, variable.
# data: the variable that contains the dataset
# Structure lm(formula, data)

# Simple Linear Regression Model :-
# Here, we will be predicting total sales from spend i.e., our dependent model in variable will be sales and independent variable will be Spends.
modelSimple <- lm(Sales ~ Spend, data = marketingData)
modelSimple
# Here the cofficient Intercept is the y intercept and spend is slope.
# The linear model is : y = mx + c, where m is Slope and c is Intercept obtained after calculation
# Suppose our Spend i.e x is 9000 then sales can be calulated as
(9000 * 10.62) + 1383.47 # Check this value with dataset it is nearby so we can say that our model is perfect.

# The summary(OBJECT) function has provided us with a wealth of information, including t-test, F-test, R-squared, residual, and significance values. All of this data can be used to answer important research questions related to our linear model.
summary(modelSimple)

# Multiple Linear Regression :
# In multiple linear regression we will be using multiple attributes to find the output. Here, we will be using Spend and Month as a independent variables to find corresponding sales. In lm() multiple attributes are given by +
modelMulti <- lm(Sales ~ Spend + Month, data = marketingData)
modelMulti
# Here we see that y-intercept is -567.61 and slope for spend is 10.38 and month is 541.37
# Equation is of the form y = m1x1 + m2x2 + c, where c is y-intercept and m1 is slope corresponding to spend and m2 for month
# So for Month 7 and Spend 9000 if our model gives value near to 94871(from dataset) then we can say our prediction is approximate
(10.38 * 9000) + (541.37 * 7) - 567.61

summary(modelMulti)
####################################################################################

####################################################################################

################### Linear Model #######################

library(caTools) # Library to split data
marketingData <- read.csv("~/Desktop/Amity/5th Sem/R Programming/R_NOTES/data-marketing-budget-12mo.csv")
marketingData
split <- sample.split(marketingData$Sales, SplitRatio = 0.65) # Randomly outputting T and F in the given ratio for the data
train <- subset(marketingData, split == T) # Subsetting train set
test <- subset(marketingData, split == F) # Subsetting train set

model <- lm(Sales~Spend, data = train) # training model
model

result <- predict(model, newdata = test) # Storing output in result by running model on test dataset
OriginalResultModelResult <- data.frame(test$Sales, result, stringsAsFactors = F) # Storing actual ans vs predicted ans side by side
OriginalResultModelResult
rmse <- sqrt(mean((OriginalResultModelResult$test.Sales - OriginalResultModelResult$result)^2)) # To calculate the root mean square error
rmse

##################################################################################################