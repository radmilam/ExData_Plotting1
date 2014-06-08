png(file = "plot4.png", width = 480, height = 480)
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
data1<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") ##subset to only see two dates
data2<-as.Date(data1$Date, format="%d/%m/%Y") ## formatting dates
datumfix<-paste(data2, data1$Time)
timefix <- strptime(datumfix, format="%Y-%m-%d %H:%M:%S")
## creating 4 plots on the same canvas
par(mfcol = c(2, 2), mar = c(4, 4, 4, 2), oma = c(1, 1, 0, 0))
plot(timefix,data1$Global_active_power, xlab="", ylab="Global Active Power", pch=33)
lines(timefix,data1$Global_active_power)
plot(timefix,data1$Sub_metering_1, ylab="Energy sub metering", xlab="",type="l", pch=33, col="black")
lines(timefix,data1$Sub_metering_2, type="l", col="red")
lines(timefix,data1$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","blue","red"))
plot(timefix,data1$Voltage, ylab="Voltage", xlab="datetime",pch=33)
lines(timefix,data1$Voltage)
plot(timefix,data1$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", pch=33)
lines(timefix,data1$Global_reactive_power)
dev.off()
