############################################################################################################

#####         state.x77 data        #####
d <- state.x77
str(d)
summary(d) #Gives summariez overview of dataset, minimum value, 1st quartile, median, 3rd quartile, mean, maximum value

# Q) Find subset of cold.state having more than 150 days of frost
cold.state <- d[d[,"Frost"] > 150,"Frost", drop=FALSE]

# Q) Area is greater than or equal to 1lakh
large.state <- d[d[,"Area"] >= 100000,"Area", drop=FALSE]
large.state 

# Q) To find Large State that are also cold states
i <- match(cold.state, large.state)
i

#############################################################################################