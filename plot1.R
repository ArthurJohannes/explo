
## plot1

## setting working directory

setwd("C:/Users/Arthur/Desktop/CourseraR/exploratory/exdata_data_household_power_consumption")

## reading limited nr of rows including 2 relevant dates

testread <- read.csv ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 125000)

## subsetting for dates 

use <- testread$Date == "1/2/2007"  | testread$Date == "2/2/2007"
subbie <- testread [use,]

par (mar = c(5.1, 4.1, 4.1, 2.1))

hist (subbie$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )

dev.copy (png, file = "plot1.png")

dev.off ()