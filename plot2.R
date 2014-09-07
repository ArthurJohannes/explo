
## plot2

## setting working directory

setwd("C:/Users/Arthur/Desktop/CourseraR/exploratory/exdata_data_household_power_consumption")

## reading limited nr of rows including 2 relevant dates

testread <- read.csv ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 125000)

## subsetting for 2 days

use <- testread$Date == "1/2/2007"  | testread$Date == "2/2/2007"
subbie <- testread [use,]

## creating DateTime variable

var01 <- paste (subbie$Date, subbie$Time)
var02 <- strptime (var01, format = "%d/%m/%Y %H:%M:%S")

## adding DateTime variable to dataframe

subbie02 <- cbind (subbie, var02)

## plotting on screen device

plot (subbie02$var02, subbie02$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines (subbie02$var02, subbie02$Global_active_power)

## copying to png file

dev.copy (png, file = "plot2.png")

dev.off ()
