#Read Data
houseData <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", na.strings = "?")
str(houseData)

library(lubridate)
houseData$Date <- dmy(houseData$Date)
houseData$Time <- hms(houseData$Time)
#Subset Data
subset <- houseData[year(houseData$DateTime)==2007 & month(houseData$DateTime)==2 & day(houseData$DateTime)<=2,]
rm(houseData)

#Draw Plot
png("plot1.png", width=480, height=480)
hist(subset$Global_active_power, col = "red", 
     xlab = "Global Active Power (killowatts)",
     main = "Global Active Power")
dev.off()
