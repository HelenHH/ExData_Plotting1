#Data for graph
data<- read.table("/Users/zhihuang/Desktop/Exploratory_Data/project_1/household_power_consumption.txt", 
                  header= TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
str(data)
names(data)
dim(data)
head(data)
library(pryr)
object_size(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 
subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
subdata <- transform(subdata, Datetimes=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))
subdata$Voltage <- as.numeric(as.character(subdata$Voltage))
subdata$Global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))

#plot2
plot2 <- function() {
  x<- subdata$Datetimes
  y<- subdata$Global_active_power
  plot(x, y, type= "l", xlab= "", ylab = "Global Active Power (kilowatts)", cex.lab=0.8, cex.axis=0.7)
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("/Users/zhihuang/Desktop/Exploratory_Data/project_1/plot2")
}
plot2()


