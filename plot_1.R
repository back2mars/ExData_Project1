alldata <- read.csv("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

mydata <- alldata[alldata$Date >= "2007-02-01" & alldata$Date <= "2007-02-02", ]
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")

hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot_1.png", height=480, width=480)
dev.off()
