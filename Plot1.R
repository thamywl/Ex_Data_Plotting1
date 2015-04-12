## Remove everything within the environment
rm(list = ls())

library(data.table)

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

## Plot out histogram
hist(data2$Global_active_power, col = "Red"
     , main = paste("Global Active Power")
     , xlab = "Global Active Power (kilowatts)")

## Set a initialization/default value of the original condition of the plot parameters
par.ini = par(no.readonly = TRUE)

## Copy plot from window device to png device
dev.copy(png, file = "plot1.png")
dev.off()
