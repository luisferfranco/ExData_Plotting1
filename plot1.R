## I already stripped out the data from the file, using a text
## editor I deleted all the unneeded rows
##

data = read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data[[1]] = as.Date(data[[1]], format="dd/mm/yyyy")

## how to specify resolution (480 x 480)
## http://stackoverflow.com/questions/8399100/r-plot-size-and-resolution
png("plot1.png", width=480, height=480)

plot1 = function() {
	## Info on parameters for plots and hist
	## http://www.statmethods.net/advgraphs/axes.html
	hist(data$Global_active_power,col="red",
		xlab="Global Active Power (kilowatts)",
		ylab="Frequency",
		main="Global Active Power")

	## Info on how to change the axis interval
	## http://stackoverflow.com/questions/15717545/set-the-intervals-of-x-axis-using-r
	##
	axis(side=2,at=seq(0, 1200, by=200))

	## How to copy the device screen to png
	## http://stackoverflow.com/questions/7144118/how-to-save-a-plot-as-image-on-the-disk
}

plot1()
## Close the displaying "device" (png file in this case)
dev.off()
