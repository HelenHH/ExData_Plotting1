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

#plot 4
plot4 <- function() {
        png(file="plot4.png",width=480,height=480)
        par(mfrow = c(2,2))
        x<- subdata$Datetimes
        y1 <-subdata$Global_active_power
        y2 <-subdata$Sub_metering_1
        y3 <-subdata$Sub_metering_2
        y4 <-subdata$Sub_metering_3
        y5<- subdata$Voltage
        y6<- subdata$Global_reactive_power
        #plot1
        plot(x, y1, type= "l", xlab= "", ylab = "Global Active Power")
        #plot2
        plot(x, y5, type= "l", xlab = "datetime", ylab = "Voltage")
        #plot3
        plot(x, y2, type="l", xlab="", ylab="Energy sub metering")
        lines(x, y3,col="red")
        lines(x, y4,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
               lty=c(1,1), bty ="n", cex=0.5)
        #plot4
        plot(x, y6, type= "l", xlab = "datetime", ylab = "Global Reactive Power")       
        dev.off()
        cat("/Users/zhihuang/Desktop/Exploratory_Data/project_1/plot4")
}
plot4()