####### Exploratory Data Analysis - Project 1, Plot 1
####### Author: Jack Sternal
####### Date: 06 November 2019

# load sqldf library
library(sqldf)

#Download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
unzip("power.zip")

# Read the data, using SQL queries to subset data only for the dates 01-02-2007 and 02-02-2007
Power <- "household_power_consumption.txt"
pow <- file(Power)
power_sub <- sqldf("select * from pow where Date == '1/2/2007' or Date == '2/2/2007'", 
                   file.format = list(header = TRUE, sep = ";"))

# Opens a png device to plot a histogram of Global Active Power frequencies
png("plot1.png")
hist(power_sub$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()