plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
ShowData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(ShowData$Date, ShowData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ShowData <- cbind(SetTime, ShowData)
## Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(ShowData$SetTime, ShowData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(ShowData$SetTime, ShowData$Sub_metering_2, col=columnlines[2])
lines(ShowData$SetTime, ShowData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
