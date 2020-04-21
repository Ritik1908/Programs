####################################################################################

marketingData <- read.csv("~/Desktop/Amity/5th Sem/R Programming/R_NOTES/data-marketing-budget-12mo.csv")
data

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