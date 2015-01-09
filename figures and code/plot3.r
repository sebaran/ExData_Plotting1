setwd("C:/Users/Sergio/Desktop/R Coursera/data analysis")
data <- read.table("household_power_consumption.txt", sep = ";", skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879)
colnames <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", nrows=1)
colnames(data) <- colnames(colnames)

data$Time <- as.character(data$Time)
data$Date <- as.character(data$Date)
complete_date <- paste (data$Date, data$Time)
data2 <- cbind(complete_date, data, stringsAsFactors = FALSE)
strp_time <- strptime (data2$complete_date, format = "%d/%m/%Y %H:%M:%S")
data3 <- cbind (strp_time, data2, stringsAsFactors = FALSE)

png (filename = "plot3.png", width=480, height=480)
plot (data3$strp_time, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines (data3$strp_time, data3$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
lines (data3$strp_time, data3$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"))

dev.off()