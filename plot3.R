## I already stripped out the data from the file, using a text
## editor I deleted all the unneeded rows
##

data = read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Date = as.Date(strptime(data$Date,format="%d/%m/%Y"))

png("plot3.png", width=480, height=480)
plot(data$Sub_metering_1, type="l", axes=FALSE,
	ylab="Energy sub metering", col="black")

axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
axis(2, las=1, at=seq(0,40,by=10))
lines(data$Sub_metering_2, type="l", col="red")
lines(data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	cex=0.8, col=c("black", "red", "blue"),
	lty=1, lwd=1, bty="o")
box()
dev.off()