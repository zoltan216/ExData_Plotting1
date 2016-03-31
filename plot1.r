setwd("~/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment")

data<-read.table("C:/Users/zjavzmaa/Documents/R-Coursera/4) Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",sep=";",
                 header=T, colClasses = c('character', 'character', 'numeric',
                                          'numeric', 'numeric', 'numeric','numeric', 'numeric',
                                          'numeric'),na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

s <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01")&as.Date(DateTime) <= as.Date("2007-02-02"))

par(oma=c(0,0,0,0),mfrow=c(2,2),mar=c(4,4,2,2))

#Plot 1
hist(s$Global_active_power,freq=TRUE,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",xaxt="n",yaxt="n",main="Global Active Power")
axis(side=2,at=seq(0,1200,200))
axis(side=1,at=NULL)

#Print
dev.copy(png,filename="plot1.png",height=480, width=480,bg="white")
dev.off()