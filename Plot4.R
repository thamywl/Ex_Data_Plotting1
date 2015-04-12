## Remove everything within the environment
rm(list = ls())

library(data.table)
#library(ggplot2)
library(scales)
library(graphics)

## Read data from text file into memory
data = read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

## Extract only relevant columns
data2 = data[,c("Date","Time","Global_active_power","Global_reactive_power","Voltage"
                ,"Sub_metering_1","Sub_metering_2","Sub_metering_3")]
data2$Date = as.Date(data2$Date, format = "%d/%m/%Y")

## Subset only the defined timeframe
data2 = data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02",]

## Correct class of all data Columns to Numeric
data2$Global_active_power = as.numeric(data2$Global_active_power)
data2$Global_reactive_power = as.numeric(data2$Global_reactive_power)
data2$Voltage = as.numeric(data2$Voltage)
data2$Sub_metering_1 = as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 = as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 = as.numeric(data2$Sub_metering_3)

## Remove all incomplete data
good = complete.cases(data2)
data2 = data2[good,]

data2$Timestamp = strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2), mar= c(4.2,4.2,2,2)+0.1, cex = 0.6) 

## Plot out 3 different data on a same graph
with(data2,{
        plot(Timestamp, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        plot(Timestamp, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Timestamp,Sub_metering_1, type="l", col = "black", ylab = "Energy Sub Metering", xlab = "")
        points(Timestamp,Sub_metering_2, type="l", col = "red")
        points(Timestamp,Sub_metering_3, type="l", col = "blue")
        legend("topright", lty = 1,  col = c("black","red","blue")
               , legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
               , bty = "n")
        plot(Timestamp, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
}) 
     

## Set a initialization/default value of the original condition of the plot parameters
par.ini = par(no.readonly = TRUE)

## Copy plot from window device to png device
dev.copy(png, width = 600, height = 400, file = "plot4.png")
dev.off()
