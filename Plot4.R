#this is a large dataset, and may take a long time to load
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#isolate date range

dates <- as.Date(dat$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
date_range <- dates >= start_date & dates <= end_date

dataset <- dat[date_range,]


#PLOT 4
plot.new()
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Subplot 1 - Global Active Power
plot(dataset$Time, as.numeric(dataset$Global_active_power), type="l", ylab="Global Active Power (kilowatts)")
#Subplot 2 - Voltage
plot(dataset$Time, as.numeric(dataset$Voltage), type="l", ylab="Voltage")
#Subplot 3 - Energy Sub Metering
plot(dataset$Time, as.numeric(dataset$Sub_metering_1), type="l", col="black")
lines(dataset$Time, as.numeric(dataset$Sub_metering_2), type="l", col="red")
lines(dataset$Time, as.numeric(dataset$Sub_metering_3), type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","blue","red"))
title(main="", ylab="Energy sub metering")
#Subplot 4 - Global Reactive Power
plot(dataset$Time, as.numeric(dataset$Global_reactive_power), type="l", ylab="Global Reactive Power (kilowatts)")
dev.off()


