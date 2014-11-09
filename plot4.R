###Granted that you have a data set saved in your working directory as
###"household_power_consumption.txt"

###Reading in the data
electric <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
electric$Date <- as.Date(electric$Date, "%d/%m/%Y")

###Subsetting the data to specific time frames
###Dates from: 2007-02-01 and 2007-02-02
data <- subset(electric, electric$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

###Formatting the types of the columns for graphing:
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

###Creating a Date and Time Column Named: Timestamp
data$Timestamp <- paste(data$Date, data$Time)
data$Timestamp <- strptime(data$Timestamp, "%Y-%m-%d %H:%M:%S")

##Opening png file
png(filename = "plot4.png", width = 480, height = 480)

###Creating the environment to plot four graphs
par(mfrow = c(2,2))

###Plotting Top Left Graph
plot(data$Timestamp, data$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power")
lines(data$Timestamp,data$Global_active_power)

###Plotting Top Right Graph:
plot(data$Timestamp, data$Voltage, pch = NA, xlab = "datetime", ylab = "Voltage")
lines(data$Timestamp,data$Voltage)

###Plotting the Bottom Left Graph:
plot(data$Timestamp, data$Sub_metering_1, pch = NA, xlab = "", ylab = "Energy sub metering")
#Adding Plotting lines
lines(data$Timestamp,data$Sub_metering_1)
lines(data$Timestamp, data$Sub_metering_2, col = "red")
lines(data$Timestamp, data$Sub_metering_3, col = "blue")
#Adding the file at the top of the page
legend("topright", lwd = 1, lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), xjust = 1, yjust = 0)

###Plotting the Bottom Right Graph:
plot(data$Timestamp, data$Global_reactive_power, pch = NA, xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Timestamp,data$Global_reactive_power)

##Closing the device:
dev.off(dev.cur())