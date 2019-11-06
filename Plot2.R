####### Exploratory Data Analysis - Project 1, Plot 2
####### Author: Jack Sternal
####### Date: 06 November 2019

# Outside of these programs, the file utilized for these graphs was downloaded as a .zip and extracted into
# the Git Repository that will contain these R files. These programs will only focus on loading, cleaning, and analyzing
# the data

# load sqldf library
library(sqldf)
library(lubridate)

# Read the data, using SQL queries to subset data only for the dates 01-02-2007 and 02-02-2007
Power <- "household_power_consumption.txt"
pow <- file(Power)
power_sub <- sqldf("select * from pow where Date == '1/2/2007' or Date == '2/2/2007'", 
                   file.format = list(header = TRUE, sep = ";"))

# Use Lubridate to concatenate date and time into one POSIXlt variable, named "DT"
power_sub$DT <- with(power_sub, dmy(Date) + hms(Time))

# Opens a png device to plot a line graph of Global Active Power over time
png("plot2.png")
with(power_sub, plot(DT, Global_active_power,type="n", ylab = "Global Active Power (kilowatts)", xlab=""))
with(power_sub, lines(DT, Global_active_power))
dev.off()