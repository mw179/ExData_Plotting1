#this is a large dataset, and may take a long time to load
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#isolate date range

dates <- as.Date(dat$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
date_range <- dates >= start_date & dates <= end_date

dataset <- dat[date_range,]

#PLOT 2
plot.new()
png(filename="plot2.png", width=480, height=480)
plot(dataset$Time, as.numeric(dataset$Global_active_power), type="l",  ylab="Global Active Power (kilowatts)")
title(main="Plot 2")
dev.off()

