#################################################################################

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
m <- matrix(c(1,2,3,4,5,6), nrow = 2, byrow=T) #It enabled our input to come in row major form
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
attributes(j)


# NAMING ROWS AND COLUMNS OF MATRIX
z <- matrix(1:4, nrow=2)
z
colnames(z)
colnames(z) <- c("a", "b") # Assingns names
z
z[,"a"]


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