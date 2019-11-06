####### Exploratory Data Analysis - Project 1, Plot 3
####### Author: Jack Sternal
####### Date: 06 November 2019

# Outside of these programs, the file utilized for these graphs was downloaded as a .zip and extracted into
# the Git Repository that will contain these R files. These programs will only focus on loading, cleaning, and analyzing
# the data

# load sqldf library
library(sqldf)
library(lubridate)

# Read the data, using SQL queries to subset data only for the dates 01-02-2007 and 02-02-2007
Power <- "./ExData_Plotting1/household_power_consumption.txt"
pow <- file(Power)
power_sub <- sqldf("select * from pow where Date == '1/2/2007' or Date == '2/2/2007'", 
                   file.format = list(header = TRUE, sep = ";"))

# Use Lubridate to concatenate date and time into one POSIXlt variable, named "DT"
power_sub$DT <- with(power_sub, dmy(Date) + hms(Time))


# Opens a png device to plot a line graph of each sub metering 
# (displayed in black, red, and blue for meterings 1-3, respectively)
# and a corresponding legend in the upper right corner of the graph
png("./ExData_Plotting1/plot3.png")
with(power_sub, plot(DT, Sub_metering_1,type="n", ylab = "Energy Sub metering", xlab=""))
with(power_sub, lines(DT, Sub_metering_1))
with(power_sub, lines(DT, Sub_metering_2,col="red"))
with(power_sub, lines(DT, Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
dev.off()