plot1<-function(x){

#PUT THE FILE NAME INTO A DATA FILE VARIABLE  
dataFile="household_power_consumption.txt"

#READ THE DATA FILE USING READ.TABLE FUNCTION WITH SEPARATOR, HEADER AND '?' AS THE NA.STRINGS
energy_usage_data <- read.table(dataFile,  sep=";", na.strings = "?", header=TRUE,stringsAsFactors=FALSE)

#FILTER ONLY THOSE WITH DATE RANGE BETWEEN 2007-02-01 AND 2007-02-02
energyDataSubset <- energy_usage_data[energy_usage_data$Date %in% c("1/2/2007","2/2/2007") ,]

#FILTER OUR THOSE NON AVAILABLE DATA
energyData <-na.omit(energyData)

#CONSTRUCT THE HISTOGRAM
hist(energyData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")


}