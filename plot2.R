
wd <- "~/ExData_Plotting1-LQ"
setwd("~/courseraWD/data")
getwd()


#Reading, naming and subsetting power consumption data
data<- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  stringsAsFactors = FALSE)


#  data$Date <- as.Date(data$Date,  "%d/%m/%y")

## Subsetting data for date range
HsePower_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
HsePower_data$Date <- as.Date(HsePower_data$Date,  format= "%d/%m/%y")
HsePower_data$Time <- strptime(HsePower_data$Time, format="%H:%M:%S")
HsePower_data[1:1440,"Time"] <- format(HsePower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
HsePower_data[1441:2880,"Time"] <- format(HsePower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(HsePower_data$Time,as.numeric(as.character(HsePower_data$Global_active_power)),
      type="l",xlab="",ylab="Global Active Power (kilowatts)") 




# annotating graph
title(main="Global Active Power Vs Time")

setwd(wd)

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
