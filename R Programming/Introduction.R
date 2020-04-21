#####################################################################
#####       BASIC R OPERATIONS      #####
x <- 1:5 #Assigns values to x from 1 to 5
x
x+5 #Do vector addition(operation) on each elements of x

x <- c(1,2,6) #c function is used to concatenate the given values
x

y <- c(x, x, 8) #Duplicates x two times 
y

y[2:5] #Indexing in range from 2 to 5
x
mean(x) #To find mean of x
y
sd(y) #To find standard deviation of y

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

g <- function(h, a, b) h(a, b) # This function takes function as argument and argument of that function as function as argumnet too
g(f1, 3, 2)
g(f2, 3, 2)

# Looping over function
g1 <- function(x) return(sin(x))
g2 <- function(x) return(sqrt(x^2+1))
g3 <- function(x) return(2*x -1)
plot(c(0,1), c(-1,1.5))
for (f in c(g1, g2, g3)) plot(f, 0, 1, add=TRUE)

# How to change body of function using quote()
g <- function(h ,a , b) h(a, b)
body(g) <- quote(2*x + 3)
g
g <- function(x) 2*x + 3
g(3)

# counts number of odd integers in x
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
#              Scalars do not exist in R, 8 is also a vector in R.
#              Character Strings : Character strings are actually single-element vectors of mode character, (rather than mode numeric).
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
#################################################################################t