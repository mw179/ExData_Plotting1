#this is a large dataset, and may take a long time to load
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#isolate date range

dates <- as.Date(dat$Date, "%d/%m/%Y")
start_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
date_range <- dates >= start_date & dates <= end_date

dataset <- dat[date_range,]

#PLOT 1
plot.new()
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(dataset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png,'myplot.png')
dev.off()


