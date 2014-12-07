alldata <- read.csv("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

mydata <- alldata[alldata$Date >= "2007-02-01" & alldata$Date <= "2007-02-02", ]
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")
mydata$Weekday <- as.POSIXct(mydata$DateTime)

par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0))
with(mydata, {
  plot(Global_active_power~Weekday, type='l', ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Weekday, type='l', ylab="Voltage (volt)", xlab="datatime")
  plot(Sub_metering_1~Weekday, type='l', ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Weekday, col='Red')
  lines(Sub_metering_3~Weekday, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Weekday, type='l', ylab="Global Rective Power (kilowatts)", xlab="datetime")
})

dev.copy(png, file="plot_4.png", height=480, width=480)
dev.off()