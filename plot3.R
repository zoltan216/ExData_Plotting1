setwd("~/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment")

data<-read.table("C:/Users/zjavzmaa/Documents/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",sep=";",
                 header=T, colClasses = c('character', 'character', 'numeric',
                                          'numeric', 'numeric', 'numeric','numeric', 'numeric',
                                          'numeric'),na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

s <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01")&as.Date(DateTime) <= as.Date("2007-02-02"))

#Plot 3
plot(s$DateTime, s$Sub_metering_1, yaxt="n", ylab="Energy Sub metering",type="l")
lines(s$DateTime, s$Sub_metering_2, col="red")
lines(s$DateTime, s$Sub_metering_3, col="blue")

legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),cex=0.8)


#Print
dev.copy(png,filename="plot3.png",height=480, width=480,bg="white")
dev.off()