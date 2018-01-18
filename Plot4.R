#working with data
mydata<-read.csv("household_power_consumption.txt",header = TRUE, sep=";", as.is=TRUE)
mydata$dt<-strptime(paste(mydata$Date,mydata$Time),format = "%d/%m/%Y %H:%M:%S")
mysubset<-subset(mydata,mydata$dt>="2007/02/01"&mydata$dt<"2007/02/03")

#2by2
par(mfcol=c(2,2))

#plot1(2)
plot(mysubset$dt,mysubset$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = (""),type = "l")

#plot2(3)
library(lubridate)
wday(mysubset$dt, label=TRUE)
plot(x=mysubset$dt,y=mysubset$Sub_metering_1,ylab = "Enery sub metering",xlab = (""),type = "l",col="black")
lines(x=mysubset$dt,y=mysubset$Sub_metering_2,ylab = "Enery sub metering",xlab = (""),type = "l",col="red")
lines(x=mysubset$dt,y=mysubset$Sub_metering_3,ylab = "Enery sub metering",xlab = (""),type = "l",col="blue")
legend("topright", lty=1, lwd=2,cex = .5 ,c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue") )

#plot3
plot(x=mysubset$dt,y=mysubset$Voltage,ylab = "Voltage",xlab = ("datetime"),type = "l",col="black")


#plot4
plot(x=mysubset$dt,y=mysubset$Global_reactive_power,ylab = "Global_reactive_power",xlab = ("datetime"),type = "l",col="black")



png(filename = "Plot4.png",width = 480,height = 480)

par(mfcol=c(2,2))

plot(mysubset$dt,mysubset$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = (""),type = "l")

plot(x=mysubset$dt,y=mysubset$Sub_metering_1,ylab = "Enery sub metering",xlab = (""),type = "l",col="black")
lines(x=mysubset$dt,y=mysubset$Sub_metering_2,ylab = "Enery sub metering",xlab = (""),type = "l",col="red")
lines(x=mysubset$dt,y=mysubset$Sub_metering_3,ylab = "Enery sub metering",xlab = (""),type = "l",col="blue")
legend("topright", lty=1, lwd=2,cex = .5 ,c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue") )

plot(x=mysubset$dt,y=mysubset$Voltage,ylab = "Voltage",xlab = ("datetime"),type = "l",col="black")

plot(x=mysubset$dt,y=mysubset$Global_reactive_power,ylab = "Global_reactive_power",xlab = ("datetime"),type = "l",col="black")


dev.off()
