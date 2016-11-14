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
png("plot3.png", width=480, height=480)
plot(subset$DateTime,subset$Sub_metering_1 , col = "black", type="l", xlab = "", ylab = "Energy sub metering")
lines(subset$DateTime,subset$Sub_metering_2 , col = "red", type="l")
lines(subset$DateTime,subset$Sub_metering_3 , col = "blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), pt.cex = 1,cex = 0.75)
dev.off()