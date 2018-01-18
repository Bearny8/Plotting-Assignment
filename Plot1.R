mydata<-read.csv("household_power_consumption.txt",header = TRUE, sep=";", as.is=TRUE)

mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")

mysubset<-subset(mydata,mydata$Date>"2007/01/31"&mydata$Date<"2007/02/03")

mysubset[,3] <- as.numeric(mysubset[,3])

hist(mysubset$Global_active_power,main="Global Active Power",xlab ="Global Active Power (kilowatts)",col = "Red")

png(filename = "Plot1.png",width = 480,height = 480)

hist(mysubset$Global_active_power,main="Global Active Power",xlab ="Global Active Power (kilowatts)",col = "Red")

dev.off()