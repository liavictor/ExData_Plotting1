### Exploratory Data Analysis Course Project 1: Codes to create plot #4
### make sure to download source data and unzip file in the working directory.

## step 1: load the data from unzipped text file
SourceData <- "./household_power_consumption.txt"
data <- read.table(SourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## step 2: subset the data: "We will only be using data from the dates 2007-02-01 and 2007-02-02"
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## step 3: convert the data & time variables to datetime variable and binding it into new sub-data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
newsub <- cbind(datetime, subData)

## step 4: set a plot panel for 2x2=4 plots and plot $4 graph in the working  directory
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(newsub,{
        plot(datetime, as.numeric(newsub$Global_active_power),type="l",  xlab="",ylab="Global Active Power")  
        plot(datetime, as.numeric(newsub$Voltage), type="l",xlab="datetime",ylab="Voltage")
        plot(datetime, as.numeric(newsub$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering")
        lines(datetime, as.numeric(newsub$Sub_metering_1))
        lines(datetime, as.numeric(newsub$Sub_metering_2),col="red")
        lines(datetime, as.numeric(newsub$Sub_metering_3),col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.9, bty="n", col=c("black", "red", "blue"))
        plot(datetime, as.numeric(newsub$Global_active_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()

## step 5: this step is additional, it is just for reviewing plot #4 on screen.
#install.packages('magick')

library(magick)
img <- magick::image_read('./plot4.png')
print(img)
