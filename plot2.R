## This creates a chart of Global active power over days.

library(data.table)
library(dplyr)
library(lubridate)

## Pull and subset the data
power <- fread("household_power_consumption.txt")
work <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Combine the date and time columns into one
work <- mutate(work, timestamp = as.POSIXct(dmy(Date) + hms(Time)))

## Make the plot and spit it out in PNG
png("plot2.png")
with(work, plot(timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()