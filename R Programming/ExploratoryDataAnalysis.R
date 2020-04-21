#################################################################################### 

# Why we use exploratory graphs ?
# It is used to understand the data by visualizing it so that we can perform appropiate methods for the filteration and can apply appropiate learning algorithms.
class <- c("numeric", "character", "factor", "numeric", "numeric")
pollution <- read.csv("https://github.com/jtleek/modules/raw/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv", colClasses = class)
str(pollution)
# Summaries method we will be using :-
# Five-number summary
# Boxplots
  
# Five Number Summary
# The function fivenum() takes vector as input and give summary in 5 aspects i.e minimum number, 1st quartile , median, 3rd quartile and maximum number.
fivenum(pollution$pm25) 
summary(pollution$pm25) # It gives mean too along with the summary from output of fivenum()
  
# Boxplot
#  Note that in a boxplot, the “whiskers” that stick out above and below the box have a length of 1.5 times the inter-quartile range, or IQR, which is simply the distance from the bottom of the box to the top of the box. Anything beyond the whiskers is marked as an “outlier” and is plotted separately as an individual point.
# par(mar=c(1,1,1,1))
boxplot(pollution$pm25, col="blue")
# We can see that everything above 15 is an outlier
# To see all the outliers above 15
library("dplyr")
filter(pollution, pm25 > 15)
  
# Overlaying features :- Useful to lay down annotations on our plot as reference points or markers. Suppose we need horizantal line at 12
boxplot(pollution$pm25, col = "blue")
abline(h = 12) # h is for horizantal
  
# Multiple boxplots : To show relationship between two variables side by side. 
# Show difference in pm2.5 levels between east and west
boxplot(pm25 ~ region, data = pollution, col = "red")
# boxlplot() function take formula, left side i.e pm25 indication varibale for which we want boxplot and rightside i.e region variable that stratifies the left hand side into categories.
  
# Scatterplots : For continuous variables, the most common visualization technique is the scatterplot, which simply maps each variable to an x- or y-axis coordinate.
with(pollution, plot(latitude, pm25))
abline(h = 12)
  
# If we wanted to add a third dimension to the scatterplot above, say the region variable indicating east and west, we could use color to highlight that dimension. Here we color the circles in the plot to indicate east (black) or west (red).
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12)
# The 1st level would be chosen as a default color which is black and the level 2 would be chosen as Red.
# It may be confusing at first to figure out which color gets mapped to which region. We can find out by looking directly at the levels of the region variable.
levels(pollution$region)
# Here we see that the first level is “east” and the second level is “west”. So the color for “east” will get mapped to 1 and the color for “west” will get mapped to 2. For plotting functions, col = 1 is black (the default color) and col = 2 is red.

#################################################################################### 

#################################################################################### 

# The Process of Making a Plot :-
# When making a plot one must first make a few considerations (not necessarily in this order):
#   (1) Where will the plot be made? On the screen? In a file?
#   (2) How will the plot be used?
#     – Is the plot for viewing temporarily on the screen?
#     – Will it be presented in a web browser?
#     – Will it eventually end up in a paper that might be printed?
#     – Are you using it in a presentation?
#   (3) Is there a large amount of data going into the plot? Or is it just a few points?
#   (4) Do you need to be able to dynamically resize the graphic?
#   (5) What graphics system will you use? 
#     - base
#     - lattice
#     - ggplot2?

# How Does a Plot Get Created?
# (1) Normal method
#   1. Call a plotting function like plot, xyplot, or qplot
#   2. The plot appears on the screen device
#   3. Annotate the plot if necessary

# Make plot appear on screen device
with(faithful, plot(eruptions, waiting))
# Annotate with a title
title(main = "Old Faithful Geyser data")

# (2) The second basic approach to plotting is most commonly used for file devices:
#   1. Explicitly launch a graphics device
#   2. Call a plotting function to make a plot (Note: if you are using a file device, no plot will appear on the screen)
#   3. Annotate the plot if necessary
#   4. Explicitly close graphics device with dev.off() (this is very important!)

# Open PDF device; create 'myplot.pdf' in my working directory
pdf(file = "myplot.pdf")
# Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
# Annotate plot; still nothing on screen
title(main ="Old Faithful Geyser data")
# Close the PDF file device
dev.off()

#################################################################################### 

#################################################################################### 

# THE BASE PLOTTING SYSTEM :-
# The base graphics system (hist, plot, boxplot, scatterplot) has many global parameters that can be set and tweak and used to control the global behavious of plot(par). It is used to control global behaviour of plot such as margins, axis-rotation.
  
# Some Important Base Graphics Parameters (Global parameters for plot) :
#   pch: the plotting symbol (default is open circle)
#   lty: the line type (default is solid line), can be dashed, dotted, etc.
#   lwd: the line width, specified as an integer multiple
#   col: the plotting color, specified as a number, string, or hex code; the colors() function gives you a vector of colors by name
#   xlab: character string for the x-axis label
#   ylab: character string for the y-axis label
  
# The par() function is used to specify the global graphics parameters that affect all plots in an R session.
# Diagram from copy.
# How to see default values.
par("lty")
par("col")

# Notice that when constructing the initial plot, we use the option type = "n" in the call to plot(). This is a common paradigm as plot() will draw everything in the plot except for the data points inside the plot window. Then you can use annotation functions like points() to add data points. So here, we create the plot without drawing the data points, then add the blue points and then add the red points. Finally, we add a legend with the legend() function explaining the meaning of the different colors in the plot.
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

#################################################################################### 