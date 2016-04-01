setwd("~/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment")

data<-read.table("C:/Users/zjavzmaa/Documents/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",sep=";",
                 header=T, colClasses = c('character', 'character', 'numeric',
                                          'numeric', 'numeric', 'numeric','numeric', 'numeric',
                                          'numeric'),na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

s <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01")&as.Date(DateTime) <= as.Date("2007-02-02"))


par(mfrow = c(2, 2))

#Plot 1
hist(s$Global_active_power,freq=TRUE,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",xaxt="n",yaxt="n",main="Global Active Power")
axis(side=2,at=seq(0,1200,200))
axis(side=1,at=NULL)

#Plot 2
plot(s$DateTime, s$Global_active_power, xlab="n", ylab="Global Active Power(kilowatt)", pch=NA)
lines(data$DateTime, data$Global_active_power)

#Plot 3
plot(s$DateTime, s$Sub_metering_1, yaxt="n", ylab="Energy Sub metering",type="l")
lines(s$DateTime, s$Sub_metering_2, col="red")
lines(s$DateTime, s$Sub_metering_3, col="blue")

legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty='solid')

#Plot 4
plot(s$DateTime, as.numeric(s$Global_reactive_power),xlab="datetime", ylab="Global reactive power", type="h",lty=1)
axis(side=2,at=seq(0.0,0.5,0.1))

#Print
dev.copy(png,filename="plot4.png",height=480, width=480,bg="white")
dev.off()
