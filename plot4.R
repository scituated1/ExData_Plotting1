
library(lubridate)

##  Function for reading Household Power Data into R, saving as an RDS and not reimporting on subsequent runs of the script set.

getData  <- function() {
  
  household_RDS_data <- "household_power_07feb1_2.rds"
  
  if (file.exists(household_RDS_data)) {
    print("loading from stored RDS...")
    plotdata <- readRDS("household_power_07feb1_2.rds") 
    
  } else {
    powerdatafile <- "household_power_consumption.txt"
    plotdataRaw <- read.table(powerdatafile, header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings="?")
    closeAllConnections()
    
    plotdataRaw$dateTime <- paste(plotdataRaw$Date, plotdataRaw$Time, sep = " ")
    plotdataRaw$dateTime <- dmy_hms(plotdataRaw$dateTime)
    
    plotdataRaw$Date <- as.Date(plotdataRaw$Date,"%d/%m/%Y")
    plotdataRaw$Global_active_power <- as.numeric(plotdataRaw$Global_active_power)
    plotdata <- plotdataRaw[plotdataRaw$Date == "2007/02/01" | plotdataRaw$Date == "2007/02/02",]
    saveRDS(plotdata,household_RDS_data)
    remove(plotdataRaw) 
    
  }
  
  plotdata
  
}

plotdata <- getData()                   #Get data

png("plot4.png",width=480,height=480)   #open PNG device

par(mfrow=c(2,2))                       #set device for 4 charts

              
with(plotdata, {                        #plot data #
  
  plot(dateTime,Global_active_power,type="n",xlab= "",ylab="Global Active Power")
    lines(dateTime,Global_active_power)
  plot(dateTime,Voltage,type="n", xlab="", ylab="Voltage)")
    lines(dateTime,Voltage)
  plot(dateTime,Sub_metering_1,type="n",xlab= "",ylab="Energy sub metering")
    lines(dateTime,plotdata$Sub_metering_1, col="black")
    lines(dateTime,plotdata$Sub_metering_2, col="red")
    lines(dateTime,plotdata$Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=1, lwd=2, cex=.8, border=white )
  plot(dateTime,Global_reactive_power,type="n",xlab= "datetime",ylab="Global_reactive_power")
    lines(dateTime,Global_reactive_power)
})

dev.copy(png, file="plot4.png")

dev.off()


