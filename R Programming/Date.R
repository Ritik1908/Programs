###################################################################################

startdate <- as.Date("2019-01-01") # Converts character string to date
startdate

xm <- seq(startdate, by = "2 months", length.out = 6) # Generates sequence of date with interval of 2 months
xm

months(startdate) # Give the month of date
weekdays(startdate) # Gives the name of week

# POSIXct -> time that is internally stored as number of seconds since 1970
# POSIXlt -> named list of vector for years, months, days, hour and minute

apollo <- "July 20, 1969, 20:17:39, UTC"
fmt <- "%B %d, %Y, %H:%M:%S" # Format in which the date is stored
xct <- as.POSIXct(apollo, format = fmt, tz = "UTC")
xct

#################################################################################