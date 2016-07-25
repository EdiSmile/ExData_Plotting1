
## Plot 2
plotData <- read.table("Exploratory Data Analysis/Assignment 1/household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
ShowData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(ShowData$Date, ShowData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ShowData <- cbind(SetTime, ShowData)
plot(ShowData$SetTime, ShowData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
