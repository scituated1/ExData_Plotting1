
library(lubridate)

getData  <- function() {
  
  household_RDS_data <- "household_power_07feb1_2.rds"
  
  if (file.exists(household_RDS_data)) {
    
    plotdata <- readRDS(household_RDS_data) 
    
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
    
    plotdata
  }
}

plotdata <- getData()

png("plot3.png",width=480,height=480)

plot(plotdata$dateTime,plotdata$Sub_metering_1,type="n",xlab= "",ylab="Energy sub metering")
lines(plotdata$dateTime,plotdata$Sub_metering_1, col="black")
lines(plotdata$dateTime,plotdata$Sub_metering_2, col="red")
lines(plotdata$dateTime,plotdata$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2 )


dev.copy(png, file="plot3.png")

dev.off()


