setwd("C:/Users/Sergio/Desktop/R Coursera/data analysis")
data <- read.table("household_power_consumption.txt", sep = ";", skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879)
colnames <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", nrows=1)
colnames(data) <- colnames(colnames)

png (filename = "plot1.png", width=480, height=480)
hist (data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active power")
dev.off()