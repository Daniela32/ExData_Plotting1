#Call required libraries
library("data.table")
#Set working directory:
setwd("C:/Users/CocoCuchi/Desktop/JohnHopkins/Exploratory")
#Read data from txt
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Make POSIXct for filtering purposes
powerdata[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Filter by dates
powerdata <- powerdata[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]
#Graphic device -- png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Create subPlot 1
plot(powerdata[, datetime], powerdata[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
#Create subPlot 2
plot(powerdata[, datetime],powerdata[, Voltage], type="l", xlab="datetime", ylab="Voltage")
#Create subPlot 3
plot(powerdata[, datetime], powerdata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdata[, datetime], powerdata[, Sub_metering_2], col="red")
lines(powerdata[, datetime], powerdata[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
#Create subPlot 4
plot(powerdata[, datetime], powerdata[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()