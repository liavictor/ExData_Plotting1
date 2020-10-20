### Exploratory Data Analysis Course Project 1: Codes to create plot #2
### make sure to download source data and unzip file in the working directory.

## step 1 load the data from unzipped text file
SourceData <- "./household_power_consumption.txt"
data <- read.table(SourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## step 2 subset the data: "We will only be using data from the dates 2007-02-01 and 2007-02-02"
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert the data & time variables into datetime variable.
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## step 3 plot the #2 graph on screen for visualization in R
plot(datetime, as.numeric(subData$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active power (kilowatts)")

## step 4 plot the #2 graph png file into the working directory.
png("plot2.png", width=480, height=480)
plot(datetime, as.numeric(subData$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
