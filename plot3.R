##Plot 3
##Cameryn Carr
##Exploratory Data Analysis

library(lubridate)

power_con <- read.csv("~/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power_con$Global_active_power <- as.numeric(power_con$Global_active_power)
power_con$Date <- dmy(power_con$Date)
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")
power_con$DateTime <- paste(as.Date(power_con$Date,"%Y-%m-%d"),power_con$Time)
power_con$DateTime <- as.POSIXct(power_con$DateTime)


png("plot3.png", width=500, height=500)
with(power_con, {
  plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
     lines(DateTime,Sub_metering_2, type="l",col='Red')
     lines(DateTime,Sub_metering_3, type="l",col='Blue')
})

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, lwd=2.5)
dev.off()