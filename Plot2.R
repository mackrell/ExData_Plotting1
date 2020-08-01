dat <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )
feb <-  subset(dat, (dat$Date == "1/2/2007" | dat$Date == "2/2/2007"))
feb$dt <- strptime(paste(feb$Date, feb$Time), format = "%d/%m/%Y %H:%M:%S")
with(feb, plot(feb$dt, feb$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file="plot2.png")
dev.off()