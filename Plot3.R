#this is a large dataset, and may take a long time to load
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#isolate date range

dates <- as.Date(dat$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
date_range <- dates >= start_date & dates <= end_date

dataset <- dat[date_range,]

#PLOT 3
plot.new()
png(filename="plot3.png", width=480, height=480)
plot(dataset$Time, as.numeric(dataset$Sub_metering_1), type="l", col="black")
lines(dataset$Time, as.numeric(dataset$Sub_metering_2), type="l", col="red")
lines(dataset$Time, as.numeric(dataset$Sub_metering_3), type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","blue","red"))
title(main="Plot 3", ylab="Energy sub metering")
dev.off()

