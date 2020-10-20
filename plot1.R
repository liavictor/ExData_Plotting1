### Exploratory Data Analysis Course Project 1: Codes to create plot #1 Histogram for "Global Active Power"
### make sure to download source data and unzip file in the working directory.


## step 1 load the data from unzipped text file
SourceData <- "./household_power_consumption.txt"
data <- read.table(SourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## step 2 subset the data: "We will only be using data from the dates 2007-02-01 and 2007-02-02"
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## step 3 plot the #1 graph on screen for visualization in R
hist(as.numeric(subData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## step 4 plot the #1 graph png file in the working directory.
png("plot1.png", width=480, height=480)
hist(as.numeric(subData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
