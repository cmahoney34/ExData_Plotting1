# Project 1: Plot 2
# Author: Christopher Mahoney
# Date: 4/12/2015

# Read in electric power subset dataset

column_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
column_types = c("character", "character", rep("numeric",7))

DF_power <- read.csv("household_power_consumption_subset.txt", sep = ";", col.names = column_names, colClasses = column_types, na = "?")
head(DF_power)

# Convert Date and Time from character types to date and time types

convert <- paste(DF_power$Date, DF_power$Time)
DF_power$DateTime <- strptime(convert, "%d/%m/%Y %H:%M:%S")

# Check column types

str(DF_power)

# Create plot
par(mfrow = c(1, 1), mar = c(4,4,2,2))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(DF_power$DateTime, DF_power$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", xlab = "")
dev.off()
