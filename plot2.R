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
png("plot2.png", width=480, height=480)
plot(subset$DateTime,subset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()