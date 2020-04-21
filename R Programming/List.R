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
length(2)

c(list(a=1, b=2,c=list(d=5,e=9))) # It gives a recursive list
c(list(a=1, b=2,c=list(d=5,e=9)), recursive=T) # It gives a non-recursive list, only names look recursive

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
