
##Granted that you have a data set saved in your working directory as
##"household_power_consumption.txt"

##Reading in the data
electric <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
electric$Date <- as.Date(electric$Date, "%d/%m/%Y")

##Subsetting the data to specific time frames
##Dates from: 2007-02-01 and 2007-02-02
data <- subset(electric, electric$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

##For plot 2: Changing Global active power into a numerical number
data$Global_active_power <- as.numeric(data$Global_active_power)


##Concatenating the Day and time: Plot 2
data$Timestamp <- paste(data$Date, data$Time)
data$Timestamp <- strptime(data$Timestamp, "%Y-%m-%d %H:%M:%S")

##Plotting plot 2
plot(data$Timestamp, data$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power(kilowatts)")
lines(data$Timestamp,data$Global_active_power)

