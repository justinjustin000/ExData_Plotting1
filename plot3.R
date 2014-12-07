plot3 <- function(){

  #Our overall goal here is simply to examine how household energy usage 
  #varies over a 2-day period in February, 2007. Your task is to reconstruct 
  #the following plots below, all of which were constructed using the base 
  #plotting system.
  
  #PLOT 3 Replication
  
  #uncode the bleow and install dplyr packages if necessary
  #install.packages("dplyr")
  
  library(dplyr)
  
  cdata = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  cdata$DateTime <- paste(cdata$Date, cdata$Time)
  cdata$DateTime <- as.POSIXct(cdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  subsetted <- filter(cdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
  
  #start plotting data to a PNG file
  png(file="plot3.png", width=480, height=480)
  plot(subsetted$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Global Acitve Power (kilowatts")
  lines(subsetted$Sub_metering_2, type="l", xaxt="n", col="Blue")
  lines(subsetted$Sub_metering_3, type="l", xaxt="n", col="Red")
  axis.POSIXct(1,subsetted$DateTime, format="%a")
  legend('topright',c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=.8, col=c("black","red", "blue"), lty=c(1,1,1))
  dev.off()

}
