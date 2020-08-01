dat <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?" )

feb <-  subset(dat, (dat$Date == "1/2/2007" | dat$Date == "2/2/2007"))
dat$dt <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
hist(feb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()