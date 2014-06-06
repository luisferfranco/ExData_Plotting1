## I already stripped out the data from the file, using a text
## editor I deleted all the unneeded rows
##

## data = read.csv("household_power_consumption.txt", na.strings="?", sep=";")
## data$Date = as.Date(strptime(data$Date,format="%d/%m/%Y"))

plot2 = function() {
	plotgap = data$Global_active_power

	## Easy information on how to annotate and generate a complex plot step by step
	## https://www.harding.edu/fmccown/r/
	plot(plotgap, type="l", 
			col="black", 
			ylab="Global Active Power (kilowatts)",
			xlab="",
			axes=FALSE)

	axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
	axis(2, las=1, at=seq(0,8,by=2))
	box()
}

plot3 = function() {
	plot(data$Sub_metering_1, type="l", axes=FALSE,
		ylab="Energy sub metering", xlab="", col="black")

	axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
	axis(2, las=1, at=seq(0,40,by=10))
	lines(data$Sub_metering_2, type="l", col="red")
	lines(data$Sub_metering_3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		cex=0.8, col=c("black", "red", "blue"),
		lty=1, lwd=1)
	box()
}

plot4 = function() {
	plot(data$Voltage, type="l", axes=FALSE,
		ylab="Energy sub metering", col="black",
		xlab="datetime")

	axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
	axis(2, las=1, at=seq(234,246,by=4))
	box()
}

plot5 = function() {
	plot(data$Global_reactive_power, type="l", axes=FALSE,
		ylab="Global_reactive_power", col="black",
		xlab="datetime")

	axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
	axis(2, las=1, at=seq(0,0.5,by=0.1))
	box()
}

plotall = function() {
	png("plot4.png", width=480, height=480)
	par(mfrow = c(2, 2))
	plot2()
	plot4()
	plot3()
	plot5()
	dev.off()
}

