png("plot3.png", 480, 480)
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
data1<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") ##subset to only see two dates
data2<-as.Date(data1$Date, format="%d/%m/%Y") ## formatting dates
datumfix<-paste(data2, data1$Time)
timefix <- strptime(datumfix, format="%Y-%m-%d %H:%M:%S")## str(dates)
plot(timefix,data1$Sub_metering_1, ylab="Energy sub metering", xlab="",type="l", pch=33, col="black")
lines(timefix,data1$Sub_metering_2, type="l", col="red")
lines(timefix,data1$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","blue","red"))
dev.off()