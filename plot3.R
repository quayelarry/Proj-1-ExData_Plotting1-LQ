

wd <- "~/ExData_Plotting1-LQ"

setwd("~/courseraWD/data")

#Reading, naming and subsetting power consumption data
data<- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  stringsAsFactors = FALSE)

## Subsetting data for date range
HsePower_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
HsePower_data$Date <- as.Date(HsePower_data$Date,  format= "%d/%m/%y")
HsePower_data$Time <- strptime(HsePower_data$Time, format="%H:%M:%S")
HsePower_data[1:1440,"Time"] <- format(HsePower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
HsePower_data[1441:2880,"Time"] <- format(HsePower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(HsePower_data$Time,HsePower_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(HsePower_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(HsePower_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(HsePower_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

setwd(wd)
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
