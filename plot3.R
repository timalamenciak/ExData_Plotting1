## This charts the three sub metering variables.

library(data.table)
library(dplyr)
library(lubridate)

## Pull and subset the data
power <- fread("household_power_consumption.txt")
work <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Combine the date and time columns into one
work <- mutate(work, timestamp = as.POSIXct(dmy(Date) + hms(Time)))

## Make the plot and spit it out in PNG
png("plot3.png")
with(work, plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab = ""))
with(work, lines(timestamp, Sub_metering_2, col="Red"))
with(work, lines(timestamp, Sub_metering_3, col="Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("Black", "Red", "Blue") )
dev.off()