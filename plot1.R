#Call required libraries
library("data.table")
#Set working directory:
setwd("C:/Users/CocoCuchi/Desktop/JohnHopkins/Exploratory")
#Read data
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#Change date column to date type
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#Filter dates
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
#Graphic device png
png("plot1.png", width=480, height=480)
#Create histogram, plot 1
hist(powerdata[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()