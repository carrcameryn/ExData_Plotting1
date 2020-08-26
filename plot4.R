##Plot 4
##Cameryn Carr
##Exploratory Data Analysis

library(lubridate)

power_con <- read.csv("~/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power_con$Global_active_power <- as.numeric(power_con$Global_active_power)
power_con$Date <- dmy(power_con$Date)
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")
power_con$DateTime <- paste(as.Date(power_con$Date,"%Y-%m-%d"),power_con$Time)
power_con$DateTime <- as.POSIXct(power_con$DateTime)

png("plot4.png", width=500, height=500)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_con, {
  plot(DateTime,Global_active_power, type="l", ylab="Global Active Power",xlab="")
  plot(DateTime,Voltage,type="l", ylab="Voltage", xlab="datetime")
  plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(DateTime,Sub_metering_2, type="l",col='Red')
    lines(DateTime,Sub_metering_3, type="l",col='Blue')
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, lwd=2.5,bty="n", cex=.5)
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime") 
})
dev.off()