############################################################################################################################

#####       DATAFRAME       #####

# On an intuitive level, a data frame is like a matrix, with a two-dimensional rows-andcolumns structure. However, it differs from a matrix in that each column may have a different mode. For instance, one column may consist of numbers, and another column might have character strings. In this sense, just as lists are the heterogeneous analogs of vectors in one dimension, data frames are the heterogeneous analogs of matrices for two-dimensional data.

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