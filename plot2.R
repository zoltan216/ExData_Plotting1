setwd("~/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment")

data<-read.table("C:/Users/zjavzmaa/Documents/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",sep=";",
                 header=T, colClasses = c('character', 'character', 'numeric',
                                          'numeric', 'numeric', 'numeric','numeric', 'numeric',
                                          'numeric'),na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

s <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01")&as.Date(DateTime) <= as.Date("2007-02-02"))

#Plot 2
plot(s$DateTime, s$Global_active_power, xlab="n", ylab="Global Active Power(kilowatt)", type="l",lty=1)

plot(s$DateTime, s$Global_active_power, xlab="n", ylab="Global Active Power(kilowatt)", pch=NA)
lines(data$DateTime, data$Global_active_power)

#Print
dev.copy(png,filename="plot2.png",height=480, width=480,bg="white")
dev.off()