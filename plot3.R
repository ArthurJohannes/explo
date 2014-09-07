

## plot3 


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

## adding variable to dataframe

subbie02 <- cbind (subbie, var02)

##par (mfrow  = c (1,1)) ##default
##par ("cex" = 1.0)     ## default

plot (subbie02$var02, subbie02$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")


lines (subbie02$var02, subbie02$Sub_metering_1, col = "black")
lines (subbie02$var02, subbie02$Sub_metering_2, col = "red")
lines (subbie02$var02, subbie02$Sub_metering_3, col = "blue")


legend ("topright", legend = c ("Sub_metering_1      ", "Sub_metering_2      ", "Sub_metering_3      "), lwd = c (1,1,1), col = c ("black", "red", "blue"), cex = 0.5)

## copying graph to png file

dev.copy (png, file = "plot3.png")

dev.off ()