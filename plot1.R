## This creates a chart for the Global active power variable.

library(data.table)

## Pull and subset the data
power <- fread("household_power_consumption.txt")
work <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Make the plot and spit it out in PNG
png("plot1.png")
with(work, hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
