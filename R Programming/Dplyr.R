#############################################################################################

#####         dplyr package       #####

# install.packages("dplyr")
library(dplyr)
chicago.x <- chicago
#Arguments to dplyr functions
# 1) Dataframe
# 2) What to do with dataframe specified in the first argument, can refer to the coulmn of data directly without using $ operator
# 3) Return result into a new dataframe

# chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago) #Gives the structure of dataframe

# select() FUNCTION 
# Helps to do the subset of dataframe

#To get 1st 3 column from dataframe
head(chicago[,names(chicago)[1:3]],10) #Base R
subset <- select(chicago, city:dptp)
head(subset,10) #head is used to print top 10 values of dataset only

# Q) TO SELECT EVERYTHING EXCEPT city:dptp (Assuming we don't know column numbers)
#with base R
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[,-(i:j)],10)

#With dplyr
head(select(chicago, -(city:dptp)),10) #We can use name of column directly

# Q) select the column that ends with "2" or starts with a "d"
subset <- select(chicago, ends_with("2"))
head(subset,10)
subset <- select(chicago, starts_with("d"))
head(subset,10)

# filter() FUNCTION
# Used to extract subset of rows from a dataframe

# Q) Extract where pm25tmean > 2 30 and temperature > 80
#with dplyr
chic.f <- filter(chicago, pm25tmean2>30 & tmpd > 80)
head(chic.f,10)

#with base R"
x <- subset(chicago, pm25tmean2 > 30 & tmpd > 80)
head(x,10)

# arrange() FUNCTION
# Reorders rows of a datadrame according to one of the column or variable

chicago <- arrange(chicago, date) #Arranges in asending order
head(chicago, 4) #Shows only 4 rows
tail(chicago, 4) #Shows last 4 rows

chicago <- arrange(chicago, desc(date)) #Arranges data in descending order
head(chicago, 4)
tail(chicago, 4)

#With base R
head(chicago.x[order(chicago.x$date, decreasing = TRUE),],10)

# rename() FUNCTION
#using dplyr
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
names(chicago)

#with base R
names(chicago.x)[match("dptp", names(chicago.x))] <- "dewpoint"
names(chicago.x)[match("pm25tmean2", names(chicago.x))] <- "pm25"
names(chicago.x)

# mutate() FUNCTION
# New variables that are derived from existing variables
# with dplyr
chicago <- mutate(chicago, pm25dtrend = pm25-mean(pm25, na.rm = TRUE))
head(chicago,10)

#with base R
chicago.x <- within(chicago.x, pm25dtrend <- pm25-mean(pm25, na.rm = TRUE))
head(chicago.x,10)

# group_by FUNCTION
#combination of splitting a dataframe into seperate pieces defined by a variable or group of variable and then applying a summary function across those subset
chicago <- mutate(chicago, year = as.POSIXlt.date(date)$year + 1900)
year_new <- group_by(chicago, year)
summarize(year_new, pm25 = mean(pm25, na.rm =TRUE), o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))

# with base R

####################################################################################