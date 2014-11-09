##Granted that you have a data set saved in your working directory as
##"household_power_consumption.txt"

##Reading in the data
electric <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
electric$Date <- as.Date(electric$Date, "%d/%m/%Y")

##Subsetting the data to specific time frames
##Dates from: 2007-02-01 and 2007-02-02
data <- subset(electric, electric$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

##Concatenating the Day and time for x-axis:
data$Timestamp <- paste(data$Date, data$Time)
data$Timestamp <- strptime(data$Timestamp, "%Y-%m-%d %H:%M:%S")

##Plotting the different submeterings
#Opening the file so formatting is exact
png(filename = "plot3.png", width = 480, height = 480)

##Plotting the graph against the Day/Time Timestamp
plot(data$Timestamp, data$Sub_metering_1, pch = NA, xlab = "", ylab = "Energy sub metering")

##Adding Plotting lines
lines(data$Timestamp,data$Sub_metering_1)
lines(data$Timestamp, data$Sub_metering_2, col = "red")
lines(data$Timestamp, data$Sub_metering_3, col = "blue")

##Adding the file at the top of the page
legend("topright", lwd = 1, lty = 1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), xjust = 1, yjust = 0)

#Shutting off the device
dev.off(dev.cur())
