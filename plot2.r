## I already stripped out the data from the file, using a text
## editor I deleted all the unneeded rows
##

data = read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Date = as.Date(strptime(data$Date,format="%d/%m/%Y"))

## how to specify resolution (480 x 480)
## http://stackoverflow.com/questions/8399100/r-plot-size-and-resolution
png("plot2.png", width=480, height=480)


plot2 = function() {
	plotgap = data$Global_active_power

	## Easy information on how to annotate and generate a complex plot step by step
	## https://www.harding.edu/fmccown/r/
	plot(plotgap, type="l", 
			col="black", 
			ylab="Global Active Power (kilowatts)",
			axes=FALSE)

	axis(1, at=seq(0, 3000, by=1500), labels=c("Thu","Fri","Sat"))
	axis(2, las=1, at=seq(0,8,by=2))
	box()
}

plot2()
dev.off()
