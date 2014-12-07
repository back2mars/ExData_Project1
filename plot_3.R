alldata <- read.csv("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

mydata <- alldata[alldata$Date >= "2007-02-01" & alldata$Date <= "2007-02-02", ]
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")
mydata$Weekday <- as.POSIXct(mydata$DateTime)

with(mydata, {
  plot(Sub_metering_1~Weekday, type='l',ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Weekday,col='Red')
  lines(Sub_metering_3~Weekday,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

dev.copy(png, file="plot_3.png", height=480, width=480)
dev.off()