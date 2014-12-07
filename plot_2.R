alldata <- read.csv("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

mydata <- alldata[alldata$Date >= "2007-02-01" & alldata$Date <= "2007-02-02", ]
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")
mydata$Weekday <- as.POSIXct(mydata$DateTime)

plot(mydata$Global_active_power~mydata$Weekday, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot_2.png", height=480, width=480)
dev.off()

