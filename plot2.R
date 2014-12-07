plot1 <- function(){

  #Our overall goal here is simply to examine how household energy usage 
  #varies over a 2-day period in February, 2007. Your task is to reconstruct 
  #the following plots below, all of which were constructed using the base 
  #plotting system.
  
  #PLOT 2 Replication
  
  #uncode the bleow and install dplyr packages if necessary
  #install.packages("dplyr")
  
  library(dplyr)
  
  cdata = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  cdata$DateTime <- paste(cdata$Date, cdata$Time)
  cdata$DateTime <- as.POSIXct(cdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  subsetted <- filter(cdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
  
  #start plotting data to a PNG file
  png(file="plot2.png", width=480, height=480)
  plot(subsetted$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Acitve Power (kilowatts")
  axis.POSIXct(1,subsetted$DateTime, format="%a")
  dev.off()

}
