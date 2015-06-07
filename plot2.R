
library(lubridate)

##  function to get data - will read RDS file if it exists or load file from scratch and create subsetted and formatted RDS if it doesn't exist.
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
##Get Data
plotdata <- getData()

##Generate Plot

plot(plotdata$dateTime,plotdata$Global_active_power,type="n",xlab= "",ylab="Global Active Power (kilowatts)")
lines(plotdata$dateTime,plotdata$Global_active_power)

## write plot to PNG
dev.copy(png, file="plot2.png")
dev.off()


