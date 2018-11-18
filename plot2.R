#Call required libraries
library("data.table")
#Set working directory:
setwd("C:/Users/CocoCuchi/Desktop/JohnHopkins/Exploratory")
#Read data from txt file
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Create a POSIXct for filtering purposes
powerdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Filter by dates
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
#Graphic device -- png
png("plot2.png", width=480, height=480)
#Create Plot 2
plot(x = powerdata[, dateTime] , y = powerdata[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()