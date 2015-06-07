
library(lubridate)

##  Function for reading Household Power Data into R, saving as an RDS and not reimporting on subsequent runs of the script set.
getData <- function() {
  
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

## load data - from RDS if already created or from original downloaded file
plotdata <- getData()

## generate plot

hist(plotdata$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

## print to PNG
dev.copy(png, file="plot1.png")
dev.off()


