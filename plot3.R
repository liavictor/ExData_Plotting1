### Exploratory Data Analysis Course Project 1: Codes to create plot #3: Energy sub metering
### make sure to download source data and unzip file in the working directory.

## step 1: load the data from unzipped text file
SourceData <- "./household_power_consumption.txt"
data <- read.table(SourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## step 2: subset the data: "We will only be using data from the dates 2007-02-01 and 2007-02-02"
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert the data & time variables into datetime variable.
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## step 3: plot the #3 graph png file in the working directory
png("plot3.png", width=480, height=480)
plot(datetime, as.numeric(subData$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(datetime, as.numeric(subData$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()

## Codes for using with function to crete #3 graph
# newsub <- cbind(datetime, subData)
# with(newsub, plot(datetime,as.numeric(newsub$Sub_metering_1),type="l", ylab="Energy sub metering", xlab=""))
# with(newsub, lines(datetime,as.numeric(newsub$Sub_metering_2),type="l", col="red"))
# with(newsub, lines(datetime,as.numeric(newsub$Sub_metering_3),type="l", col="blue"))
# legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

## step 4: this step is additional, it is just for reviewing plot #3 on screen.
#install.packages('magick')

library(magick)
img <- magick::image_read('./plot3.png')
print(img)
