png("plot1.png", 480, 480)
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
data1<-subset(data, Date=="1/2/2007" | Date=="2/2/2007") ##subset to only see two dates
histogram<-hist(data1$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()