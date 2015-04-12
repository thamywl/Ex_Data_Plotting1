# Exploratory Analysis Project 1

Introduction
============
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular,  the “Individual household electric power consumption Data Set” which is available from the below web site:

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

-Date: Date in format dd/mm/yyyy
-Time: time in format hh:mm:ss
-Global_active_power: household global minute-averaged active power (in kilowatt)
-Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
-Voltage: minute-averaged voltage (in volt)
-Global_intensity: household global minute-averaged current intensity (in ampere)
-Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
-Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
-Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

Scripts
========
All of the plots in this reporsitory are taking data from dates 2007-02-01 and 2007-02-02
- Plot1.R plots the histogram of frequency of each Household Global Active Power Consumption
- Plot2.R plots the Household Global Active Power consumption over time for the timeframe of concern
- Plot3.R plots the 3 buckets of energy consuming devices for their power consumption over time for the timeframe of concern
- Plot4.R plots the summary of Plot2 and Plot3 along with the Household Global Reactive Power Consumption and the Voltage over time for the given timeframe

System Requirements
=====================
The scripts are developed through the following system:
-Processor: Intel(R) Core(TM) i5-3317U CPU @ 1.70GHz 1.70 GHz
-Installed memory(RAM): 4.00 GB
-System Type: 64-bit Operating Ststem, x64-based processor
-Platform: Windows 8.1 Pro
-R Version: R-3.1.2
