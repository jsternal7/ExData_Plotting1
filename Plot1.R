####### Exploratory Data Analysis - Project 1, Plot 1
####### Author: Jack Sternal
####### Date: 06 November 2019

# Outside of these programs, the file utilized for these graphs was downloaded as a .zip and extracted into
# the Git Repository that will contain these R files. These programs will only focus on loading, cleaning, and analyzing
# the data

# load sqldf library
library(sqldf)

# Read the data, using SQL queries to subset data only for the dates 01-02-2007 and 02-02-2007
Power <- "./ExData_Plotting1/household_power_consumption.txt"
pow <- file(Power)
power_sub <- sqldf("select * from pow where Date == '1/2/2007' or Date == '2/2/2007'", 
                   file.format = list(header = TRUE, sep = ";"))

# Opens a png device to plot a histogram of Global Active Power frequencies
png("./ExData_Plotting1/plot1.png")
hist(power_sub$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()