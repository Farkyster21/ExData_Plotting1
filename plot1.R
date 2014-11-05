
##Granted that you have a data set saved in your working directory as
##"household_power_consumption.txt"

##Reading in the data
electric <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
electric$Date <- as.Date(electric$Date, "%d/%m/%Y")

##Subsetting the data to specific time frames
##Dates from: 2007-02-01 and 2007-02-02
data <- subset(electric, electric$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

##For plot 1: Specifying color of histogram and labelling
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
axis(1, at = c(0,200,400,600,800,1000,1200))

##Writing to a PNG file and closing the device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off(dev.prev())


