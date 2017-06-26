
wd <- "~/ExData_Plotting1-LQ"
setwd("~/courseraWD/data")
getwd()


#Reading, naming and subsetting power consumption data
data<- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  stringsAsFactors = FALSE)


## data$Date <- as.Date(data$Date,format ="%d/%m/%y")

## Subsetting data for date range
## HsePower_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
HsePower_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


HsePower_data$Date <- as.Date(HsePower_data$Date, format=  "%d/%m/%y")

# ploting a histogram
hist(as.numeric(as.character(HsePower_data$Global_active_power)),col="red", 
     main="Global Active Power",xlab="Global Active Power(kilowatts)")



setwd(wd)

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!


