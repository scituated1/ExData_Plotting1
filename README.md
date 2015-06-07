
## Contents
  This repo contains the following:
  README.md -  Documentation on the contents, the data, the process and the execution instructions
  4 pairs of R script / .png files.   The R script generates the chart in the corresponing .png file.
   * plot1.R / plot1.png -  A histogram of variable Global Active Power
   * plot2.R / plot2.png -  A line plot showing Global Active Power usage in kilowatts over the timeframe
   * plot3.R / plot3.png -  A line plot showing 3 sub-metering measures across the timeframe
   * plot4.R / plot4.png -  4 plots (plot 2, Voltage line plot, plot 3 and a global reactive power line chart across time)
  
   
   
Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, these scripts use the "Individual household
electric power consumption Data Set" from the Coursera Exploratory Data Analysis website:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>


## Loading the data

The scripts assume that the data has been downloaded from the link above and uncompressed into your working directory.

The first time any of the 4 scripts is executed,  the file will be loaded into a data frame, the dates are converted to POSIXlt format and a new field for the combined date time is created.   The data is subsetted for the dates specified in the assignment - February 1 & 2, 2007.  This prepared data is saved to an RDS.

Subsequent execution of any of the 4 scripts will simply load the RDS file into the script.




## Generating plots

Each of the scripts generates the specified plot, saves the plot to a .png in the working directory and closes the devices. 




