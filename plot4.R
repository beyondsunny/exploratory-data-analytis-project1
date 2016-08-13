plot4<-function(x){
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
  
  #COERCE ALL AXIS DATA TO RELEVANT TYPES
  energyData_datetime <- strptime(energyData$Timestamp, "%d/%m/%Y %H:%M:%S") 
  energyData_globalReactivePower <- as.numeric(energyData$Global_reactive_power)
  energyData_globalActivePower <- as.numeric(energyData$Global_active_power)
  energyData_voltage <- as.numeric(energyData$Voltage)
  energyData_subMetering1 <- as.numeric(energyData$Sub_metering_1)
  energyData_subMetering2 <- as.numeric(energyData$Sub_metering_2)
  energyData_subMetering3 <- as.numeric(energyData$Sub_metering_3)
  
  #PUT THE SCREEN DEVICE INTO 2 COLUMN AND 2 ROW DISPLAY
  par(mfrow = c(2, 2)) 
  
  #PLOT THE FIRST TOP LEFT CHART
  plot(energyData_datetime, energyData_globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

  #PLOT THE SECOND TOP RIGHT CHART
  plot(energyData_datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #PLOT THE THIRD BOTTOM LEFT CHART
  plot(energyData_datetime, energyData_subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(energyData_datetime, energyData_subMetering2, type="l", col="red")
  lines(energyData_datetime, energyData_subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o",cex=.8)
  
  #PLOT THE FOURTH BOTTOM RIGHT CHART
  plot(energyData_datetime, energyData_globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
  
}
  