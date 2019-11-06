####### Exploratory Data Analysis - Project 1, Plot 4
####### Author: Jack Sternal
####### Date: 06 November 2019

# Outside of these programs, the file utilized for these graphs was downloaded as a .zip and extracted into
# the Git Repository that will contain these R files. These programs will only focus on loading, cleaning, and analyzing
# the data

# load sqldf library
library(sqldf)
library(lubridate)

#Download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
unzip("power.zip")

# Read the data, using SQL queries to subset data only for the dates 01-02-2007 and 02-02-2007
Power <- "household_power_consumption.txt"
pow <- file(Power)
power_sub <- sqldf("select * from pow where Date == '1/2/2007' or Date == '2/2/2007'", 
                   file.format = list(header = TRUE, sep = ";"))

# Use Lubridate to concatenate date and time into one POSIXlt variable, named "DT"
power_sub$DT <- with(power_sub, dmy(Date) + hms(Time))

# Opens a png device to plot 4 separate graphs
png("plot4.png")

# Sets output to display 2 columns with 2 graphs in each column 
par(mfcol=c(2,2))

# Plot 1: Global Active Power over time
with(power_sub, plot(DT, Global_active_power,type="n", ylab = "Global Active Power", xlab = ""))
with(power_sub, lines(DT, Global_active_power))

#Plot 2: a line graph of each sub metering 
# (displayed in black, red, and blue for meterings 1-3, respectively)
# and a corresponding legend in the upper right corner of the graph
with(power_sub, plot(DT, Sub_metering_1,type="n", ylab = "Energy Sub metering", xlab=""))
with(power_sub, lines(DT, Sub_metering_1))
with(power_sub, lines(DT, Sub_metering_2,col="red"))
with(power_sub, lines(DT, Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,bty="n")

#Plot 3: line graph of voltage over time
with(power_sub, plot(DT, Voltage,type="n", xlab = "datetime"))
with(power_sub, lines(DT, Voltage))

#Plot 4: line graph of global reactive power over time
with(power_sub, plot(DT, Global_reactive_power,type="n", xlab = "datetime"))
with(power_sub, lines(DT, Global_reactive_power))

dev.off()