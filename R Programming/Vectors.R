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

#################################################################################