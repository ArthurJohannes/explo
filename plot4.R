
## plot 4 

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

## plotting panel 1 on screen device

par (mfrow = c (2,2))

plot (subbie02$var02, subbie02$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines (subbie02$var02, subbie02$Global_active_power)


## code voor plotting voltage panel

plot (subbie02$var02, subbie$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines (subbie02$var02, subbie$Voltage)

## code for plotting submetering panel 

plot (subbie02$var02, subbie02$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")


lines (subbie02$var02, subbie02$Sub_metering_1, col = "black")
lines (subbie02$var02, subbie02$Sub_metering_2, col = "red")
lines (subbie02$var02, subbie02$Sub_metering_3, col = "blue")


legend ("topright", legend = c ("Sub_metering_1"      , "Sub_metering_2      ", "Sub_metering_3      "), lwd = c (1,1,1), col = c ("black", "red", "blue"), cex = 0.5)


## code for plotting reactive power panel

plot (subbie02$var02, subbie$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines (subbie02$var02, subbie$Global_reactive_power)

## saving graph to png file

dev.copy (png, file = "plot4.png")

dev.off ()