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

# 1st method
index <- which(x) # Gives index of duplicated element
index
head(iris[-index], 10)

# 2nd Method
head(iris <- iris[!x, ], 10)

# ROWS WITH MISSING DATA
complete.cases(iris) #Returns FALSE where NA present
iris <- na.omit((iris))
head(iris, 10)

# ARITMETIC OPERATIONS
x <- iris$Sepal.Length / iris$Sepal.Width #Divides 1st column by 2nd column
x
y <- with(iris, Sepal.Length / Sepal.Width) #Using with we need no $ sign for using columns
y

# ADD NEW COLUMN TO DATAFRAME
iris <- within(iris, ratio <- Sepal.Length / Sepal.Width)
head(iris, 10)

############################################################################################################