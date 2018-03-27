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
plot(data1$datetime, data1$Global_active_power, xlab = "", ylab = "Gloobal Active Power (kilowatts)", main = "", type = "l")

#Copying Plots to png
dev.copy(png, file = "./ExData_Plotting1/plot2.png")
dev.off()



