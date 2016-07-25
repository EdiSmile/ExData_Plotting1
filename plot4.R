##read data

plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
ShowData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(ShowData$Date, ShowData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ShowData <- cbind(SetTime, ShowData)

## Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(ShowData$SetTime, ShowData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(ShowData$SetTime, ShowData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(ShowData$SetTime, ShowData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(ShowData$SetTime, ShowData$Sub_metering_2, type="l", col="red")
lines(ShowData$SetTime, ShowData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(ShowData$SetTime, ShowData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")