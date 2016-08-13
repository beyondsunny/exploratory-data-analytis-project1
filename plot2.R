plot2<-function(x){
  #PUT THE FILE NAME INTO A DATA FILE VARIABLE  
  dataFile="household_power_consumption.txt"
  
  #READ THE DATA FILE USING READ.TABLE FUNCTION WITH SEPARATOR, HEADER AND '?' AS THE NA.STRINGS
  energy_usage_data <- read.table(dataFile,  sep=";", na.strings = "?", header=TRUE,stringsAsFactors=FALSE)
  
  #FILTER ONLY THOSE WITH DATE RANGE BETWEEN 2007-02-01 AND 2007-02-02
  energyDataSubset <- energy_usage_data[energy_usage_data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #FILTER OUR THOSE NON AVAILABLE DATA
  energyData <-na.omit(energyData)
  

  #COMBINE BOTH DATE AND TIME FROM energyData
  concatenate_datetime <- strptime(paste(energyData$Date, energyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
  
  #CAST THE globalActivePower TO NUMERIC
  globalActivePower <- as.numeric(energyData$Global_active_power)
  
  #BEGIN PLOTTING THE DATA
  plot(concatenate_datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
}