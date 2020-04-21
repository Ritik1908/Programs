####################################################################################

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