##Plot 1
##Cameryn Carr
##Exploratory Data Analysis 

library(lubridate)

power_con <- read.csv("~/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power_con$Date <- dmy(power_con$Date)
power_con$Global_active_power <- as.numeric(power_con$Global_active_power)
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")

png("plot1.png", width=500, height=500)
with(power_con, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()