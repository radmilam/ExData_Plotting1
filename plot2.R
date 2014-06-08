png("plot2.png", 480, 480)
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
data1<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") ##subset to only see two dates
data2<-as.Date(data1$Date, format="%d/%m/%Y") ## formatting dates
datumfix<-paste(data2, data1$Time)
timefix <- strptime(datumfix, format="%Y-%m-%d %H:%M:%S")## formatting date and time for the plot
##Plot the requested data
plot(timefix,data1$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",pch=33)
lines(timefix,data1$Global_active_power)
dev.off()
