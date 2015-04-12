## Remove everything within the environment
rm(list = ls())

library(data.table)
library(scales)

## Read data from text file into memory
data = read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

## Extract only relevant columns
data2 = data[,c("Date","Time","Global_active_power")]
data2$Date = as.Date(data2$Date, format = "%d/%m/%Y")

## Subset only the defined timeframe
data2 = data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02",]

## Correct class of Global Active Power to Numeric
data2$Global_active_power = as.numeric(data2$Global_active_power)

## Remove all incomplete data
good = complete.cases(data2)
data2 = data2[good,]

data2$Timestamp = strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot out histogram
with(data2, plot(Timestamp, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))


## Set a initialization/default value of the original condition of the plot parameters
par.ini = par(no.readonly = TRUE)

## Copy plot from window device to png device
dev.copy(png, file = "plot2.png")
dev.off()
