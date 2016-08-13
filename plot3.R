plot3<-function(x){
  
  #PUT THE FILE NAME INTO A DATA FILE VARIABLE  
  dataFile="household_power_consumption.txt"
  
  #READ THE DATA FILE USING READ.TABLE FUNCTION WITH SEPARATOR, HEADER AND '?' AS THE NA.STRINGS
  energy_usage_data <- read.table(dataFile,  sep=";", na.strings = "?", header=TRUE,stringsAsFactors=FALSE)
  
  #FILTER ONLY THOSE WITH DATE RANGE BETWEEN 2007-02-01 AND 2007-02-02
  energyDataSubset <- energy_usage_data[energy_usage_data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #FILTER OUR THOSE NON AVAILABLE DATA
  energyData <-na.omit(energyData)
  
  #CREATE A COLUMN ON THE DATA TABLE WHICH COMBINES DATE AND TIME
  energyData$Timestamp <-paste(energyData$Date, energyData$Time)    
  
  #PLOT THE FIRST DATA WITH Sub_metering_1
  plot(strptime(energyData$Timestamp, "%d/%m/%Y %H:%M:%S"), energyData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  
  #PLOT THE SECOND DATA WITH Sub_metering_2
  lines(strptime(energyData$Timestamp, "%d/%m/%Y %H:%M:%S"), energyData$Sub_metering_2, col = "red", type = "l" )
  
  #PLOT THE THIRD DATA WITH Sub_metering_3
  lines(strptime(energyData$Timestamp, "%d/%m/%Y %H:%M:%S"), energyData$Sub_metering_3, col = "blue" , type = "l")
  
  #ADD THE PLOT LEGEND
  color=c("Black", "red", "blue")
  legendname=c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend("topright", lty= 1, col = color, legend = legendname,cex=.8)
  
}