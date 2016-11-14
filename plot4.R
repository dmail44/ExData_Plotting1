#Read Data
houseData <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", na.strings = "?")
houseData$DateTime <- paste(houseData$Date,houseData$Time)

library(lubridate)
houseData$DateTime <- dmy_hms(houseData$DateTime)
#Subset Data
subset <- houseData[year(houseData$DateTime)==2007 & month(houseData$DateTime)==2 & day(houseData$DateTime)<=2,]
rm(houseData)

#Draw Plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(subset$DateTime, subset$Global_active_power, col = "black", xlab = "", ylab = "Global Active Power")

plot(subset$DateTime, subset$Voltage, col = "black", xlab = "datetime", ylab = "Voltage")

plot(subset$DateTime,subset$Sub_metering_1 , col = "black", type="l", xlab = "", ylab = "Energy sub metering")
lines(subset$DateTime,subset$Sub_metering_2 , col = "red", type="l")
lines(subset$DateTime,subset$Sub_metering_3 , col = "blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"),cex=0.12)

plot(subset$DateTime, subset$Global_reactive_power, col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()