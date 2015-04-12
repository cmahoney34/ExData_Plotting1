# Project 1
# Author: Christopher Mahoney
# Date: 4/11/2015

# Read in electric power subset dataset

column_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
column_types = c("character", "character", rep("numeric",7))

DF_power <- read.csv("household_power_consumption_subset.txt", sep = ";", col.names = column_names, colClasses = column_types )

DF_power$Date <- as.Date(DF_power$Date)
DF_power$Time <- strptime(DF_power$Time, "%H:%M:%S")

str(DF_power)

hist(DF_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.copy(png, file = "plot1.png")
dev.off()