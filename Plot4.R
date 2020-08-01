dat <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )
feb <-  subset(dat, (dat$Date == "1/2/2007" | dat$Date == "2/2/2007"))
feb$dt <- strptime(paste(feb$Date, feb$Time), format = "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2,2))
# Top Left
with(feb, plot(feb$dt, feb$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))


# Bottom Left
with(feb, plot(feb$dt, feb$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(feb, points(feb$dt, feb$Sub_metering_2, type = "l", col="red"))
with(feb, points(feb$dt, feb$Sub_metering_3, type = "l", col="blue"))
legend("topright", lwd=1, seg.len=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


# Top Right
with(feb, plot(feb$dt, feb$Voltage, ylab="Voltage", xlab="datetime", type="l"))

# Bottom Right
with(feb, plot(feb$dt, feb$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))


dev.off()
