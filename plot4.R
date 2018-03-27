# setting working directory
setwd("C:/Users/Polina/Google Drive/data-science-coursera/exploratory data analysis/week 1")

# loading packages
library(dplyr)
library(lubridate)

# reading the data
data <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# converting the Date
data$date <- dmy(data$Date)

# filtering observations
data1 <- filter(data, ymd("2007-02-01") <= date & date <= ymd("2007-02-02"))

# converting the Date and Time to datetime in POSIXct
data1$datetime  <- as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")

# producing plot
par (mfrow = c(2, 2), mar = c(4,4,1,1))
# 1
plot(data1$datetime, data1$Global_active_power, xlab = "", ylab = "Gloobal Active Power", main = "", type = "l")

#2
plot(data1$datetime, data1$Voltage, xlab = "datetime", ylab = "Voltage", main = "", type = "l")

#3
plot(data1$datetime, data1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "l", col = "grey31")
lines(data1$datetime, data1$Sub_metering_2, col="red")
lines(data1$datetime, data1$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("grey31", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(data1$datetime, data1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", main = "", type = "l")


#Copying Plots to png
dev.copy(png, file = "./ExData_Plotting1/plot4.png")
dev.off()



