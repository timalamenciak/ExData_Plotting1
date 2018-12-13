## This charts the three sub metering variables.

library(data.table)
library(dplyr)
library(lubridate)

## Pull and subset the data
power <- fread("household_power_consumption.txt")
work <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Combine the date and time columns into one
work <- mutate(work, timestamp = as.POSIXct(dmy(Date) + hms(Time)))

## Build the charts and spit out to PNG
png("plot4.png")
par(mfrow=c(2,2))
with(work, plot(timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(work, plot(timestamp, Voltage, type="l", ylab="Voltage", xlab="datetime"))
with(work, plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab = ""))
with(work, lines(timestamp, Sub_metering_2, col="Red"))
with(work, lines(timestamp, Sub_metering_3, col="Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("Black", "Red", "Blue"), bty="n")
with(work, plot(timestamp, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))
dev.off()