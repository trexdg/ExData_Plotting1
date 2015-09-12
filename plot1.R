## Read the table and store it in alldata
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## Get the required data from 2007-02-01 until 2007-02-02 only and remove alldata
reqdata <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

## Converts Date and Time variables to Date/Time classes
dtime <- paste(as.Date(reqdata$Date), reqdata$Time)
reqdata$Datetime <- as.POSIXct(dtime)

## Plot the histogram 
hist(reqdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Save the histogram into .png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()